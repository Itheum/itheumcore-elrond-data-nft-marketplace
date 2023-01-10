elrond_wasm::imports!();
elrond_wasm::derive_imports!();

// Module that handles generic (commonly used, which are not specific to one function) requirements which should stop execution and rollback if not met
#[elrond_wasm::module]
pub trait RequirementsModule: crate::storage::StorageModule {
    // Checks whether address is privileged
    fn require_is_privileged(&self, address: &ManagedAddress) {
        if &self.blockchain().get_owner_address() != address {
            require!(
                !&self.administrator().is_empty(),
                "Address is not privileged"
            );
            require!(
                &self.administrator().get() == address,
                "Address is not privileged"
            );
        }
    }
    // Checks whether a value is bigger than zero
    fn require_value_is_positive(&self, value: &BigUint) {
        require!(value > &BigUint::zero(), "Value must be higher than zero");
    }
}
