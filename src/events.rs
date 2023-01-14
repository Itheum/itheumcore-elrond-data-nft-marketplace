use crate::storage::Offer;

elrond_wasm::imports!();
elrond_wasm::derive_imports!();
// Module that handles event emitting for important smart contract events in order to facilitate logging, debugging and monitoring with ease
#[elrond_wasm::module]
pub trait EventsModule {
    // Emitted whenever pause toggle is set
    #[event("setMintPauseToggle")]
    fn pause_toggle_event(&self, #[indexed] is_paused: &bool);

    // Emitted whenever treasury address is set
    #[event("setTreasuryAddress")]
    fn treasury_address_event(&self, #[indexed] treasury_address: &ManagedAddress);

    // Emitted whenever the administrator is set
    #[event("setAdministrator")]
    fn set_administrator_event(&self, #[indexed] administrator: &ManagedAddress);

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

    // Emitted whenever a new accepted payment token is set
    #[event("setAcceptedPaymentToken")]
    fn set_accepted_payment_token_event(
        &self,
        #[indexed] token_identifier: &EgldOrEsdtTokenIdentifier,
    );

    // Emitted whenever a maximum sft fee is set
    #[event("setMaxSftFee")]
    fn set_max_sft_fee_event(&self, #[indexed] max_sft_fee: &BigUint);

    // Emitted whenever a new offer is created
    #[event("addedOffer")]
    fn added_offer_event(&self, #[indexed] index: &u64, #[indexed] offer: &Offer<Self::Api>);

    // Emitted whenever an offer is cancelled
    #[event("cancelledOffer")]
    fn cancelled_offer_event(&self, #[indexed] index: &u64);

    // Emitted whenever an offer is accepted
    #[event("acceptedOffer")]
    fn accepted_offer_event(
        &self,
        #[indexed] index: &u64,
        #[indexed] buyer: &ManagedAddress,
        #[indexed] quantity: &BigUint,
    );
}
