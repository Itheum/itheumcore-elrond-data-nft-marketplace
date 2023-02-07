multiversx_sc::imports!();
multiversx_sc::derive_imports!();

#[derive(TopEncode, TopDecode, TypeAbi, PartialEq, Eq, Clone, Copy, Debug)]
pub enum OfferType {
    PaymentOffer,
    FreeOffer,
}

#[derive(Clone, NestedEncode, NestedDecode, TopEncode, TopDecode, TypeAbi)]
pub struct Offer<M: ManagedTypeApi> {
    pub owner: ManagedAddress<M>,
    pub offered_token: EsdtTokenPayment<M>,
    pub wanted_token: EgldOrEsdtTokenPayment<M>,
    pub quantity: BigUint<M>,
}
#[derive(ManagedVecItem, Clone, NestedEncode, NestedDecode, TopEncode, TopDecode, TypeAbi)]
pub struct OfferOut<M: ManagedTypeApi> {
    pub index: u64,
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

    #[view(getEmptyOfferIndexes)]
    #[storage_mapper("empty_offer_indexes")]
    fn empty_offer_indexes(&self) -> UnorderedSetMapper<u64>;

    #[view(getHighestOfferIndex)]
    #[storage_mapper("highest_offer_index")]
    fn highest_offer_index(&self) -> SingleValueMapper<u64>;

    #[view(getIsPaused)]
    #[storage_mapper("pause")]
    fn is_paused(&self) -> SingleValueMapper<bool>;

    // Stores the treasury address
    #[view(getTreasuryAddress)]
    #[storage_mapper("treasury_address")]
    fn treasury_address(&self) -> SingleValueMapper<ManagedAddress>;

    // Stores admin address
    #[view(getAdministrator)]
    #[storage_mapper("administrator")]
    fn administrator(&self) -> SingleValueMapper<ManagedAddress>;
}
