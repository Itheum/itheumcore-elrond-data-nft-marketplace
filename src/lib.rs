#![no_std]

multiversx_sc::imports!();
multiversx_sc::derive_imports!();

use crate::errors::ERR_CANNOT_ACCEPT_OWN_OFFER;
use crate::errors::ERR_CONTRACT_ALREADY_INITIALIZED;
use crate::errors::ERR_CONTRACT_PAUSED;
use crate::errors::ERR_DISCOUNTS_HIGHER_THAN_PERCENTAGE_CUTS;
use crate::errors::ERR_FEES_CANNOT_BE_LOWER_THAN_DISCOUNTS;
use crate::errors::ERR_MAX_QUANTITY_EXCEEDED;
use crate::errors::ERR_MIN_AMOUNT_TOO_HIGH;
use crate::errors::ERR_NOT_ENOUGH_QUANTITY;
use crate::errors::ERR_ONLY_OFFER_OWNER;
use crate::errors::ERR_ONLY_SPECIAL_ADDRESS;
use crate::errors::ERR_PAYMENT_FEE_TOO_HIGH;
use crate::errors::ERR_QUANTITY_MUST_BE_A_DIVISOR;
use crate::errors::ERR_QUANTITY_MUST_BE_POSITIVE;
use crate::errors::ERR_QUANTITY_TOO_HIGH;
use crate::errors::ERR_TOKEN_NOT_ACCEPTED;
use crate::errors::ERR_WRONG_TOKEN;
use crate::errors::ERR_WRONG_TOKEN_AMOUNT;
use crate::storage::DataNftAttributes;
use crate::storage::Offer;
use crate::storage::OfferType;

pub mod claims;
pub mod errors;
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

        self.percentage_cut_from_buyer()
            .set_if_empty(BigUint::from(200u64));
        self.percentage_cut_from_seller()
            .set_if_empty(BigUint::from(200u64));

        self.discount_fee_percentage_buyer()
            .set_if_empty(BigUint::zero());
        self.discount_fee_percentage_seller()
            .set_if_empty(BigUint::zero());

        self.pause_toggle_event(&true);
        self.set_percentage_cuts_event(
            &self.percentage_cut_from_seller().get(),
            &self.percentage_cut_from_buyer().get(),
        );
        self.set_discounts_event(
            &self.discount_fee_percentage_seller().get(),
            &self.discount_fee_percentage_buyer().get(),
        );
    }

    #[upgrade]
    fn upgrade(&self) {
        self.is_paused().set(true);
        self.pause_toggle_event(&true);
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
            ERR_CONTRACT_ALREADY_INITIALIZED
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
            ERR_DISCOUNTS_HIGHER_THAN_PERCENTAGE_CUTS
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
            buyer_fee >= self.discount_fee_percentage_buyer().get()
                && seller_fee >= self.discount_fee_percentage_seller().get(),
            ERR_FEES_CANNOT_BE_LOWER_THAN_DISCOUNTS
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

    // Endpoint that will be used by contract owner to remove an accepted tradable token.
    #[only_owner]
    #[endpoint(removeAcceptedToken)]
    fn remove_accepted_token(&self, token_id: TokenIdentifier) {
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

    // Endpoint that will be used by contract owner to remove an accepted payment.
    #[only_owner]
    #[endpoint(removeAcceptedPayment)]
    fn remove_accepted_payment(&self, token_id: EgldOrEsdtTokenIdentifier) {
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

    #[endpoint(setMaxDefaultQuantity)]
    fn set_max_default_quantity(&self, max_default_quantity: BigUint) {
        let caller = self.blockchain().get_caller();
        self.require_is_privileged(&caller);
        self.set_max_default_quantity_event(&max_default_quantity);
        self.max_default_quantity().set(max_default_quantity);
    }

    // Endpoint that will be callable by users to add a new offer.
    #[payable("*")]
    #[endpoint(addOffer)]
    fn add_offer(
        &self,
        payment_token_id: EgldOrEsdtTokenIdentifier,
        payment_token_nonce: u64,
        payment_token_fee: BigUint,
        min_amount_for_seller: BigUint,
        quantity: BigUint,
        opt_max_quantity: OptionalValue<BigUint>,
    ) {
        self.require_sc_ready_to_trade();
        let caller = self.blockchain().get_caller();

        let mut data_nft = self.call_value().single_esdt();
        require!(
            self.accepted_payments().contains_key(&payment_token_id),
            ERR_TOKEN_NOT_ACCEPTED
        );
        require!(
            self.accepted_tokens().contains(&data_nft.token_identifier),
            ERR_TOKEN_NOT_ACCEPTED
        );

        let max_quantity = opt_max_quantity
            .into_option()
            .unwrap_or(self.max_default_quantity().get());

        require!(quantity > 0, ERR_QUANTITY_MUST_BE_POSITIVE);
        require!(data_nft.amount >= quantity, ERR_QUANTITY_TOO_HIGH);

        let maximum_fee = self.accepted_payments().get(&payment_token_id).unwrap();

        require!(
            &data_nft.amount % &quantity == 0,
            ERR_QUANTITY_MUST_BE_A_DIVISOR
        );
        data_nft.amount = &data_nft.amount / &quantity;

        require!(
            payment_token_fee <= &maximum_fee * &data_nft.amount,
            ERR_PAYMENT_FEE_TOO_HIGH
        );

        require!(
            &min_amount_for_seller <= &payment_token_fee,
            ERR_MIN_AMOUNT_TOO_HIGH
        );

        let payment_token =
            EgldOrEsdtTokenPayment::new(payment_token_id, payment_token_nonce, payment_token_fee);

        let last_id_mapper = self.last_valid_offer_id();
        let offer_id = last_id_mapper.get() + 1;
        last_id_mapper.set(offer_id);
        self.user_listed_offers(&caller).insert(offer_id);

        let offer = Offer {
            owner: caller,
            offered_token: data_nft,
            wanted_token: payment_token,
            min_amount_for_seller,
            quantity,
            max_quantity,
        };
        self.added_offer_event(&offer_id, &offer);
        self.offers().insert(offer_id, offer);
    }

    #[endpoint(changeOfferPrice)]
    fn change_offer_price(&self, offer_id: u64, new_fee: BigUint, min_amount_for_seller: BigUint) {
        self.require_sc_ready_to_trade();
        let caller = self.blockchain().get_caller();
        let mut offer = self.try_get_offer(offer_id);

        require!(offer.owner == caller, ERR_ONLY_OFFER_OWNER);

        let token_identifier = offer.wanted_token.token_identifier;
        let nonce = offer.wanted_token.token_nonce;

        let maximum_fee = self.accepted_payments().get(&token_identifier);
        match maximum_fee {
            Some(maximum_fee) => {
                require!(
                    new_fee <= maximum_fee * &offer.offered_token.amount,
                    ERR_PAYMENT_FEE_TOO_HIGH
                );
            }
            None => sc_panic!(ERR_TOKEN_NOT_ACCEPTED),
        }

        require!(&min_amount_for_seller <= &new_fee, ERR_MIN_AMOUNT_TOO_HIGH);
        self.updated_offer_price_event(&offer_id, &new_fee);
        let payment_token = EgldOrEsdtTokenPayment::new(token_identifier, nonce, new_fee);
        offer.min_amount_for_seller = min_amount_for_seller;
        offer.wanted_token = payment_token;
        self.offers().insert(offer_id, offer);
    }

    // Endpoint that will be callable by offer owner or contract owner to cancel an offer.
    #[endpoint(cancelOffer)]
    fn cancel_offer(&self, offer_id: u64, quantity: BigUint, send_funds_back: bool) {
        let mut offer = self.try_get_offer(offer_id);
        let caller = self.blockchain().get_caller();
        let sc_owner = self.blockchain().get_owner_address();

        if caller != sc_owner {
            require!(!self.is_paused().get(), ERR_CONTRACT_PAUSED);
        };

        require!(quantity > 0, ERR_QUANTITY_MUST_BE_POSITIVE);
        require!(offer.quantity >= quantity, ERR_QUANTITY_TOO_HIGH);
        require!(
            &caller == &offer.owner
                || &caller == &sc_owner
                || &caller == &self.administrator().get(),
            ERR_ONLY_SPECIAL_ADDRESS
        );
        if send_funds_back {
            self.send().direct_esdt(
                &offer.owner,
                &offer.offered_token.token_identifier,
                offer.offered_token.token_nonce,
                &(&offer.offered_token.amount * &quantity),
            );

            self.cancelled_offer_event(&offer_id, &quantity, send_funds_back);
            if offer.quantity == quantity {
                self.user_listed_offers(&offer.owner).swap_remove(&offer_id);
                self.offers().remove(&offer_id);
            } else {
                offer.quantity -= quantity;
                self.offers().insert(offer_id, offer);
            }
        } else {
            let mut cancelled_offer;
            if !self.cancelled_offers(&offer.owner).contains_key(&offer_id) {
                cancelled_offer = offer.clone();
                cancelled_offer.quantity = BigUint::zero();
            } else {
                cancelled_offer = self.try_get_cancelled_offer(&offer.owner, offer_id);
            }

            if offer.quantity == quantity {
                self.user_listed_offers(&offer.owner).swap_remove(&offer_id);
                self.offers().remove(&offer_id);
            } else {
                offer.quantity -= &quantity;
                self.offers().insert(offer_id, offer);
            }
            self.cancelled_offer_event(&offer_id, &quantity, send_funds_back);
            cancelled_offer.quantity += quantity;
            self.cancelled_offers(&cancelled_offer.owner)
                .insert(offer_id, cancelled_offer);
        }
    }

    #[endpoint(withdrawCancelledOffer)]
    fn withdraw_from_cancelled_offer(&self, offer_id: u64) {
        let caller = self.blockchain().get_caller();
        let offer = self.try_get_cancelled_offer(&caller, offer_id);
        require!(!self.is_paused().get(), ERR_CONTRACT_PAUSED);
        require!(caller == offer.owner, ERR_ONLY_OFFER_OWNER);

        self.send().direct_esdt(
            &offer.owner,
            &offer.offered_token.token_identifier,
            offer.offered_token.token_nonce,
            &(&offer.offered_token.amount * &offer.quantity),
        );

        self.withdraw_cancelled_offer_event(&offer_id);
        self.cancelled_offers(&caller).remove(&offer_id);
    }

    // Endpoint that will be callable by users to accept an offer.
    #[payable("*")]
    #[endpoint(acceptOffer)]
    fn accept_offer(&self, offer_id: u64, quantity: BigUint) {
        self.require_sc_ready_to_trade();

        let caller = self.blockchain().get_caller();

        let mut offer = self.try_get_offer(offer_id);

        let mut address_limit = self.bought_per_address(&caller, offer_id).get();

        if offer.max_quantity > BigUint::zero() {
            require!(
                &quantity + &address_limit <= offer.max_quantity,
                ERR_MAX_QUANTITY_EXCEEDED
            );

            address_limit += &quantity;

            self.bought_per_address(&caller, offer_id)
                .set(&address_limit);
        }

        let payment = self.call_value().egld_or_single_esdt();

        // SFT token data and attributes
        let token_data = self.blockchain().get_esdt_token_data(
            &self.blockchain().get_sc_address(),
            &offer.offered_token.token_identifier,
            offer.offered_token.token_nonce,
        );
        // SFT token attributes
        let token_attributes = token_data.decode_attributes::<DataNftAttributes<Self::Api>>();

        require!(&caller != &offer.owner, ERR_CANNOT_ACCEPT_OWN_OFFER);

        let (buyer_has_discount, seller_has_discount) =
            self.check_traders_have_discount(&caller, &offer.owner);

        let (buyer_fee, seller_fee) =
            self.get_traders_fees(buyer_has_discount, seller_has_discount);

        require!(quantity <= offer.quantity, ERR_NOT_ENOUGH_QUANTITY);

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
                ERR_WRONG_TOKEN
            );
            require!(
                payment.token_nonce == offer.wanted_token.token_nonce,
                ERR_WRONG_TOKEN
            );

            require!(payment.amount == buyer_payment, ERR_WRONG_TOKEN_AMOUNT);
        }

        self.accepted_offer_event(&offer_id, &caller, &quantity);

        let offered_token = offer.offered_token.clone();
        let seller = offer.owner.clone();
        let min_amount_for_seller = offer.min_amount_for_seller.clone();

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
            min_amount_for_seller,
        );

        if offer.quantity == quantity {
            self.user_listed_offers(&offer.owner).swap_remove(&offer_id);
            self.offers().remove(&offer_id);
        } else {
            offer.quantity -= quantity;
            self.offers().insert(offer_id, offer);
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
