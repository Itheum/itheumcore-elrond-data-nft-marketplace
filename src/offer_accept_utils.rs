use crate::{
    claims::{self, ClaimType},
    errors::{ERR_MIN_AMOUNT_NOT_FILLED, ERR_OFFER_NOT_FOUND},
    storage::{Offer, OfferType},
};

multiversx_sc::imports!();
multiversx_sc::derive_imports!();

#[multiversx_sc::module]
pub trait OfferAcceptUtils: crate::storage::StorageModule {
    #[proxy]
    fn claims_proxy(&self, sc_address: ManagedAddress) -> claims::Proxy<Self::Api>;

    fn check_offer_type(&self, amount: &BigUint) -> OfferType {
        if amount == &BigUint::zero() {
            OfferType::FreeOffer
        } else {
            OfferType::PaymentOffer
        }
    }

    fn try_get_cancelled_offer(&self, address: &ManagedAddress, offer_id: u64) -> Offer<Self::Api> {
        let offer = self
            .cancelled_offers(&address)
            .get(&offer_id)
            .unwrap_or_else(|| sc_panic!(ERR_OFFER_NOT_FOUND));

        offer
    }

    fn try_get_offer(&self, offer_id: u64) -> Offer<Self::Api> {
        let offer = self
            .offers()
            .get(&offer_id)
            .unwrap_or_else(|| sc_panic!(ERR_OFFER_NOT_FOUND));

        offer
    }

    fn check_traders_have_discount(
        &self,
        buyer_address: &ManagedAddress,
        seller_address: &ManagedAddress,
    ) -> (bool, bool) {
        let buyer_discount: bool;
        let seller_discount: bool;

        if self.discount_fee_percentage_buyer().get() != BigUint::zero() {
            buyer_discount = true;
        } else {
            buyer_discount = false;
        }
        if self.discount_fee_percentage_seller().get() != BigUint::zero() {
            seller_discount = true;
        } else {
            seller_discount = false;
        }

        (buyer_discount, seller_discount)
    }

    fn get_traders_fees(&self, buyer_discount: bool, seller_discount: bool) -> (BigUint, BigUint) {
        let buyer_fee = if buyer_discount {
            self.percentage_cut_from_buyer().get() - self.discount_fee_percentage_buyer().get()
        } else {
            self.percentage_cut_from_buyer().get()
        };
        let seller_fee = if seller_discount {
            self.percentage_cut_from_seller().get() - self.discount_fee_percentage_seller().get()
        } else {
            self.percentage_cut_from_seller().get()
        };
        (buyer_fee, seller_fee)
    }

    fn compute_fees(
        &self,
        amount: &BigUint,
        quantity: &BigUint,
        buyer_fee: &BigUint,
        seller_fee: &BigUint,
        creator_royalties: &BigUint,
        offer_type: &OfferType,
    ) -> (BigUint, BigUint, BigUint, BigUint) {
        if offer_type == &OfferType::FreeOffer {
            let buyer_payment = BigUint::zero();
            let fee_from_buyer = BigUint::zero();
            let fee_from_seller = BigUint::zero();
            let royalties = BigUint::zero();

            (buyer_payment, royalties, fee_from_buyer, fee_from_seller)
        } else {
            let mut buyer_payment = amount * quantity;

            let mut seller_payment = buyer_payment.clone();

            let fee_from_buyer = &buyer_payment * buyer_fee / &BigUint::from(10000u64);

            buyer_payment += &fee_from_buyer;

            let fee_from_seller = &seller_payment * seller_fee / BigUint::from(10000u64);

            seller_payment -= &fee_from_seller;

            let royalties = &seller_payment * creator_royalties / BigUint::from(10000u64);

            (buyer_payment, royalties, fee_from_buyer, fee_from_seller)
        }
    }

    fn distribute_tokens(
        &self,
        payment_token: EgldOrEsdtTokenPayment,
        offered_token: EsdtTokenPayment,
        quantity: &BigUint,
        buyer: ManagedAddress,
        buyer_payment: BigUint,
        fee_from_buyer: BigUint,
        seller: ManagedAddress,
        fee_from_seller: BigUint,
        creator: ManagedAddress,
        creator_royalties: BigUint,
        min_amount_for_seller: BigUint,
    ) {
        // If the creator setup royalties and is not the offer owner he can get the royalties
        if creator != seller && &creator_royalties > &BigUint::zero() {
            require!(
                &min_amount_for_seller
                    <= &(&buyer_payment - &fee_from_buyer - &fee_from_seller - &creator_royalties),
                ERR_MIN_AMOUNT_NOT_FILLED
            );
            self.send().direct(
                &seller,
                &payment_token.token_identifier,
                payment_token.token_nonce,
                &(&buyer_payment - &creator_royalties - &fee_from_seller - &fee_from_buyer),
            );

            let payment_token_id = payment_token.token_identifier.clone();
            let claim_is_enabled = self.claim_is_enabled().get();

            match claim_is_enabled {
                true => {
                    if payment_token_id.is_egld() || (&payment_token_id != &self.royalties_claim_token().get()) {
                        self.send().direct(
                            &creator,
                            &payment_token.token_identifier,
                            payment_token.token_nonce,
                            &creator_royalties,
                        );
                    } else {
                        let claim_payment = EsdtTokenPayment::new(
                            payment_token_id.unwrap_esdt(),
                            payment_token.token_nonce,
                            creator_royalties,
                        );

                        self.claims_proxy(self.claims_address().get())
                            .add_claim(&creator, ClaimType::Royalty)
                            .with_esdt_transfer(claim_payment)
                            .transfer_execute();
                    }
                }
                false => self.send().direct(
                    &creator,
                    &payment_token.token_identifier,
                    payment_token.token_nonce,
                    &creator_royalties,
                ),
            }
        } else {
            require!(
                &min_amount_for_seller <= &(&buyer_payment - &fee_from_buyer - &fee_from_seller),
                ERR_MIN_AMOUNT_NOT_FILLED
            );
            self.send().direct(
                &seller,
                &payment_token.token_identifier,
                payment_token.token_nonce,
                &(&buyer_payment - &fee_from_seller - &fee_from_buyer),
            );
        }

        let treasury_address = self.treasury_address().get();

        self.send().direct(
            &treasury_address,
            &payment_token.token_identifier,
            payment_token.token_nonce,
            &(&fee_from_seller + &fee_from_buyer),
        );

        // Data NFT-FT to the buyer
        self.send().direct_esdt(
            &buyer,
            &offered_token.token_identifier,
            offered_token.token_nonce,
            &(&offered_token.amount * quantity),
        );
    }
}
