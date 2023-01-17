// Code generated by the elrond-wasm multi-contract system. DO NOT EDIT.

////////////////////////////////////////////////////
////////////////// AUTO-GENERATED //////////////////
////////////////////////////////////////////////////

// Init:                                 1
// Endpoints:                           21
// Async Callback (empty):               1
// Total number of exported functions:  23

#![no_std]

elrond_wasm_node::wasm_endpoints! {
    data_market
    (
        initializeContract
        setDiscounts
        setFees
        addAcceptedToken
        addAcceptedPayment
        setMaximumPaymentFee
        setIsPaused
        addOffer
        cancelOffer
        acceptOffer
        setTreasuryAddress
        setAdministrator
        viewEmptyOfferIndexes
        viewHighestOfferIndex
        viewIsPaused
        getTreasuryAddress
        getAdministrator
        getRequirements
        viewOffers
        viewOffer
        numberOfOffers
    )
}

elrond_wasm_node::wasm_empty_callback! {}
