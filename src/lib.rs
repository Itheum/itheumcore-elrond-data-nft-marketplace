#![no_std]

multiversx_sc::imports!();
multiversx_sc::derive_imports!();

use crate::storage::DataNftAttributes;

pub mod events;
pub mod offer_accept_utils;
pub mod offer_adding_utils;
pub mod requirements;
pub mod storage;
pub mod views;

#[multiversx_sc::contract]
pub trait DataMarket:
    storage::StorageModule
    + requirements::RequirementsModule
    + views::ViewsModule
    + events::EventsModule
    + offer_adding_utils::OfferAddingUtils
    + offer_accept_utils::OfferAcceptUtils
{
    #[init]
    fn init(&self) {
        self.is_paused().set(true);
        self.pause_toggle_event(&true);
        self.percentage_cut_from_buyer().set(BigUint::from(200u64));
        self.percentage_cut_from_seller().set(BigUint::from(200u64));
        self.discount_fee_percentage_buyer()
            .set(BigUint::from(0u64));
        self.discount_fee_percentage_seller()
            .set(BigUint::from(0u64));
    }
    // Endpoint that will be used by the contract owner to initialize the contract.
    #[only_owner]
    #[endpoint(initializeContract)]
    fn initialize_contract(
        &self,
        accepted_token_id: TokenIdentifier,
        payment_token_id: EgldOrEsdtTokenIdentifier,
        maximum_payment_fee: BigUint,
        treasury_address: ManagedAddress,
    ) {
        require!(
            self.treasury_address().is_empty()
                && self.accepted_payments().is_empty()
                && self.accepted_tokens().is_empty(),
            "Contract already initialized"
        );
        self.set_accepted_token_event(&accepted_token_id);
        self.add_accepted_token(accepted_token_id);
        self.set_accepted_payment_event(&payment_token_id, &maximum_payment_fee);
        self.add_accepted_payment(payment_token_id, maximum_payment_fee);
        self.treasury_address_event(&treasury_address);
        self.set_treasury_address(treasury_address);
    }

    // Endpoint that will be used by privileged address and contract owner to set the discount percentage cuts.
    #[endpoint(setDiscounts)]
    fn set_discounts(&self, seller_discount: BigUint, buyer_discount: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.set_discounts_event(&seller_discount, &buyer_discount);
        self.discount_fee_percentage_buyer().set(&buyer_discount);
        self.discount_fee_percentage_seller().set(&seller_discount);
    }

    // Endpoint that will be used by privileged address and contract owner to set the percentage cuts.
    #[endpoint(setFees)]
    fn set_fees(&self, seller_fee: BigUint, buyer_fee: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.set_percentage_cuts_event(&seller_fee, &buyer_fee);
        self.percentage_cut_from_buyer().set(&buyer_fee);
        self.percentage_cut_from_seller().set(&seller_fee);
    }

    // Endpoint that will be used by privileged address and contract owner to add a new accepted tradable token.
    #[endpoint(addAcceptedToken)]
    fn add_accepted_token(&self, token_id: TokenIdentifier) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.set_accepted_token_event(&token_id);
        self.accepted_tokens().insert(token_id);
    }
    // Endpoint that will be used by privileged address and contract owner to add a new accepted payment.
    #[endpoint(addAcceptedPayment)]
    fn add_accepted_payment(&self, token_id: EgldOrEsdtTokenIdentifier, maximum_fee: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.set_accepted_payment_event(&token_id, &maximum_fee);
        self.accepted_payments().insert(token_id, maximum_fee);
    }

    // Endpoint that will be used by privileged address to change the contract pause value.
    #[endpoint(setIsPaused)]
    fn set_is_paused(&self, is_paused: bool) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.pause_toggle_event(&is_paused);
        self.is_paused().set(is_paused);
    }

    // Endpoint that will be callable by users to add a new offer.
    #[payable("*")]
    #[endpoint(addOffer)]
    fn add_offer(
        &self,
        payment_token_id: EgldOrEsdtTokenIdentifier,
        payment_token_nonce: u64,
        payment_token_fee: BigUint,
        opt_quantity: OptionalValue<BigUint>,
    ) {
        self.require_sc_ready_to_trade();
        let caller = self.blockchain().get_caller();

        let data_nft = self.call_value().single_esdt();
        require!(
            self.accepted_payments().contains_key(&payment_token_id),
            "Token not accepted"
        );
        require!(
            self.accepted_tokens().contains(&data_nft.token_identifier),
            "Token not accepted"
        );

        let maximum_fee = self.accepted_payments().get(&payment_token_id);
        match maximum_fee {
            Some(maximum_fee) => {
                require!(payment_token_fee <= maximum_fee, "Payment fee too high");
            }
            None => {
                require!(false, "Token not accepted");
            }
        }

        let payment_token =
            EgldOrEsdtTokenPayment::new(payment_token_id, payment_token_nonce, payment_token_fee);

        self.create_offer(caller, data_nft, payment_token, opt_quantity);
    }

    // Endpoint that will be callable by offer owner or contract owner to cancel an offer.
    #[endpoint(cancelOffer)]
    fn cancel_offer(&self, index: u64) {
        self.require_sc_ready_to_trade();
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
                self.cancelled_offer_event(&index);
                self.offers().remove(&index);
                self.user_listed_offers(&offer.owner).swap_remove(&index);
                self.empty_offer_indexes().insert(index);
            }
            None => sc_panic!("Offer not found"),
        }
    }

    // Endpoint that will be callable by users to accept an offer.
    #[payable("*")]
    #[endpoint(acceptOffer)]
    fn accept_offer(&self, index: u64, quantity: BigUint) {
        self.require_sc_ready_to_trade();

        let caller = self.blockchain().get_caller();
        let offer_to_accept = self.offers().get(&index);
        let payment = self.call_value().egld_or_single_esdt();

        match offer_to_accept {
            Some(mut offer) => {
                // SFT token data and attributes
                let token_data = self.blockchain().get_esdt_token_data(
                    &self.blockchain().get_sc_address(),
                    &offer.offered_token.token_identifier,
                    offer.offered_token.token_nonce,
                );
                // SFT token attributes
                let token_attributes =
                    token_data.decode_attributes::<DataNftAttributes<Self::Api>>();

                require!(&caller != &offer.owner, "You cannot accept your own offer");

                let (buyer_has_discount, seller_has_discout) =
                    self.check_traders_have_discount(&caller, &offer.owner);

                let (buyer_fee, seller_fee) =
                    self.get_traders_fees(buyer_has_discount, seller_has_discout);

                require!(quantity <= offer.quantity, "Not enough quantity");
                require!(
                    payment.token_identifier == offer.wanted_token.token_identifier,
                    "Wrong token payment"
                );
                require!(
                    payment.token_nonce == offer.wanted_token.token_nonce,
                    "Wrong token payment"
                );

                let (buyer_payment, creator_royalties, fee_from_buyer, fee_from_seller) = self
                    .compute_fees(
                        &offer.wanted_token.amount,
                        &quantity,
                        &buyer_fee,
                        &seller_fee,
                        &token_data.royalties,
                    );

                require!(
                    payment.amount == buyer_payment,
                    "Wrong token payment amount"
                );

                self.accepted_offer_event(&index, &caller, &quantity);

                let offered_token = offer.offered_token.clone();
                let seller = offer.owner.clone();

                self.distribute_tokens(
                    payment,
                    offered_token,
                    &quantity,
                    caller,
                    buyer_payment,
                    fee_from_buyer,
                    seller,
                    fee_from_seller,
                    token_attributes.creator,
                    creator_royalties,
                );

                if offer.quantity == quantity {
                    self.user_listed_offers(&offer.owner).swap_remove(&index);
                    self.offers().remove(&index);
                    self.empty_offer_indexes().insert(index);
                } else {
                    offer.quantity -= quantity;
                    self.offers().insert(index, offer);
                }
            }

            None => sc_panic!("Offer not found"),
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
