// Code generated by the multiversx-sc build system. DO NOT EDIT.

////////////////////////////////////////////////////
////////////////// AUTO-GENERATED //////////////////
////////////////////////////////////////////////////

// Init:                                 1
// Endpoints:                           44
// Async Callback (empty):               1
// Total number of exported functions:  46

#![no_std]
#![allow(internal_features)]
#![feature(lang_items)]

multiversx_sc_wasm_adapter::allocator!();
multiversx_sc_wasm_adapter::panic_handler!();

multiversx_sc_wasm_adapter::endpoints! {
    data_market
    (
        init => init
        initializeContract => initialize_contract
        setDiscounts => set_discounts
        setFees => set_fees
        setClaimsContract => set_claims_contract
        setRoyaltiesClaimToken => set_royalties_claims_token
        setClaimIsEnabled => set_claim_is_enabled
        addAcceptedToken => add_accepted_token
        removeAcceptedToken => remove_accepted_token
        addAcceptedPayment => add_accepted_payment
        removeAcceptedPayment => remove_accepted_payment
        setIsPaused => set_is_paused
        setMaxDefaultQuantity => set_max_default_quantity
        addOffer => add_offer
        changeOfferPrice => change_offer_price
        cancelOffer => cancel_offer
        withdrawCancelledOffer => withdraw_from_cancelled_offer
        acceptOffer => accept_offer
        setTreasuryAddress => set_treasury_address
        setAdministrator => set_administrator
        getOffers => offers
        getCancelledOffer => cancelled_offers
        getUserListedOffers => user_listed_offers
        getAcceptedTokens => accepted_tokens
        getAcceptedTokenPayments => accepted_payments
        getDiscountFeePercentageBuyer => discount_fee_percentage_buyer
        getDiscountFeePercentageSeller => discount_fee_percentage_seller
        getPercentageCutFromSeller => percentage_cut_from_seller
        getPercentageCutFromBuyer => percentage_cut_from_buyer
        getLastValidOfferId => last_valid_offer_id
        getIsPaused => is_paused
        getTreasuryAddress => treasury_address
        getClaimsAddress => claims_address
        getMaxDefaultQuantity => max_default_quantity
        getRoyaltiesClaimToken => royalties_claim_token
        getAdministrator => administrator
        getClaimIsEnabled => claim_is_enabled
        viewRequirements => view_requirements
        viewPagedOffers => view_paged_offers
        viewUserTotalOffers => view_user_total_offers
        viewUserListedOffers => view_user_listed_offers
        viewCancelledOffers => view_cancelled_offers
        viewOffers => view_offers
        viewOffer => view_offer
        viewNumberOfOffers => view_number_of_offers
    )
}

multiversx_sc_wasm_adapter::async_callback_empty! {}
