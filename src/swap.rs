#![no_std]
#![feature(generic_associated_types)]

elrond_wasm::imports!();
elrond_wasm::derive_imports!();

#[derive(Clone, NestedEncode, NestedDecode, TopEncode, TopDecode, TypeAbi)]
pub struct Offer<M: ManagedTypeApi> {
    pub owner: ManagedAddress<M>,
    pub offered_token: EsdtTokenPayment<M>,
    pub wanted_token: EgldOrEsdtTokenPayment<M>,
    pub quantity: BigUint<M>,
}
#[derive(ManagedVecItem, Clone, NestedEncode, NestedDecode, TopEncode, TopDecode, TypeAbi)]
pub struct OfferOut<M: ManagedTypeApi> {
    pub index: u64,
    pub owner: ManagedAddress<M>,
    pub offered_token_identifier: TokenIdentifier<M>,
    pub offered_token_nonce: u64,
    pub offered_token_amount: BigUint<M>,
    pub wanted_token_identifier: EgldOrEsdtTokenIdentifier<M>,
    pub wanted_token_nonce: u64,
    pub wanted_token_amount: BigUint<M>,
    pub quantity: BigUint<M>,
}

#[derive(TopEncode, TopDecode, NestedEncode, NestedDecode, PartialEq, Clone, Debug, TypeAbi)]
pub struct DataNftAttributes<M: ManagedTypeApi> {
    pub data_stream_url: ManagedBuffer<M>,
    pub data_preview_url: ManagedBuffer<M>,
    pub data_marchal_url: ManagedBuffer<M>,
    pub creator: ManagedAddress<M>,
    pub creation_time: u64,
}

#[elrond_wasm::contract]
pub trait DataMarket {
    #[init]
    fn init(&self) {}

    #[only_owner]
    #[endpoint(setFees)]
    fn set_fees(&self, adder_fee: BigUint, accepter_fee: BigUint) {
        self.percentage_from_accepter_to_owner().set(&accepter_fee);
        self.percentage_from_adder_to_owner().set(&adder_fee);
    }

    #[only_owner]
    #[endpoint(addAcceptedToken)]
    fn add_accepted_token(&self, token_id: TokenIdentifier) {
        self.accepted_tokens().insert(token_id);
    }

    #[only_owner]
    #[endpoint(addAcceptedPayment)]
    fn add_accepted_payment(&self, token_id: EgldOrEsdtTokenIdentifier) {
        self.accepted_payments().insert(token_id);
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
        let mut token_offered = self.call_value().single_esdt();
        require!(
            self.accepted_payments().contains(&wanted_token_id),
            "Token not accepted"
        );
        require!(
            self.accepted_tokens()
                .contains(&token_offered.token_identifier),
            "Token not accepted"
        );
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
                &caller == &offer.owner || &caller == &sc_owner,
                "Only special addresses can cancel offers"
            );
            self.send().direct_esdt(
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
    fn accept_offer(&self, index: u64, quantity: BigUint) -> BigUint {
        require!(!self.paused().get(), "Contract is paused");
        let caller = self.blockchain().get_caller();
        let moffer = self.offers().get(&index);
        let payment = self.call_value().egld_or_single_esdt();

        if let Some(mut offer) = moffer {
            let accepter_fee = self.percentage_from_accepter_to_owner().get();
            let adder_fee = self.percentage_from_adder_to_owner().get();
            let mut correct_payment_amount = &offer.wanted_token.amount * &quantity;
            let fee_from_accepter =
                &correct_payment_amount * &accepter_fee / &BigUint::from(10000u64);
            correct_payment_amount += &fee_from_accepter;
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

            let token_data = self.blockchain().get_esdt_token_data(
                &self.blockchain().get_sc_address(),
                &offer.offered_token.token_identifier,
                offer.offered_token.token_nonce,
            );

            let token_attributes = token_data.decode_attributes::<DataNftAttributes<Self::Api>>();
            let rlts = &correct_payment_amount * &token_data.royalties / BigUint::from(10000u64);
            let fee_from_adder = &correct_payment_amount * &adder_fee / BigUint::from(10000u64);
            if rlts > BigUint::zero() {
                self.send().direct(
                    &token_attributes.creator,
                    &offer.wanted_token.token_identifier,
                    offer.wanted_token.token_nonce,
                    &rlts,
                );
            }

            self.send().direct(
                &offer.owner,
                &offer.wanted_token.token_identifier,
                offer.wanted_token.token_nonce,
                &(&correct_payment_amount - &rlts - &fee_from_adder - &fee_from_accepter),
            );

            self.send().direct_esdt(
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
            rlts
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

    fn offer_to_offer_out(
        &self,
        index: u64,
        offer: Offer<Self::Api>,
        fee: &BigUint,
    ) -> OfferOut<Self::Api> {
        OfferOut {
            index: index,
            owner: offer.owner,
            offered_token_identifier: offer.offered_token.token_identifier,
            offered_token_nonce: offer.offered_token.token_nonce,
            offered_token_amount: offer.offered_token.amount,
            wanted_token_identifier: offer.wanted_token.token_identifier,
            wanted_token_nonce: offer.wanted_token.token_nonce,
            wanted_token_amount: offer.wanted_token.amount * (fee + &BigUint::from(10000u64))
                / BigUint::from(10000u64),
            quantity: offer.quantity,
        }
    }

    #[view(viewOffers)]
    fn view_offers(&self, from: u64, to: u64) -> ManagedVec<OfferOut<Self::Api>> {
        let mut offers = ManagedVec::new();
        let mut nr = 0;
        let fee = self.percentage_from_accepter_to_owner().get();
        for (index, offer) in self.offers().iter() {
            if nr >= from {
                if nr < to {
                    offers.push(self.offer_to_offer_out(index, offer, &fee));
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
        let fee = self.percentage_from_accepter_to_owner().get();
        if let Some(offer) = offer {
            Some(self.offer_to_offer_out(index, offer, &fee))
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

    #[storage_mapper("accepted_tokens")]
    fn accepted_tokens(&self) -> SetMapper<TokenIdentifier>;

    #[storage_mapper("accepted_payments")]
    fn accepted_payments(&self) -> SetMapper<EgldOrEsdtTokenIdentifier>;

    #[storage_mapper("percentage_from_adder_to_owner")]
    fn percentage_from_adder_to_owner(&self) -> SingleValueMapper<BigUint>;

    #[storage_mapper("percentage_from_accepter_to_owner")]
    fn percentage_from_accepter_to_owner(&self) -> SingleValueMapper<BigUint>;

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
