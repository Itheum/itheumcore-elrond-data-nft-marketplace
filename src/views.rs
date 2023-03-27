multiversx_sc::imports!();
multiversx_sc::derive_imports!();

use crate::{
    storage::Offer,
    storage::{MarketPlaceRequirements, OfferOut},
};

#[multiversx_sc::module]
pub trait ViewsModule: crate::storage::StorageModule {
    // View that returns the requirements for the marketplace
    #[view(viewRequirements)]
    fn view_requirements(&self) -> MarketPlaceRequirements<Self::Api> {
        let accepted_tokens = self
            .accepted_tokens()
            .iter()
            .collect::<ManagedVec<TokenIdentifier>>();
        let (accepted_payments, maximum_payment_fees) = self.accepted_payments().iter().unzip();
        MarketPlaceRequirements {
            accepted_tokens,
            accepted_payments,
            maximum_payment_fees,
            discount_fee_percentage_buyer: self.discount_fee_percentage_buyer().get(),
            discount_fee_percentage_seller: self.discount_fee_percentage_seller().get(),
            percentage_cut_from_buyer: self.percentage_cut_from_buyer().get(),
            percentage_cut_from_seller: self.percentage_cut_from_seller().get(),
        }
    }

    // View that returns the offers in a paged manner
    // If an address is provided, it will only return the offers of that address within the range
    #[view(viewPagedOffers)]
    fn view_offers_paged(
        &self,
        from: u64,
        to: u64,
        opt_address: OptionalValue<ManagedAddress>,
    ) -> ManagedVec<OfferOut<Self::Api>> {
        let mut offers = ManagedVec::new();
        let mut nr = 0;
        let fee = self.percentage_cut_from_buyer().get();

        match opt_address.clone() {
            OptionalValue::Some(address) => {
                for offer_id in self.user_listed_offers(&address).iter() {
                    if nr >= from {
                        if nr <= to {
                            let opt_offer = self.offers().get(&offer_id);
                            match opt_offer {
                                Option::Some(offer) => {
                                    offers.push(self.offer_to_offer_out(offer_id, offer, &fee));
                                }
                                Option::None => {}
                            }
                        } else {
                            break;
                        }
                    }
                    nr += 1;
                }
            }
            OptionalValue::None => {
                for (offer_id, offer) in self.offers().iter() {
                    if nr >= from {
                        if nr <= to {
                            offers.push(self.offer_to_offer_out(offer_id, offer, &fee));
                        } else {
                            break;
                        }
                    }
                    nr += 1;
                }
            }
        }
        offers
    }

    #[view(viewUserTotalOffers)]
    fn view_user_total_offers(&self) -> usize {
        let address = self.blockchain().get_caller();
        self.user_listed_offers(&address).len()
    }

    #[view(viewUserListedOffers)]
    fn view_user_listed_offers(&self) -> ManagedVec<OfferOut<Self::Api>> {
        let address = self.blockchain().get_caller();

        let offer_ids = self
            .user_listed_offers(&address)
            .iter()
            .collect::<ManagedVec<u64>>();

        let offers = offer_ids
            .into_iter()
            .flat_map(|offer_id| self.view_offer(offer_id))
            .collect::<ManagedVec<OfferOut<Self::Api>>>();

        offers
    }

    #[view(viewCancelledOffers)]
    fn view_cancelled_offers(&self) -> ManagedVec<OfferOut<Self::Api>> {
        let address = self.blockchain().get_caller();
        let fee = self.percentage_cut_from_buyer().get();

        let offers = self
            .cancelled_offers(&address)
            .iter()
            .map(|(offer_id, offer)| self.offer_to_offer_out(offer_id, offer, &fee))
            .collect::<ManagedVec<OfferOut<Self::Api>>>();

        offers
    }

    // View that returns specific offers by providing their offer_ids
    #[view(viewOffers)]
    fn view_offers(&self, offer_ids: MultiValueEncoded<u64>) -> ManagedVec<OfferOut<Self::Api>> {
        let offers = offer_ids
            .into_iter()
            .flat_map(|offer_id| self.view_offer(offer_id))
            .collect::<ManagedVec<OfferOut<Self::Api>>>();
        offers
    }

    // View that returns a specific offer
    #[view(viewOffer)]
    fn view_offer(&self, offer_id: u64) -> Option<OfferOut<Self::Api>> {
        let offer = self.offers().get(&offer_id);
        let fee = self.percentage_cut_from_buyer().get();
        if let Some(offer) = offer {
            Some(self.offer_to_offer_out(offer_id, offer, &fee))
        } else {
            None
        }
    }

    // View that returns the number of offers
    #[view(viewNumberOfOffers)]
    fn view_number_of_offers(&self) -> usize {
        self.offers().len()
    }

    // Function that converts an offer to an offer out (which has more information)
    fn offer_to_offer_out(
        &self,
        offer_id: u64,
        offer: Offer<Self::Api>,
        fee: &BigUint,
    ) -> OfferOut<Self::Api> {
        OfferOut {
            offer_id,
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
}
