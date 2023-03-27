use crate::errors::{ERR_ADDRESS_NOT_PRIVILEGED, ERR_MARKETPLACE_NOT_READY};

multiversx_sc::imports!();
multiversx_sc::derive_imports!();

// Module that handles generic (commonly used, which are not specific to one function) requirements which should stop execution and rollback if not met
#[multiversx_sc::module]
pub trait RequirementsModule: crate::storage::StorageModule {
    // Checks whether address is privileged
    fn require_is_privileged(&self, address: &ManagedAddress) {
        if &self.blockchain().get_owner_address() != address {
            require!(
                !&self.administrator().is_empty(),
                ERR_ADDRESS_NOT_PRIVILEGED
            );
            require!(
                &self.administrator().get() == address,
                ERR_ADDRESS_NOT_PRIVILEGED
            );
        }
    }

    fn require_sc_ready_to_trade(&self) {
        let mut is_ready = true;

        if self.treasury_address().is_empty() {
            is_ready = false;
        }
        if self.accepted_payments().is_empty() {
            is_ready = false;
        }
        if self.accepted_tokens().is_empty() {
            is_ready = false;
        }
        if self.claim_is_enabled().get() {
            if self.claims_address().is_empty() {
                is_ready = false;
            }
            if self.royalties_claim_token().is_empty() {
                is_ready = false;
            }
        }
        if self.is_paused().get() {
            is_ready = false;
        }
        require!(is_ready, ERR_MARKETPLACE_NOT_READY);
    }
}
