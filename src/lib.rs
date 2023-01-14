#![no_std]

elrond_wasm::imports!();
elrond_wasm::derive_imports!();

use crate::{storage::DataNftAttributes, storage::Offer};

pub mod events;
pub mod requirements;
pub mod storage;
pub mod views;

#[elrond_wasm::contract]
pub trait DataMarket:
    storage::StorageModule
    + requirements::RequirementsModule
    + views::ViewsModule
    + events::EventsModule
{
    #[init]
    fn init(&self) {
        self.is_paused().set(true);
        self.pause_toggle_event(&true);
        self.percentage_cut_from_buyer().set(BigUint::from(200u64));
        self.percentage_cut_from_seller().set(BigUint::from(200u64));
        self.maximum_payment_fee()
            .set(BigUint::from(10000u64) * BigUint::from(10u64).pow(18u32));
    }

    #[endpoint(setFees)]
    fn set_fees(&self, seller_fee: BigUint, buyer_fee: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.percentage_cut_from_buyer().set(&buyer_fee);
        self.percentage_cut_from_seller().set(&seller_fee);
    }

    #[endpoint(addAcceptedToken)]
    fn add_accepted_token(&self, token_id: TokenIdentifier) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.accepted_tokens().insert(token_id);
    }

    #[endpoint(addAcceptedPayment)]
    fn add_accepted_payment(&self, token_id: EgldOrEsdtTokenIdentifier) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.accepted_payments().insert(token_id);
    }

    #[endpoint(setMaximumPaymentFee)]
    fn set_maximum_payment_fee(&self, maximum_payment_fee: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.maximum_payment_fee().set(&maximum_payment_fee);
    }

    // Endpoint that will be used by privileged address to change the contract pause value.
    #[endpoint(setIsPaused)]
    fn set_is_paused(&self, is_paused: bool) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.pause_toggle_event(&is_paused);
        self.is_paused().set(is_paused);
    }

    #[payable("*")]
    #[endpoint(addOffer)]
    fn add_offer(
        &self,
        payment_token_id: EgldOrEsdtTokenIdentifier,
        payment_token_nonce: u64,
        payment_token_fee: BigUint,
        opt_quantity: OptionalValue<BigUint>,
    ) {
        self.require_trade_is_ready();
        let caller = self.blockchain().get_caller();

        let mut data_nft = self.call_value().single_esdt();
        require!(
            self.accepted_payments().contains(&payment_token_id),
            "Token not accepted"
        );
        require!(
            self.accepted_tokens().contains(&data_nft.token_identifier),
            "Token not accepted"
        );
        require!(
            payment_token_fee <= self.maximum_payment_fee().get(),
            "Payment fee too high"
        );
        let payment_token =
            EgldOrEsdtTokenPayment::new(payment_token_id, payment_token_nonce, payment_token_fee);

        let real_quantity = BigUint::from(1u64);
        match opt_quantity {
            OptionalValue::Some(existing_quantity) => {
                require!(existing_quantity > 0, "Quantity must be greater than 0");
                require!(
                    data_nft.amount >= existing_quantity,
                    "Quantity must be less than offered token amount"
                );

                require!(
                    &data_nft.amount % &existing_quantity == 0,
                    "Quantity must be a divisor of offered token amount"
                );
                data_nft.amount = &data_nft.amount / &existing_quantity;

                let offer = Offer {
                    owner: caller,
                    offered_token: data_nft,
                    wanted_token: payment_token,
                    quantity: existing_quantity,
                };
                let index = self.create_offer_index();
                self.offers().insert(index, offer);
            }
            OptionalValue::None => {
                let offer = Offer {
                    owner: caller,
                    offered_token: data_nft,
                    wanted_token: payment_token,
                    quantity: real_quantity,
                };
                let index = self.create_offer_index();
                self.offers().insert(index, offer);
            }
        };
    }

    #[endpoint(cancelOffer)]
    fn cancel_offer(&self, index: u64) {
        self.require_trade_is_ready();
        let offer_to_cancel = self.offers().get(&index);
        let caller = self.blockchain().get_caller();
        let sc_owner = self.blockchain().get_owner_address();

        match offer_to_cancel {
            Some(offer) => {
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
            }
            None => sc_panic!("Offer not found"),
        }
    }

    #[payable("*")]
    #[endpoint(acceptOffer)]
    fn accept_offer(&self, index: u64, quantity: BigUint) -> BigUint {
        self.require_trade_is_ready();
        let caller = self.blockchain().get_caller();
        let offer_to_accept = self.offers().get(&index);
        let payment = self.call_value().egld_or_single_esdt();

        match offer_to_accept {
            Some(mut offer) => {
                let token_data = self.blockchain().get_esdt_token_data(
                    &self.blockchain().get_sc_address(),
                    &offer.offered_token.token_identifier,
                    offer.offered_token.token_nonce,
                );
                let token_attributes =
                    token_data.decode_attributes::<DataNftAttributes<Self::Api>>();

                require!(&caller != &offer.owner, "You cannot accept your own offer");
                require!(
                    &caller != &token_attributes.creator,
                    "You cannot accept your own offer",
                );
                let buyer_fee = self.percentage_cut_from_buyer().get();
                let seller_fee = self.percentage_cut_from_seller().get();
                let mut correct_payment_amount = &offer.wanted_token.amount * &quantity;
                let mut correct_payment_amount_clone = correct_payment_amount.clone();
                let fee_from_buyer =
                    &correct_payment_amount * &buyer_fee / &BigUint::from(10000u64);
                correct_payment_amount += &fee_from_buyer;
                require!(quantity <= offer.quantity, "Not enough quantity");
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
                    "Wrong token payment amount"
                );

                let fee_from_seller =
                    &correct_payment_amount * &seller_fee / BigUint::from(10000u64);

                correct_payment_amount_clone -= &fee_from_seller;

                let rlts =
                    &correct_payment_amount_clone * &token_data.royalties / BigUint::from(10000u64);

                // If the creator setup royalties and is not the offer owner he can benefit the royalties
                if rlts > BigUint::zero() && token_attributes.creator != offer.owner {
                    self.send().direct(
                        &token_attributes.creator,
                        &offer.wanted_token.token_identifier,
                        offer.wanted_token.token_nonce,
                        &rlts,
                    );
                    self.send().direct(
                        &offer.owner,
                        &offer.wanted_token.token_identifier,
                        offer.wanted_token.token_nonce,
                        &(&correct_payment_amount - &rlts - &fee_from_seller - &fee_from_buyer),
                    );
                } else {
                    // Payment to the data NFT-FT seller
                    self.send().direct(
                        &offer.owner,
                        &offer.wanted_token.token_identifier,
                        offer.wanted_token.token_nonce,
                        &(&correct_payment_amount - &fee_from_seller - &fee_from_buyer),
                    );
                }

                let treasury_address = self.treasury_address().get();

                // Fee goes to treasury address
                // If the creator sells his own NFT-FT he cannot benefit the royalties and are send to treasury

                self.send().direct(
                    &treasury_address,
                    &offer.wanted_token.token_identifier,
                    offer.wanted_token.token_nonce,
                    &(&fee_from_seller + &fee_from_buyer),
                );

                // Data NFT-FT to the buyer
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
            }

            None => sc_panic!("Offer not found"),
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

    // Endpoint used to set the treasury address.
    #[only_owner]
    #[endpoint(setTreasuryAddress)]
    fn set_treasury_address(&self, address: ManagedAddress) {
        self.treasury_address_event(&address);
        self.treasury_address().set(&address);
    }

    // Endpoint that will be used by the owner to change the administrator (privileged) address.
    #[only_owner]
    #[endpoint(setAdministrator)]
    fn set_administrator(&self, administrator: ManagedAddress) {
        self.set_administrator_event(&administrator);
        self.administrator().set(&administrator);
    }
}
