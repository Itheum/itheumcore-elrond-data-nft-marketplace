#![no_std]

multiversx_sc::imports!();
multiversx_sc::derive_imports!();

use crate::storage::DataNftAttributes;
use crate::storage::Offer;
use crate::storage::OfferType;

pub mod claims;
pub mod events;
pub mod offer_accept_utils;
pub mod requirements;
pub mod storage;
pub mod views;

#[multiversx_sc::contract]
pub trait DataMarket:
    storage::StorageModule
    + requirements::RequirementsModule
    + views::ViewsModule
    + events::EventsModule
    + offer_accept_utils::OfferAcceptUtils
{
    #[init]
    fn init(&self) {
        self.is_paused().set(true);

        self.pause_toggle_event(&true);
        self.set_percentage_cuts_event(&BigUint::from(200u64), &BigUint::from(200u64));
        self.percentage_cut_from_buyer()
            .set_if_empty(BigUint::from(200u64));
        self.percentage_cut_from_seller()
            .set_if_empty(BigUint::from(200u64));
        self.set_discounts_event(&BigUint::zero(), &BigUint::zero());
        self.discount_fee_percentage_buyer()
            .set_if_empty(BigUint::zero());
        self.discount_fee_percentage_seller()
            .set_if_empty(BigUint::zero());
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
        require!(
            seller_discount <= self.percentage_cut_from_seller().get()
                && buyer_discount <= self.percentage_cut_from_buyer().get(),
            "Discounts cannot be higher than the fee percentage cuts"
        );
        self.set_discounts_event(&seller_discount, &buyer_discount);
        self.discount_fee_percentage_buyer().set(&buyer_discount);
        self.discount_fee_percentage_seller().set(&seller_discount);
    }

    // Endpoint that will be used by privileged address and contract owner to set the percentage cuts.
    #[endpoint(setFees)]
    fn set_fees(&self, seller_fee: BigUint, buyer_fee: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        require!(
            seller_fee >= self.discount_fee_percentage_buyer().get()
                && buyer_fee >= self.discount_fee_percentage_seller().get(),
            "Fees cannot be lower than the discount percentage cuts"
        );
        self.set_percentage_cuts_event(&seller_fee, &buyer_fee);
        self.percentage_cut_from_buyer().set(&buyer_fee);
        self.percentage_cut_from_seller().set(&seller_fee);
    }

    #[only_owner]
    #[endpoint(setClaimsContract)]
    fn set_claims_contract(&self, claims_contract: ManagedAddress) {
        self.set_claim_contract_event(&claims_contract);
        self.claims_address().set(claims_contract);
    }

    #[only_owner]
    #[endpoint(setRoyaltiesClaimToken)]
    fn set_royalties_claims_token(&self, royalties_claims_token: TokenIdentifier) {
        self.set_royalties_claims_token_event(&royalties_claims_token);
        self.royalties_claim_token().set(royalties_claims_token);
    }

    #[only_owner]
    #[endpoint(setClaimIsEnabled)]
    fn set_claim_is_enabled(&self, is_enabled: bool) {
        self.set_claim_is_enabled_event(&is_enabled);
        self.claim_is_enabled().set(is_enabled);
    }
    // Endpoint that will be used by privileged address and contract owner to add a new accepted tradable token.
    #[endpoint(addAcceptedToken)]
    fn add_accepted_token(&self, token_id: TokenIdentifier) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.set_accepted_token_event(&token_id);
        self.accepted_tokens().insert(token_id);
    }

    // Endpoint that will be used by privileged address and contract owner to remove an accepted tradable token.
    #[endpoint(removeAcceptedToken)]
    fn remove_accepted_token(&self, token_id: TokenIdentifier) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.remove_accepted_token_event(&token_id);
        self.accepted_tokens().remove(&token_id);
    }

    // Endpoint that will be used by privileged address and contract owner to add a new accepted payment.
    #[endpoint(addAcceptedPayment)]
    fn add_accepted_payment(&self, token_id: EgldOrEsdtTokenIdentifier, maximum_fee: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.set_accepted_payment_event(&token_id, &maximum_fee);
        self.accepted_payments().insert(token_id, maximum_fee);
    }

    // Endpoint that will be used by privileged address and contract owner to remove an accepted payment.
    #[endpoint(removeAcceptedPayment)]
    fn remove_accepted_payment(&self, token_id: EgldOrEsdtTokenIdentifier) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.accepted_payments().remove(&token_id);
        self.remove_accepted_payment_event(&token_id);
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

        let mut data_nft = self.call_value().single_esdt();
        require!(
            self.accepted_payments().contains_key(&payment_token_id),
            "Token not accepted"
        );
        require!(
            self.accepted_tokens().contains(&data_nft.token_identifier),
            "Token not accepted"
        );

        let existing_quantity = opt_quantity.into_option().unwrap_or(BigUint::from(1u64));

        require!(existing_quantity > 0, "Quantity must be greater than 0");
        require!(
            data_nft.amount >= existing_quantity,
            "Quantity must be less than offered token amount"
        );

        let maximum_fee = self.accepted_payments().get(&payment_token_id);
        match maximum_fee {
            Some(maximum_fee) => {
                require!(
                    payment_token_fee <= &maximum_fee * &existing_quantity,
                    "Payment fee too high"
                );
            }
            None => sc_panic!("Token not accepted"),
        }

        let payment_token =
            EgldOrEsdtTokenPayment::new(payment_token_id, payment_token_nonce, payment_token_fee);

        require!(
            &data_nft.amount % &existing_quantity == 0,
            "Quantity must be a divisor of offered token amount"
        );
        data_nft.amount = &data_nft.amount / &existing_quantity;

        let last_id_mapper = self.last_valid_offer_id();
        let offer_id = last_id_mapper.get() + 1;
        last_id_mapper.set(offer_id);
        self.user_listed_offers(&caller).insert(offer_id);

        let offer = Offer {
            owner: caller,
            offered_token: data_nft,
            wanted_token: payment_token,
            quantity: existing_quantity,
        };
        self.added_offer_event(&offer_id, &offer);
        self.offers().insert(offer_id, offer);
    }

    #[endpoint(changeOfferPrice)]
    fn change_offer_price(&self, offer_id: u64, new_fee: BigUint) {
        self.require_sc_ready_to_trade();
        let caller = self.blockchain().get_caller();
        let offer_to_change = self.offers().get(&offer_id);
        match offer_to_change {
            Some(mut offer) => {
                require!(offer.owner == caller, "Only offer owner can change price");

                let token_identifier = offer.wanted_token.token_identifier;
                let nonce = offer.wanted_token.token_nonce;

                let maximum_fee = self.accepted_payments().get(&token_identifier);
                match maximum_fee {
                    Some(maximum_fee) => {
                        require!(
                            new_fee <= maximum_fee * &offer.quantity,
                            "Payment fee too high"
                        );
                    }
                    None => sc_panic!("Token not accepted"),
                }
                self.updated_offer_price_event(&offer_id, &new_fee);
                let payment_token = EgldOrEsdtTokenPayment::new(token_identifier, nonce, new_fee);

                offer.wanted_token = payment_token;
                self.offers().insert(offer_id, offer);
            }
            None => sc_panic!("Offer not found"),
        }
    }

    // Endpoint that will be callable by offer owner or contract owner to cancel an offer.
    #[endpoint(cancelOffer)]
    fn cancel_offer(&self, offer_id: u64, quantity: BigUint, send_funds_back: bool) {
        let offer_to_cancel = self.offers().get(&offer_id);
        let caller = self.blockchain().get_caller();
        let sc_owner = self.blockchain().get_owner_address();

        match offer_to_cancel {
            Some(mut offer) => {
                if send_funds_back {
                    require!(offer.quantity >= quantity, "Quantity too high");

                    if &caller == &offer.owner {
                        self.require_sc_ready_to_trade();
                    }

                    require!(
                        &caller == &offer.owner
                            || &caller == &sc_owner
                            || &caller == &self.administrator().get(),
                        "Only special addresses can cancel offers"
                    );

                    self.send().direct_esdt(
                        &offer.owner,
                        &offer.offered_token.token_identifier,
                        offer.offered_token.token_nonce,
                        &(&offer.offered_token.amount * &quantity),
                    );

                    if offer.quantity == quantity {
                        self.user_listed_offers(&offer.owner).swap_remove(&offer_id);
                        self.offers().remove(&offer_id);
                    } else {
                        offer.quantity -= quantity;
                        self.offers().insert(offer_id, offer);
                    }
                    self.cancelled_offer_event(&offer_id);
                } else {
                    // doesn't take into account the quantity provided
                    self.cancelled_offers(offer_id).set(offer);
                    self.offers().remove(&offer_id);
                    self.cancelled_offer_event(&offer_id);
                }
            }
            None => sc_panic!("Offer not found"),
        }
    }

    #[endpoint(whithdrawCancelledOffer)]
    fn withdraw_from_cancelled_offer(&self, offer_id: u64) {
        let caller = self.blockchain().get_caller();
        let offer = self.try_get_offer(offer_id);
        self.require_sc_ready_to_trade();
        require!(caller == offer.owner, "Not offer owner");

        self.send().direct_esdt(
            &offer.owner,
            &offer.offered_token.token_identifier,
            offer.offered_token.token_nonce,
            &(&offer.offered_token.amount * &offer.quantity),
        );

        self.user_listed_offers(&offer.owner).swap_remove(&offer_id); // after whithdraw, offer is no longer managed by the contract
        self.withdraw_cancelled_offer_event(&offer_id);
        self.cancelled_offers(offer_id).clear();
    }

    // Endpoint that will be callable by users to accept an offer.
    #[payable("*")]
    #[endpoint(acceptOffer)]
    fn accept_offer(&self, offer_id: u64, quantity: BigUint) {
        self.require_sc_ready_to_trade();

        let caller = self.blockchain().get_caller();
        let offer_to_accept = self.offers().get(&offer_id);
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

                let (buyer_has_discount, seller_has_discount) =
                    self.check_traders_have_discount(&caller, &offer.owner);

                let (buyer_fee, seller_fee) =
                    self.get_traders_fees(buyer_has_discount, seller_has_discount);

                require!(quantity <= offer.quantity, "Not enough quantity");

                let offer_type = self.check_offer_type(&offer.wanted_token.amount);

                let (buyer_payment, creator_royalties, fee_from_buyer, fee_from_seller) = self
                    .compute_fees(
                        &offer.wanted_token.amount,
                        &quantity,
                        &buyer_fee,
                        &seller_fee,
                        &token_data.royalties,
                        &offer_type,
                    );

                if offer_type == OfferType::PaymentOffer {
                    require!(
                        payment.token_identifier == offer.wanted_token.token_identifier,
                        "Wrong token payment"
                    );
                    require!(
                        payment.token_nonce == offer.wanted_token.token_nonce,
                        "Wrong token payment"
                    );

                    require!(
                        payment.amount == buyer_payment,
                        "Wrong token payment amount"
                    );
                }

                self.accepted_offer_event(&offer_id, &caller, &quantity);

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
                    self.user_listed_offers(&offer.owner).swap_remove(&offer_id);
                    self.offers().remove(&offer_id);
                } else {
                    offer.quantity -= quantity;
                    self.offers().insert(offer_id, offer);
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
