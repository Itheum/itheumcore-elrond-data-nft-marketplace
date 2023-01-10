elrond_wasm::imports!();
elrond_wasm::derive_imports!();

use crate::{storage::Offer, storage::OfferOut};

#[elrond_wasm::module]
pub trait ViewsModule: crate::storage::StorageModule {
    fn offer_to_offer_out(
        &self,
        index: u64,
        offer: Offer<Self::Api>,
        fee: &BigUint,
    ) -> OfferOut<Self::Api> {
        OfferOut {
            index: index,
            owner: offer.owner,
            offered_token_identifier: offer.offered_token.token_identifier,
            offered_token_nonce: offer.offered_token.token_nonce,
            offered_token_amount: offer.offered_token.amount,
            wanted_token_identifier: offer.wanted_token.token_identifier,
            wanted_token_nonce: offer.wanted_token.token_nonce,
            wanted_token_amount: offer.wanted_token.amount * (fee + &BigUint::from(10000u64))
                / BigUint::from(10000u64),
            quantity: offer.quantity,
        }
    }

    #[view(viewOffers)]
    fn view_offers(&self, from: u64, to: u64) -> ManagedVec<OfferOut<Self::Api>> {
        let mut offers = ManagedVec::new();
        let mut nr = 0;
        let fee = self.percentage_cut_from_buyer().get();
        for (index, offer) in self.offers().iter() {
            if nr >= from {
                if nr < to {
                    offers.push(self.offer_to_offer_out(index, offer, &fee));
                } else {
                    break;
                }
            }
            nr += 1;
        }
        offers
    }

    #[view(viewOffer)]
    fn view_offer(&self, index: u64) -> Option<OfferOut<Self::Api>> {
        let offer = self.offers().get(&index);
        let fee = self.percentage_cut_from_buyer().get();
        if let Some(offer) = offer {
            Some(self.offer_to_offer_out(index, offer, &fee))
        } else {
            None
        }
    }

    #[view(numberOfOffers)]
    fn view_number_of_offers(&self) -> usize {
        self.offers().len()
    }
}
