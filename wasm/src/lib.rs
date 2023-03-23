// Code generated by the multiversx-sc multi-contract system. DO NOT EDIT.

////////////////////////////////////////////////////
////////////////// AUTO-GENERATED //////////////////
////////////////////////////////////////////////////

// Init:                                 1
// Endpoints:                           42
// Async Callback (empty):               1
// Total number of exported functions:  44

#![no_std]
#![feature(alloc_error_handler, lang_items)]

multiversx_sc_wasm_adapter::allocator!();
multiversx_sc_wasm_adapter::panic_handler!();

multiversx_sc_wasm_adapter::endpoints! {
    data_market
    (
        initializeContract
        setDiscounts
        setFees
        setClaimsContract
        setRoyaltiesClaimToken
        setClaimIsEnabled
        addAcceptedToken
        removeAcceptedToken
        addAcceptedPayment
        removeAcceptedPayment
        setIsPaused
        addOffer
        changeOfferPrice
        cancelOffer
        whithdrawCancelledOffer
        acceptOffer
        setTreasuryAddress
        setAdministrator
        getOffers
        getCancelledOffer
        getUserListedOffers
        getAcceptedTokens
        getAcceptedTokenPayments
        getDiscountFeePercentageBuyer
        getDiscountFeePercentageSeller
        getPercentageCutFromSeller
        getPercentageCutFromBuyer
        getHighestOfferIndex
        getIsPaused
        getTreasuryAddress
        getClaimsAddress
        getRoyaltiesClaimToken
        getAdministrator
        getClaimIsEnabled
        getRequirements
        viewPagedOffers
        getUserTotalOffers
        viewUserListedOffers
        viewCancelledOffers
        viewOffers
        viewOffer
        numberOfOffers
    )
}

multiversx_sc_wasm_adapter::empty_callback! {}
