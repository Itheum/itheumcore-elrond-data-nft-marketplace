use crate::storage::Offer;

multiversx_sc::imports!();
multiversx_sc::derive_imports!();
// Module that handles event emitting for important smart contract events in order to facilitate logging, debugging and monitoring with ease
#[multiversx_sc::module]
pub trait EventsModule {
    // Emitted whenever pause toggle is set
    #[event("setMintPauseToggle")]
    fn pause_toggle_event(&self, #[indexed] is_paused: &bool);

    // Emitted whenever treasury address is set
    #[event("setTreasuryAddress")]
    fn treasury_address_event(&self, #[indexed] treasury_address: &ManagedAddress);

    // Emitted whenever a claim contract is set
    #[event("setClaimContract")]
    fn set_claim_contract_event(&self, #[indexed] claim_contract: &ManagedAddress);

    // Emitted whenever claim contract is enabled or disabled
    #[event("setClaimIsEnabled")]
    fn set_claim_is_enabled_event(&self, #[indexed] is_enabled: &bool);

    // Emitted whenever the administrator is set
    #[event("setAdministrator")]
    fn set_administrator_event(&self, #[indexed] administrator: &ManagedAddress);

    // Emitted whenever a accepted claim royalties token is set
    #[event("setRoyaltiesAcceptedToken")]
    fn set_royalties_claims_token_event(&self, #[indexed] token_identifier: &TokenIdentifier);

    // Emitted whenever the discounts are set
    #[event("setDiscounts")]
    fn set_discounts_event(
        &self,
        #[indexed] discount_fee_percentage_seller: &BigUint,
        #[indexed] discount_fee_percentage_buyer: &BigUint,
    );

    // Emitted whenever the percentage cuts are set
    #[event("setPercentageCuts")]
    fn set_percentage_cuts_event(
        &self,
        #[indexed] percentage_cut_from_seller: &BigUint,
        #[indexed] percentage_cut_from_buyer: &BigUint,
    );

    // Emitted whenever a new accepted token is set
    #[event("setAcceptedToken")]
    fn set_accepted_token_event(&self, #[indexed] token_identifier: &TokenIdentifier);

    // Emitted whenever a accepted token is removed
    #[event("removeAcceptedToken")]
    fn remove_accepted_token_event(&self, #[indexed] token_identifier: &TokenIdentifier);

    // Emitted whenever a new accepted payment token is set
    #[event("setAcceptedPaymentToken")]
    fn set_accepted_payment_event(
        &self,
        #[indexed] token_identifier: &EgldOrEsdtTokenIdentifier,
        #[indexed] max_payment_fee: &BigUint,
    );

    // Emitted whenever an accepted payment token is removed
    #[event("removeAcceptedPaymentToken")]
    fn remove_accepted_payment_event(
        &self,
        #[indexed] token_identifier: &EgldOrEsdtTokenIdentifier,
    );

    // Emitted whenever a new offer is created
    #[event("addedOffer")]
    fn added_offer_event(&self, #[indexed] index: &u64, #[indexed] offer: &Offer<Self::Api>);

    // Emitted whenever an offer price is updated
    #[event("updatedOfferPrice")]
    fn updated_offer_price_event(&self, #[indexed] index: &u64, #[indexed] price: &BigUint);

    // Emitted whenever an offer is cancelled
    #[event("cancelledOffer")]
    fn cancelled_offer_event(
        &self,
        #[indexed] index: &u64,
        #[indexed] quantity: &BigUint,
        #[indexed] with_funds: bool,
    );

    // Emitted whenever a cancelled offer withdrawn the tokens
    #[event("withdrawCancelledOffer")]
    fn withdraw_cancelled_offer_event(&self, #[indexed] index: &u64);

    // Emitted whenever an offer is accepted
    #[event("acceptedOffer")]
    fn accepted_offer_event(
        &self,
        #[indexed] index: &u64,
        #[indexed] buyer: &ManagedAddress,
        #[indexed] quantity: &BigUint,
    );
}
