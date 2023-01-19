elrond_wasm::imports!();
elrond_wasm::derive_imports!();

#[elrond_wasm::module]
pub trait OfferAddingUtils: crate::storage::StorageModule {
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
}
