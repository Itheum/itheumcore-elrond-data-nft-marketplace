use crate::storage::Offer;

elrond_wasm::imports!();
elrond_wasm::derive_imports!();

#[elrond_wasm::module]
pub trait OfferAddingUtils: crate::storage::StorageModule + crate::events::EventsModule {
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

    fn create_offer(
        &self,
        seller: ManagedAddress,
        mut data_nft: EsdtTokenPayment,
        payment_token: EgldOrEsdtTokenPayment,
        opt_quantity: OptionalValue<BigUint>,
    ) {
        let caller = seller.clone();
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
                    owner: seller,
                    offered_token: data_nft,
                    wanted_token: payment_token,
                    quantity: existing_quantity,
                };
                let index = self.create_offer_index();
                self.added_offer_event(&index, &offer);
                self.user_listed_offers(&caller).insert(index);
                self.offers().insert(index, offer);
            }
            OptionalValue::None => {
                let offer = Offer {
                    owner: seller,
                    offered_token: data_nft,
                    wanted_token: payment_token,
                    quantity: real_quantity,
                };
                let index = self.create_offer_index();
                self.added_offer_event(&index, &offer);
                self.user_listed_offers(&caller).insert(index);
                self.offers().insert(index, offer);
            }
        }
        self.total_user_listed_offers(&caller)
            .update(|total| *total += 1);
    }
}
