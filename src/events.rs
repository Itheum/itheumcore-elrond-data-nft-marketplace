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
}
