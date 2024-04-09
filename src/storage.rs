use multiversx_sc::codec::{NestedDecodeInput, TopDecodeInput};
multiversx_sc::imports!();
multiversx_sc::derive_imports!();

#[derive(TopEncode, TopDecode, TypeAbi, PartialEq, Eq, Clone, Copy, Debug)]
pub enum OfferType {
    PaymentOffer,
    FreeOffer,
}

#[derive(Clone, TopEncode, NestedEncode, TypeAbi)]
pub struct Offer<M: ManagedTypeApi> {
    pub owner: ManagedAddress<M>,
    pub offered_token: EsdtTokenPayment<M>,
    pub wanted_token: EgldOrEsdtTokenPayment<M>,
    pub min_amount_for_seller: BigUint<M>,
    pub quantity: BigUint<M>,
    pub max_quantity: BigUint<M>,
}

impl<M: ManagedTypeApi> TopDecode for Offer<M> {
    fn top_decode<I>(input: I) -> Result<Self, DecodeError>
    where
        I: TopDecodeInput,
    {
        let mut buffer = input.into_nested_buffer();
        Self::dep_decode(&mut buffer)
    }
}

impl<M: ManagedTypeApi> NestedDecode for Offer<M> {
    fn dep_decode<I: NestedDecodeInput>(input: &mut I) -> Result<Self, DecodeError> {
        let owner = ManagedAddress::dep_decode(input)?;
        let offered_token = EsdtTokenPayment::dep_decode(input)?;
        let wanted_token = EgldOrEsdtTokenPayment::dep_decode(input)?;
        let min_amount_for_seller = BigUint::dep_decode(input)?;
        let quantity = BigUint::dep_decode(input)?;

        let max_quantity = if !input.is_depleted() {
            BigUint::dep_decode(input)?
        } else {
            BigUint::zero()
        };

        if !input.is_depleted() {
            return Err(DecodeError::INPUT_TOO_LONG);
        }

        Result::Ok(Offer {
            owner,
            offered_token,
            wanted_token,
            min_amount_for_seller,
            quantity,
            max_quantity,
        })
    }
}

#[derive(
    ManagedVecItem,
    Clone,
    NestedEncode,
    NestedDecode,
    TopEncode,
    TopDecode,
    TypeAbi,
    Debug,
    PartialEq,
)]
pub struct OfferOut<M: ManagedTypeApi> {
    pub offer_id: u64,
    pub owner: ManagedAddress<M>,
    pub offered_token_identifier: TokenIdentifier<M>,
    pub offered_token_nonce: u64,
    pub offered_token_amount: BigUint<M>,
    pub wanted_token_identifier: EgldOrEsdtTokenIdentifier<M>,
    pub wanted_token_nonce: u64,
    pub wanted_token_amount: BigUint<M>,
    pub quantity: BigUint<M>,
}

#[derive(TopEncode, TopDecode, NestedEncode, NestedDecode, PartialEq, Clone, Debug, TypeAbi)]
pub struct MarketPlaceRequirements<M: ManagedTypeApi> {
    pub accepted_tokens: ManagedVec<M, TokenIdentifier<M>>,
    pub accepted_payments: ManagedVec<M, EgldOrEsdtTokenIdentifier<M>>,
    pub maximum_payment_fees: ManagedVec<M, BigUint<M>>,
    pub discount_fee_percentage_buyer: BigUint<M>,
    pub discount_fee_percentage_seller: BigUint<M>,
    pub percentage_cut_from_buyer: BigUint<M>,
    pub percentage_cut_from_seller: BigUint<M>,
}
#[derive(TopEncode, TopDecode, NestedEncode, NestedDecode, PartialEq, Clone, Debug, TypeAbi)]
pub struct DataNftAttributes<M: ManagedTypeApi> {
    pub data_stream_url: ManagedBuffer<M>,
    pub data_preview_url: ManagedBuffer<M>,
    pub data_marshal_url: ManagedBuffer<M>,
    pub creator: ManagedAddress<M>,
    pub creation_time: u64,
    pub title: ManagedBuffer<M>,
    pub description: ManagedBuffer<M>,
}

#[multiversx_sc::module]
pub trait StorageModule {
    #[view(getOffers)]
    #[storage_mapper("offers")]
    fn offers(&self) -> MapMapper<u64, Offer<Self::Api>>;

    #[view(getCancelledOffer)]
    #[storage_mapper("cancelled_offers")]
    fn cancelled_offers(&self, address: &ManagedAddress) -> MapMapper<u64, Offer<Self::Api>>;

    #[view(getUserListedOffers)]
    #[storage_mapper("user_offers")]
    fn user_listed_offers(&self, address: &ManagedAddress) -> UnorderedSetMapper<u64>;

    #[view(getAcceptedTokens)]
    #[storage_mapper("accepted_tokens")]
    fn accepted_tokens(&self) -> SetMapper<TokenIdentifier>;

    #[view(getAcceptedTokenPayments)]
    #[storage_mapper("accepted_payments")]
    fn accepted_payments(&self) -> MapMapper<EgldOrEsdtTokenIdentifier, BigUint>;

    #[view(getDiscountFeePercentageBuyer)]
    #[storage_mapper("discount_fee_percentage_buyer")]
    fn discount_fee_percentage_buyer(&self) -> SingleValueMapper<BigUint>;

    #[view(getDiscountFeePercentageSeller)]
    #[storage_mapper("discount_fee_percentage_seller")]
    fn discount_fee_percentage_seller(&self) -> SingleValueMapper<BigUint>;

    #[view(getPercentageCutFromSeller)]
    #[storage_mapper("percentage_from_adder_to_owner")]
    fn percentage_cut_from_seller(&self) -> SingleValueMapper<BigUint>;

    #[view(getPercentageCutFromBuyer)]
    #[storage_mapper("percentage_from_accepter_to_owner")]
    fn percentage_cut_from_buyer(&self) -> SingleValueMapper<BigUint>;

    #[view(getLastValidOfferId)]
    #[storage_mapper("last_valid_offer_id")]
    fn last_valid_offer_id(&self) -> SingleValueMapper<u64>;

    #[view(getIsPaused)]
    #[storage_mapper("pause")]
    fn is_paused(&self) -> SingleValueMapper<bool>;

    #[view(getTreasuryAddress)]
    #[storage_mapper("treasury_address")]
    fn treasury_address(&self) -> SingleValueMapper<ManagedAddress>;

    #[view(getClaimsAddress)]
    #[storage_mapper("claims_address")]
    fn claims_address(&self) -> SingleValueMapper<ManagedAddress>;

    #[view(getRoyaltiesClaimToken)]
    #[storage_mapper("royalties_accepted_token")]
    fn royalties_claim_token(&self) -> SingleValueMapper<TokenIdentifier>;

    #[view(getAdministrator)]
    #[storage_mapper("administrator")]
    fn administrator(&self) -> SingleValueMapper<ManagedAddress>;

    #[view(getClaimIsEnabled)]
    #[storage_mapper("claims_royalties_toggle")]
    fn claim_is_enabled(&self) -> SingleValueMapper<bool>;
}
