elrond_wasm::imports!();
elrond_wasm::derive_imports!();

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
pub struct DataNftAttributes<M: ManagedTypeApi> {
    pub data_stream_url: ManagedBuffer<M>,
    pub data_preview_url: ManagedBuffer<M>,
    pub data_marchal_url: ManagedBuffer<M>,
    pub creator: ManagedAddress<M>,
    pub creation_time: u64,
}

#[elrond_wasm::module]
pub trait StorageModule {
    //storage
    #[storage_mapper("offers")]
    fn offers(&self) -> MapMapper<u64, Offer<Self::Api>>;

    #[storage_mapper("accepted_tokens")]
    fn accepted_tokens(&self) -> SetMapper<TokenIdentifier>;

    #[storage_mapper("accepted_payments")]
    fn accepted_payments(&self) -> SetMapper<EgldOrEsdtTokenIdentifier>;

    #[storage_mapper("percentage_from_adder_to_owner")]
    fn percentage_cut_from_seller(&self) -> SingleValueMapper<BigUint>;

    #[storage_mapper("percentage_from_accepter_to_owner")]
    fn percentage_cut_from_buyer(&self) -> SingleValueMapper<BigUint>;

    #[view(viewEmptyOfferIndexes)]
    #[storage_mapper("empty_offer_indexes")]
    fn empty_offer_indexes(&self) -> UnorderedSetMapper<u64>;

    #[view(viewHighestOfferIndex)]
    #[storage_mapper("highest_offer_index")]
    fn highest_offer_index(&self) -> SingleValueMapper<u64>;

    #[view(viewIsPaused)]
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
