pub const ERR_CONTRACT_ALREADY_INITIALIZED: &str = "Contract already initialized";
pub const ERR_DISCOUNTS_HIGHER_THAN_PERCENTAGE_CUTS: &str =
    "Discounts cannot be higher than the fee percentage cuts";
pub const ERR_FEES_CANNOT_BE_LOWER_THAN_DISCOUNTS: &str =
    "Fees cannot be lower than the discount percentage cuts";
pub const ERR_TOKEN_NOT_ACCEPTED: &str = "Token not accepted";
pub const ERR_QUANTITY_MUST_BE_POSITIVE: &str = "Quantity must be greater than 0";
pub const ERR_QUANTITY_TOO_HIGH: &str = "Quantity too high";
pub const ERR_QUANTITY_MUST_BE_A_DIVISOR: &str =
    "Quantity must be a divisor of offered token amount";
pub const ERR_PAYMENT_FEE_TOO_HIGH: &str = "Payment fee too high";
pub const ERR_MIN_AMOUNT_TOO_HIGH: &str = "Min amount too high";
pub const ERR_ONLY_OFFER_OWNER: &str = "Only offer owner can call this method";
pub const ERR_OFFER_NOT_FOUND: &str = "Offer not found";
pub const ERR_ONLY_SPECIAL_ADDRESS: &str = "Only special address can call this method";
pub const ERR_CANNOT_ACCEPT_OWN_OFFER: &str = "Cannot accept own offer";
pub const ERR_NOT_ENOUGH_QUANTITY: &str = "Not enough quantity";
pub const ERR_WRONG_TOKEN: &str = "Wrong token payment";
pub const ERR_WRONG_TOKEN_AMOUNT: &str = "Wrong token amount";
pub const ERR_MIN_AMOUNT_NOT_FILLED: &str = "Min amount not filled";
pub const ERR_ADDRESS_NOT_PRIVILEGED: &str = "Address is not privileged";
pub const ERR_MARKETPLACE_NOT_READY: &str = "Marketplace trade is not ready";
