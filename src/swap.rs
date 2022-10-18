#![no_std]
#![feature(generic_associated_types)]

elrond_wasm::imports!();
elrond_wasm::derive_imports!();

#[derive(Clone, NestedEncode, NestedDecode, TopEncode, TopDecode, TypeAbi)]
pub struct Offer<M: ManagedTypeApi> {
    pub owner: ManagedAddress<M>,
    pub offered_token: EgldOrEsdtTokenPayment<M>,
    pub wanted_token: EgldOrEsdtTokenPayment<M>,
    pub quantity: BigUint<M>,
}
#[derive(ManagedVecItem, Clone, NestedEncode, NestedDecode, TopEncode, TopDecode, TypeAbi)]
pub struct OfferOut<M: ManagedTypeApi> {
    pub index: u64,
    pub owner: ManagedAddress<M>,
    pub offered_token_identifier: EgldOrEsdtTokenIdentifier<M>,
    pub offered_token_nonce: u64,
    pub offered_token_amount: BigUint<M>,
    pub wanted_token_identifier: EgldOrEsdtTokenIdentifier<M>,
    pub wanted_token_nonce: u64,
    pub wanted_token_amount: BigUint<M>,
    pub quantity: BigUint<M>,
}

#[elrond_wasm::contract]
pub trait CentralMarket {
    #[init]
    fn init(&self) {}

    #[only_owner]
    #[endpoint(setFundReceiver)]
    fn set_fund_receiver(&self, address: ManagedAddress) {
        self.unique_fund_receiver().set(&address);
    }

    #[only_owner]
    #[endpoint(addToWhitelist)]
    fn add_to_whitelist(&self, address: ManagedAddress) {
        self.offer_adding_whitelist().insert(address);
    }

    #[only_owner]
    #[endpoint(removeFromWhitelist)]
    fn remove_from_whitelist(&self, address: ManagedAddress) {
        self.offer_adding_whitelist().remove(&address);
    }

    #[only_owner]
    #[endpoint(togglePause)]
    fn pause(&self) {
        self.paused().set(!self.paused().get());
    }

    #[endpoint(addOffer)]
    #[payable("*")]
    fn add_offer(
        &self,
        wanted_token_id: EgldOrEsdtTokenIdentifier,
        wanted_token_nonce: u64,
        wanted_token_amount: BigUint,
        quantity: OptionalValue<BigUint>,
    ) -> u64 {
        require!(!self.paused().get(), "Contract is paused");
        let caller = self.blockchain().get_caller();
        let sc_owner = self.blockchain().get_owner_address();
        require!(
            self.offer_adding_whitelist().contains(&caller) || &caller == &sc_owner,
            "Not whitelisted to add offers to market"
        );
        let mut token_offered = self.call_value().egld_or_single_esdt();
        let token_wanted =
            EgldOrEsdtTokenPayment::new(wanted_token_id, wanted_token_nonce, wanted_token_amount);
        let mut real_amount = token_offered.amount.clone();
        let mut real_quantity = BigUint::from(1u64);
        if let OptionalValue::Some(existing_quantity) = quantity {
            require!(existing_quantity > 0, "Quantity must be greater than 0");
            require!(
                token_offered.amount >= existing_quantity,
                "Quantity must be less than offered token amount"
            );
            real_amount = &token_offered.amount / &existing_quantity;
            real_quantity = existing_quantity;
        }
        token_offered.amount = real_amount;

        let offer = Offer {
            owner: caller,
            offered_token: token_offered,
            wanted_token: token_wanted,
            quantity: real_quantity,
        };
        let index = self.create_offer_index();
        self.offers().insert(index, offer);
        index
    }

    #[endpoint(cancelOffer)]
    fn cancel_offer(&self, index: u64) {
        require!(!self.paused().get(), "Contract is paused");
        let moffer = self.offers().get(&index);
        let caller = self.blockchain().get_caller();
        let sc_owner = self.blockchain().get_owner_address();

        if let Some(offer) = moffer {
            require!(
                &caller == &offer.owner
                    || &caller == &sc_owner
                    || self.offer_adding_whitelist().contains(&caller),
                "Only special addresses can cancel offers"
            );
            self.send().direct(
                &offer.owner,
                &offer.offered_token.token_identifier,
                offer.offered_token.token_nonce,
                &(offer.offered_token.amount * offer.quantity),
            );

            self.offers().remove(&index);
            self.empty_offer_indexes().insert(index);
        } else {
            elrond_wasm::sc_panic!("Offer not found");
        }
    }

    #[payable("*")]
    #[endpoint(acceptOffer)]
    fn accept_offer(&self, index: u64, quantity: BigUint) {
        require!(!self.paused().get(), "Contract is paused");
        let caller = self.blockchain().get_caller();
        let moffer = self.offers().get(&index);
        let payment = self.call_value().egld_or_single_esdt();

        if let Some(mut offer) = moffer {
            let correct_payment_amount = &offer.wanted_token.amount * &quantity;
            require!(offer.quantity >= quantity, "Not enough quantity");
            require!(
                payment.token_identifier == offer.wanted_token.token_identifier,
                "Wrong token payment"
            );
            require!(
                payment.token_nonce == offer.wanted_token.token_nonce,
                "Wrong token payment"
            );
            require!(
                payment.amount == correct_payment_amount,
                "Wrong token payment"
            );
            let fund_receiver = self.unique_fund_receiver();
            if fund_receiver.is_empty() {
                self.send().direct(
                    &offer.owner,
                    &offer.wanted_token.token_identifier,
                    offer.wanted_token.token_nonce,
                    &correct_payment_amount,
                );
            } else {
                self.send().direct(
                    &fund_receiver.get(),
                    &offer.wanted_token.token_identifier,
                    offer.wanted_token.token_nonce,
                    &correct_payment_amount,
                );
            }

            self.send().direct(
                &caller,
                &offer.offered_token.token_identifier,
                offer.offered_token.token_nonce,
                &(&offer.offered_token.amount * &quantity),
            );
            if offer.quantity == quantity {
                self.offers().remove(&index);
                self.empty_offer_indexes().insert(index);
            } else {
                offer.quantity -= quantity;
                self.offers().insert(index, offer);
            }
        } else {
            elrond_wasm::sc_panic!("Offer not found");
        }
    }

    fn create_offer_index(&self) -> u64 {
        if self.empty_offer_indexes().is_empty() {
            let index = self.highest_offer_index().get().clone();
            self.highest_offer_index().set(index + 1);
            index
        } else {
            let index = self.empty_offer_indexes().get_by_index(1).clone();
            self.empty_offer_indexes().swap_remove(&index);
            index
        }
    }

    fn offer_to_offer_out(&self, index: u64, offer: Offer<Self::Api>) -> OfferOut<Self::Api> {
        OfferOut {
            index: index,
            owner: offer.owner,
            offered_token_identifier: offer.offered_token.token_identifier,
            offered_token_nonce: offer.offered_token.token_nonce,
            offered_token_amount: offer.offered_token.amount,
            wanted_token_identifier: offer.wanted_token.token_identifier,
            wanted_token_nonce: offer.wanted_token.token_nonce,
            wanted_token_amount: offer.wanted_token.amount,
            quantity: offer.quantity,
        }
    }

    #[view(viewOffers)]
    fn view_offers(&self, from: u64, to: u64) -> ManagedVec<OfferOut<Self::Api>> {
        let mut offers = ManagedVec::new();
        let mut nr = 0;
        for (index, offer) in self.offers().iter() {
            if nr >= from {
                if nr < to {
                    offers.push(self.offer_to_offer_out(index, offer));
                } else {
                    break;
                }
            }
            nr += 1;
        }
        offers
    }

    #[view(viewOffer)]
    fn view_offer(&self, index: u64) -> Option<OfferOut<Self::Api>> {
        let offer = self.offers().get(&index);
        if let Some(offer) = offer {
            Some(self.offer_to_offer_out(index, offer))
        } else {
            None
        }
    }

    #[view(numberOfOffers)]
    fn view_number_of_offers(&self) -> usize {
        self.offers().len()
    }

    //storage
    #[storage_mapper("offers")]
    fn offers(&self) -> MapMapper<u64, Offer<Self::Api>>;

    #[view(getUniqueFundReceiver)]
    #[storage_mapper("unique_fund_receiver")]
    fn unique_fund_receiver(&self) -> SingleValueMapper<ManagedAddress>;

    #[view(offerAddingWhitelist)]
    #[storage_mapper("offer_adding_whitelist")]
    fn offer_adding_whitelist(&self) -> SetMapper<ManagedAddress>;

    #[view(viewEmptyOfferIndexes)]
    #[storage_mapper("empty_offer_indexes")]
    fn empty_offer_indexes(&self) -> UnorderedSetMapper<u64>;

    #[view(viewHighestOfferIndex)]
    #[storage_mapper("highest_offer_index")]
    fn highest_offer_index(&self) -> SingleValueMapper<u64>;

    #[view(viewIsPaused)]
    #[storage_mapper("pause")]
    fn paused(&self) -> SingleValueMapper<bool>;
}
