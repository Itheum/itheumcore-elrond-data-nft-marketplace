use std::u8;

use data_market::storage::*;

use data_market::offer_adding_utils::OfferAddingUtils;
use data_market::views::ViewsModule;
use data_market::DataMarket;

use multiversx_sc::codec::multi_types::OptionalValue;
use multiversx_sc::codec::Empty;
use multiversx_sc::types::{
    Address, EgldOrEsdtTokenPayment, EsdtLocalRole, EsdtTokenPayment, ManagedVec, MultiValueEncoded,
};
use multiversx_sc_scenario::multiversx_chain_vm::tx_mock::TxContextRef;
use multiversx_sc_scenario::testing_framework::{BlockchainStateWrapper, ContractObjWrapper};
use multiversx_sc_scenario::*;

pub const WASM_PATH: &'static str = "../output/data_market.wasm";
pub const OWNER_EGLD_BALANCE: u128 = 100 * 10u128.pow(18u32);
pub const TOKEN_ID: &[u8] = b"ITHEUM-df6f26";
pub const ANOTHER_TOKEN_ID: &[u8] = b"ANOTHER-123456";
pub const COLLECTION_NAME: &[u8] = b"DATANFT-FT";
pub const SFT_TICKER: &[u8] = b"DATANFTFT-1a2b3c";
pub const SFT_NAME: &[u8] = b"DATA NFT-FT";
pub const DATA_MARSHAL: &[u8] = b"https://DATA-MARSHAL-ENCRYPTED/marshal";
pub const DATA_STREAM: &[u8] = b"https://DATA-STREAM-ECRYPTED/stream";
pub const DATA_PREVIEW: &[u8] = b"https://DATA-STREAM-ECRYPTED/stream-preview";
pub const ROLES: &[EsdtLocalRole] = &[
    EsdtLocalRole::NftCreate,
    EsdtLocalRole::NftAddQuantity,
    EsdtLocalRole::NftBurn,
];

struct ContractSetup<ContractObjBuilder>
where
    ContractObjBuilder: 'static + Copy + Fn() -> data_market::ContractObj<DebugApi>,
{
    pub blockchain_wrapper: BlockchainStateWrapper,
    pub owner_address: Address,
    pub contract_wrapper:
        ContractObjWrapper<data_market::ContractObj<DebugApi>, ContractObjBuilder>,
    pub first_user_address: Address,
    pub second_user_address: Address,
    pub third_user_address: Address,
    pub treasury_address: Address,
    pub claims_address: Address,
}

fn setup_contract<ContractObjBuilder>(
    cf_builder: ContractObjBuilder,
) -> ContractSetup<ContractObjBuilder>
where
    ContractObjBuilder: 'static + Copy + Fn() -> data_market::ContractObj<DebugApi>,
{
    let rust_zero = rust_biguint!(0u64);
    let mut blockchain_wrapper = BlockchainStateWrapper::new();
    let first_user_address =
        blockchain_wrapper.create_user_account(&rust_biguint!(OWNER_EGLD_BALANCE / 100u128));
    let second_user_address =
        blockchain_wrapper.create_user_account(&rust_biguint!(OWNER_EGLD_BALANCE / 100u128));
    let owner_address = blockchain_wrapper.create_user_account(&rust_biguint!(OWNER_EGLD_BALANCE));
    let treasury_address =
        blockchain_wrapper.create_user_account(&rust_biguint!(OWNER_EGLD_BALANCE / 10u128));
    let cf_wrapper = blockchain_wrapper.create_sc_account(
        &rust_zero,
        Some(&owner_address),
        cf_builder,
        WASM_PATH,
    );
    let third_user_address =
        blockchain_wrapper.create_user_account(&rust_biguint!(OWNER_EGLD_BALANCE / 100u128));
    let claims_address =
        blockchain_wrapper.create_user_account(&rust_biguint!(OWNER_EGLD_BALANCE / 50u128));

    blockchain_wrapper.set_esdt_balance(&third_user_address, TOKEN_ID, &rust_biguint!(10_000));
    blockchain_wrapper.set_esdt_balance(&owner_address, TOKEN_ID, &rust_biguint!(5_000_000));
    blockchain_wrapper.set_esdt_balance(
        &owner_address,
        ANOTHER_TOKEN_ID,
        &rust_biguint!(1_000_000),
    );
    blockchain_wrapper.set_esdt_balance(&first_user_address, TOKEN_ID, &rust_biguint!(10_000));
    blockchain_wrapper.set_esdt_balance(&owner_address, ANOTHER_TOKEN_ID, &rust_biguint!(10_000));
    blockchain_wrapper.set_esdt_balance(
        &first_user_address,
        ANOTHER_TOKEN_ID,
        &rust_biguint!(10_000),
    );
    blockchain_wrapper.set_esdt_balance(&second_user_address, TOKEN_ID, &rust_biguint!(10_000));
    blockchain_wrapper.set_esdt_balance(
        &second_user_address,
        ANOTHER_TOKEN_ID,
        &rust_biguint!(10_000),
    );

    blockchain_wrapper.set_esdt_balance(
        &third_user_address,
        ANOTHER_TOKEN_ID,
        &rust_biguint!(10_000),
    );

    let _ = DebugApi::dummy();

    blockchain_wrapper.set_nft_balance(
        &first_user_address,
        SFT_TICKER,
        1u64,
        &rust_biguint!(10u64),
        &DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&first_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        },
    );

    blockchain_wrapper.set_nft_balance_all_properties(
        &second_user_address,
        SFT_TICKER,
        2u64,
        &rust_biguint!(20u64),
        &DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        },
        500u64,
        Some(&second_user_address),
        Option::None,
        Option::None,
        &[DATA_PREVIEW.to_vec()],
    );

    blockchain_wrapper.set_esdt_local_roles(cf_wrapper.address_ref(), SFT_TICKER, ROLES);

    blockchain_wrapper
        .execute_tx(&owner_address, &cf_wrapper, &rust_zero, |sc| {
            sc.init();
        })
        .assert_ok();

    ContractSetup {
        blockchain_wrapper,
        owner_address,
        first_user_address,
        second_user_address,
        treasury_address,
        claims_address,
        third_user_address,
        contract_wrapper: cf_wrapper,
    }
}

#[test] // Tests whether the contract is deployed and initialized correctly after deployment.
fn deploy_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    setup
        .blockchain_wrapper
        .execute_tx(
            &setup.owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.init();
            },
        )
        .assert_ok();

    setup
        .blockchain_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.percentage_cut_from_seller().get(),
                managed_biguint!(200u64)
            );
            assert_eq!(
                sc.percentage_cut_from_buyer().get(),
                managed_biguint!(200u64)
            );
            assert_eq!(
                sc.discount_fee_percentage_buyer().get(),
                managed_biguint!(0u64)
            );
            assert_eq!(
                sc.discount_fee_percentage_seller().get(),
                managed_biguint!(0u64)
            );
            assert_eq!(sc.is_paused().get(), true);
        })
        .assert_ok();
}

#[test] //Tests owner setting a new admin
        //Tests whether pause correct state after deployment
        //Tests whether the owner can unpause the contract and pause again
        //Tests whether the admin can unpause the contract
fn pause_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let administrator_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_administrator(managed_address!(administrator_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.is_paused().get(), true)
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.is_paused().get(), false)
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(true);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.is_paused().get(), true)
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.is_paused().get(), false)
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            &second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_user_error("Address is not privileged");

    // [test] check if owner can set the discounts
    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_discounts(managed_biguint!(050u64), managed_biguint!(050u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_discounts(managed_biguint!(050u64), managed_biguint!(050u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_discounts(managed_biguint!(050u64), managed_biguint!(050u64));
            },
        )
        .assert_user_error("Address is not privileged");

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.discount_fee_percentage_buyer().get(),
                managed_biguint!(050u64)
            );
            assert_eq!(
                sc.discount_fee_percentage_seller().get(),
                managed_biguint!(050u64)
            );
        })
        .assert_ok();
}

#[test]
fn initialize_contract_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.initialize_contract(
                    managed_token_id!(SFT_TICKER),
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                    managed_address!(treasury_address),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.initialize_contract(
                    managed_token_id!(SFT_TICKER),
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                    managed_address!(treasury_address),
                );
            },
        )
        .assert_user_error("Contract already initialized");
}

// [TO DO] Requirements test
#[test]
fn requirements_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let administrator_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;
    let treasury_address = &setup.treasury_address;

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_administrator(managed_address!(administrator_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(true);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_user_error("Address is not privileged");

    // [test] test that the owner and administrator can set the fees
    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_fees(managed_biguint!(10u64), managed_biguint!(20u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_fees(managed_biguint!(10u64), managed_biguint!(20u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_discounts(managed_biguint!(11u64), managed_biguint!(22u64));
            },
        )
        .assert_user_error("Discounts cannot be higher than the fee percentage cuts");

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_discounts(managed_biguint!(10u64), managed_biguint!(20u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_fees(managed_biguint!(6u64), managed_biguint!(2u64));
            },
        )
        .assert_user_error("Fees cannot be lower than the discount percentage cuts");

    b_wrapper
        .execute_tx(
            &second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_fees(managed_biguint!(10u64), managed_biguint!(20u64));
            },
        )
        .assert_user_error("Address is not privileged");

    // [test] test that the owner and administrator can set accepted token
    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(TOKEN_ID));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(TOKEN_ID));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_user_error("Address is not privileged");

    // [test] that the owner and administratot can set the token payment
    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_user_error("Address is not privileged");

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_user_error("Marketplace trade is not ready");

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_user_error("Marketplace trade is not ready");

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_user_error("Marketplace trade is not ready");

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_user_error("Marketplace trade is not ready");

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_administrator(managed_address!(second_user_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();
}
#[test] // Tests whether the owner and administrator can set the fees
fn value_setters_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let second_user_address = &setup.second_user_address;
    let administrator_address = &setup.first_user_address;
    let treasury_address = &setup.treasury_address;

    // Test set_fees function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_fees(managed_biguint!(10u64), managed_biguint!(20u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.percentage_cut_from_seller().get(),
                managed_biguint!(10u64)
            );
            assert_eq!(
                sc.percentage_cut_from_buyer().get(),
                managed_biguint!(20u64)
            );
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_administrator(managed_address!(administrator_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_fees(managed_biguint!(20u64), managed_biguint!(30u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_fees(managed_biguint!(10u64), managed_biguint!(20u64));
            },
        )
        .assert_user_error("Address is not privileged");

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.percentage_cut_from_seller().get(),
                managed_biguint!(20u64)
            );
            assert_eq!(
                sc.percentage_cut_from_buyer().get(),
                managed_biguint!(30u64)
            );
        })
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.accepted_tokens()
                    .contains(&managed_token_id!(SFT_TICKER)),
                true
            );
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.accepted_tokens()
                    .contains(&managed_token_id!(SFT_TICKER)),
                true
            );
        })
        .assert_ok();

    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.accepted_payments()
                    .contains_key(&managed_token_id_wrapped!(TOKEN_ID)),
                true
            );
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.accepted_payments()
                    .contains_key(&managed_token_id_wrapped!(TOKEN_ID)),
                true
            );
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.treasury_address().get(),
                managed_address!(treasury_address)
            );
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                let offer = Offer {
                    owner: managed_address!(owner_address),
                    offered_token: EsdtTokenPayment::new(
                        managed_token_id!(SFT_TICKER),
                        1u64,
                        managed_biguint!(10u64),
                    ),
                    wanted_token: EgldOrEsdtTokenPayment::new(
                        managed_token_id_wrapped!(TOKEN_ID),
                        0,
                        managed_biguint!(200u64),
                    ),
                    quantity: managed_biguint!(1u64),
                };
                sc.offers().insert(1u64, offer);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(owner_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    1u64,
                    managed_biguint!(10u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(200u64),
                ),
                quantity: managed_biguint!(1u64),
            };
            assert_eq!(sc.offers().len(), 1usize);

            let offer_from_storage = sc.offers().get(&1u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();
}

#[test]
fn create_offer_index_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;

    // Test creating an offer index when empty_offer_indexes is empty
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                assert_eq!(sc.create_offer_index(), 0);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.highest_offer_index().get(), 1u64);
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                assert_eq!(sc.create_offer_index(), 1);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.highest_offer_index().get(), 2u64);
        })
        .assert_ok();

    // Test creating an offer index when empty_offer_indexes is not empty and has already the index
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                assert_eq!(sc.empty_offer_indexes().insert(1), true);
                assert_eq!(sc.empty_offer_indexes().len(), 1usize);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                assert_eq!(sc.create_offer_index(), 1);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                assert_eq!(sc.create_offer_index(), 2);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                assert_eq!(sc.empty_offer_indexes().len(), 0usize);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                assert_eq!(sc.create_offer_index(), 3);
            },
        )
        .assert_ok();
}

#[test]
fn add_offer_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;
    let first_user_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;

    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            first_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(1u64)),
                );
            },
        )
        .assert_user_error("Marketplace trade is not ready");

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            ANOTHER_TOKEN_ID,
            0,
            &rust_biguint!(10u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::None,
                );
            },
        )
        .assert_user_error("Token not accepted");

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            1,
            &rust_biguint!(10u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(ANOTHER_TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::None,
                );
            },
        )
        .assert_user_error("Token not accepted");

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.highest_offer_index().get(), 0u64);
            assert_eq!(sc.offers().len(), 0usize);
            assert_eq!(sc.empty_offer_indexes().len(), 0usize)
        })
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            1,
            &rust_biguint!(10u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::None,
                );
            },
        )
        .assert_ok();

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        1u64,
        &rust_biguint!(10u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&first_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.highest_offer_index().get(), 1u64);
            assert_eq!(sc.offers().len(), 1usize);
            assert_eq!(sc.empty_offer_indexes().len(), 0usize);
            assert_eq!(
                sc.user_listed_offers(&managed_address!(first_user_address))
                    .len(),
                1usize
            );
            assert_eq!(
                sc.user_listed_offers(&managed_address!(first_user_address))
                    .contains(&0u64),
                true
            )
        })
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(first_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    1u64,
                    managed_biguint!(10u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(200u64),
                ),
                quantity: managed_biguint!(1u64),
            };

            let offer_from_storage = sc.offers().get(&0u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(10u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(0u64)),
                );
            },
        )
        .assert_user_error("Quantity must be greater than 0");

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(20u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(21u64)),
                );
            },
        )
        .assert_user_error("Quantity must be less than offered token amount");

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(20u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(3u64)),
                );
            },
        )
        .assert_user_error("Quantity must be a divisor of offered token amount");

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(20u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(0u64),
                    OptionalValue::Some(managed_biguint!(4u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.highest_offer_index().get(), 2u64);
            assert_eq!(sc.offers().len(), 2usize);
            assert_eq!(sc.empty_offer_indexes().len(), 0usize);
            assert_eq!(
                sc.user_listed_offers(&managed_address!(second_user_address))
                    .len(),
                1usize
            );
            assert_eq!(
                sc.user_listed_offers(&managed_address!(second_user_address))
                    .contains(&1u64),
                true
            );
        })
        .assert_ok();

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        2u64,
        &rust_biguint!(20u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(second_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    2u64,
                    managed_biguint!(5u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(0u64),
                ),
                quantity: managed_biguint!(4u64),
            };

            let offer_from_storage = sc.offers().get(&1u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();
}

// [TO DO] Add test for cancelOffer
#[test]
fn cancel_offer_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;
    let first_user_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;
    let administrator_address = &setup.third_user_address;

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(true);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            first_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.cancel_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_user_error("Offer not found");

    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_administrator(managed_address!(administrator_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            1,
            &rust_biguint!(10u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::None,
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(20u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(4u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.cancel_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_user_error("Only special addresses can cancel offers");

    b_wrapper
        .execute_tx(
            first_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.cancel_offer(0u64, managed_biguint!(30u64));
            },
        )
        .assert_user_error("Quantity too high");

    b_wrapper
        .execute_tx(
            first_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.cancel_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.cancel_offer(1u64, managed_biguint!(2u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            administrator_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.cancel_offer(1u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.offers().len(), 1usize);
            assert_eq!(sc.empty_offer_indexes().len(), 1usize);
            assert_eq!(
                sc.user_listed_offers(&managed_address!(first_user_address))
                    .len(),
                0usize
            );
            assert_eq!(
                sc.user_listed_offers(&managed_address!(second_user_address))
                    .len(),
                1usize
            );
            assert_eq!(
                sc.user_listed_offers(&managed_address!(first_user_address))
                    .contains(&0u64),
                false
            );
            assert_eq!(
                sc.user_listed_offers(&managed_address!(second_user_address))
                    .contains(&1u64),
                true
            );
        })
        .assert_ok();

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        2u64,
        &rust_biguint!(5u64),
        Option::<&Empty>::None,
    );

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        1u64,
        &rust_biguint!(0u64),
        Option::<&Empty>::None,
    );
}

// [TO DO] Add test for acceptOffer

#[test]
fn accept_offer_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;
    let first_user_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;
    let third_user_address = &setup.third_user_address;
    let claims_address = &setup.claims_address;

    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_royalties_claims_token(managed_token_id!(TOKEN_ID));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_claims_contract(managed_address!(claims_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0u64,
            &rust_biguint!(0u64),
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(4u64));
            },
        )
        .assert_user_error("You cannot accept your own offer");

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0u64,
            &rust_biguint!(0u64),
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(4u64));
            },
        )
        .assert_user_error("Not enough quantity");

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            ANOTHER_TOKEN_ID,
            0u64,
            &rust_biguint!(0u64),
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_user_error("Wrong token payment");

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0u64,
            &rust_biguint!(0u64),
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_user_error("Wrong token payment amount");

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0,
            &(&rust_biguint!(200u64)
                + ((&rust_biguint!(200u64) * rust_biguint!(200u64)) / rust_biguint!(10000u64))),
            |sc| {
                sc.accept_offer(3u64, managed_biguint!(1u64));
            },
        )
        .assert_user_error("Offer not found");

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0,
            &(&rust_biguint!(100)
                + ((&rust_biguint!(100) * rust_biguint!(200u64)) / rust_biguint!(10000u64))), // buyer needs to send with % fee included
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.user_listed_offers(&managed_address!(second_user_address))
                    .len(),
                1usize
            );
            assert_eq!(
                sc.user_listed_offers(&managed_address!(second_user_address))
                    .contains(&0u64),
                true
            );
        })
        .assert_ok();

    // first sell no royalties

    let claims_contract_balance = b_wrapper.get_esdt_balance(claims_address, TOKEN_ID, 0u64);
    assert_eq!(claims_contract_balance, rust_biguint!(0u64));

    let first_user_balance = b_wrapper.get_esdt_balance(first_user_address, TOKEN_ID, 0u64);
    assert_eq!(first_user_balance, rust_biguint!(9_898)); // 10_000 initial + 98 from offer

    let second_user_balance = b_wrapper.get_esdt_balance(second_user_address, TOKEN_ID, 0u64);
    assert_eq!(second_user_balance, rust_biguint!(10_098)); // pays the 100 tax + 2 % fee

    let treasury_address_balance = b_wrapper.get_esdt_balance(treasury_address, TOKEN_ID, 0u64);
    assert_eq!(treasury_address_balance, rust_biguint!(4u64)); // 2% from buyer , 2 % from seller

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        2u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper.check_nft_balance(
        &first_user_address,
        SFT_TICKER,
        2u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(1u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(1_000),
                    OptionalValue::None,
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.user_listed_offers(&managed_address!(first_user_address))
                    .len(),
                1usize
            );
        })
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            third_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0,
            &(&rust_biguint!(1_000)
                + ((&rust_biguint!(1_000) * rust_biguint!(200u64)) / rust_biguint!(10000u64))), // buyer needs to send with % fee included
            |sc| {
                sc.accept_offer(1u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(
                sc.user_listed_offers(&managed_address!(first_user_address))
                    .len(),
                0usize
            );
            assert_eq!(
                sc.user_listed_offers(&managed_address!(first_user_address))
                    .contains(&1u64),
                false
            );
        })
        .assert_ok();

    let treasury_address_balance = b_wrapper.get_esdt_balance(treasury_address, TOKEN_ID, 0u64);
    assert_eq!(treasury_address_balance, rust_biguint!(44u64)); // 2% from buyer , 2 % from seller  total: 40 tokens

    let second_user_balance = b_wrapper.get_esdt_balance(second_user_address, TOKEN_ID, 0u64);
    assert_eq!(second_user_balance, rust_biguint!(10_147)); // 10_098 initial balance + 49 (5 %) royalties

    let claims_contract_balance = b_wrapper.get_esdt_balance(claims_address, TOKEN_ID, 0u64);
    assert_eq!(claims_contract_balance, rust_biguint!(0u64)); // 49 tokens royalties    5%

    let first_user_balance = b_wrapper.get_esdt_balance(first_user_address, TOKEN_ID, 0u64);
    assert_eq!(first_user_balance, rust_biguint!(10_829)); // 9_898 initial balance + 931 (1_000 - 49 - 20) sale price after taxes

    // Still 1 token from the first offer
    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        2u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper.check_nft_balance(
        &third_user_address,
        SFT_TICKER,
        2u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            1,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(first_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    1u64,
                    managed_biguint!(1u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(100u64),
                ),
                quantity: managed_biguint!(2u64),
            };

            let offer_from_storage = sc.offers().get(&1u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.discount_fee_percentage_seller()
                    .set(managed_biguint!(050u64));
                sc.discount_fee_percentage_buyer()
                    .set(managed_biguint!(050u64));
            },
        )
        .assert_ok();

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        1u64,
        &rust_biguint!(2u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&first_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_claim_is_enabled(true);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            third_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0,
            &(&rust_biguint!(100)
                + ((&rust_biguint!(100) * rust_biguint!(150u64)) / rust_biguint!(10000u64))), // buyer needs to send with % fee included
            |sc| {
                sc.accept_offer(1u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    let treasury_address_balance = b_wrapper.get_esdt_balance(treasury_address, TOKEN_ID, 0u64);
    assert_eq!(treasury_address_balance, rust_biguint!(46u64)); // 1.5% from buyer , 1.5 % from seller  total: 40 tokens

    let first_user_balance = b_wrapper.get_esdt_balance(first_user_address, TOKEN_ID, 0u64);
    assert_eq!(first_user_balance, rust_biguint!(10_928));

    let third_user_address_balance = b_wrapper.get_esdt_balance(third_user_address, TOKEN_ID, 0u64);
    assert_eq!(third_user_address_balance, rust_biguint!(8_879));

    b_wrapper.check_nft_balance(
        &third_user_address,
        SFT_TICKER,
        1u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&first_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_esdt_transfer(
            third_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            1,
            &rust_biguint!(1u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(0),
                    OptionalValue::Some(managed_biguint!(1u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0,
            &rust_biguint!(0), // buyer needs to send with % fee included
            |sc| {
                sc.accept_offer(2u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    let treasury_address_balance = b_wrapper.get_esdt_balance(treasury_address, TOKEN_ID, 0u64);
    assert_eq!(treasury_address_balance, rust_biguint!(46u64)); // there is 0 fee if the NFT sale price is 0

    let third_user_address_balance = b_wrapper.get_esdt_balance(third_user_address, TOKEN_ID, 0u64);
    assert_eq!(third_user_address_balance, rust_biguint!(8_879)); // the seller does not receive any payment tokens

    // first user has accepts third user offer for 0 TOKEN_ID and now has 9 SFT_TICKER with NONCE 1
    b_wrapper.check_nft_balance(
        &first_user_address,
        SFT_TICKER,
        1u64,
        &rust_biguint!(9u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&first_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    // first user has 1 NFT for sale
    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        1u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&first_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );
}
// [TO DO] Add test to accept offer with non accepted royalties token identifier
#[test]
fn accept_offer_non_accepted_royalties_token_id_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;
    let first_user_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;
    let third_user_address = &setup.third_user_address;
    let claims_address = &setup.claims_address;

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(true);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_claim_is_enabled(true); // true - but the token traded is not meant to be send to the claims contract
            },
        )
        .assert_ok();
    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(ANOTHER_TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_royalties_claims_token(managed_token_id!(TOKEN_ID));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_claims_contract(managed_address!(claims_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(1u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(1u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0,
            &(&rust_biguint!(200u64)
                + ((&rust_biguint!(200u64) * rust_biguint!(200u64)) / rust_biguint!(10000u64))),
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    b_wrapper.check_nft_balance(
        &first_user_address,
        SFT_TICKER,
        2u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    let treasury_address_balance = b_wrapper.get_esdt_balance(treasury_address, TOKEN_ID, 0u64);
    assert_eq!(treasury_address_balance, rust_biguint!(8u64));

    let first_user_balance = b_wrapper.get_esdt_balance(first_user_address, TOKEN_ID, 0u64);
    assert_eq!(first_user_balance, rust_biguint!(9_796));

    let second_user_balance = b_wrapper.get_esdt_balance(second_user_address, TOKEN_ID, 0u64);
    assert_eq!(second_user_balance, rust_biguint!(10_196));

    let claims_contract_balance = b_wrapper.get_esdt_balance(claims_address, TOKEN_ID, 0u64);
    assert_eq!(claims_contract_balance, rust_biguint!(0u64));

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(1u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(ANOTHER_TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(1u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            third_user_address,
            &setup.contract_wrapper,
            ANOTHER_TOKEN_ID,
            0,
            &(&rust_biguint!(200u64)
                + ((&rust_biguint!(200u64) * rust_biguint!(200u64)) / rust_biguint!(10000u64))),
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    b_wrapper.check_nft_balance(
        &third_user_address,
        SFT_TICKER,
        2u64,
        &rust_biguint!(1u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    let treasury_address_balance =
        b_wrapper.get_esdt_balance(treasury_address, ANOTHER_TOKEN_ID, 0u64);
    assert_eq!(treasury_address_balance, rust_biguint!(8u64));

    let first_user_balance = b_wrapper.get_esdt_balance(first_user_address, ANOTHER_TOKEN_ID, 0u64);
    assert_eq!(first_user_balance, rust_biguint!(10_187));

    let second_user_balance =
        b_wrapper.get_esdt_balance(second_user_address, ANOTHER_TOKEN_ID, 0u64);
    assert_eq!(second_user_balance, rust_biguint!(10_009)); // royalties were sent directly to the creator

    let claims_contract_balance = b_wrapper.get_esdt_balance(claims_address, TOKEN_ID, 0u64);
    assert_eq!(claims_contract_balance, rust_biguint!(0u64)); // no royalties were sent to the claims contract
}

// [TO DO] Add test for views
#[test]
fn views_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;
    let first_user_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;

    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            1,
            &rust_biguint!(10u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::None,
                );
            },
        )
        .assert_ok();

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        1u64,
        &rust_biguint!(10u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&first_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.highest_offer_index().get(), 1u64);
            assert_eq!(sc.offers().len(), 1usize);
            assert_eq!(sc.empty_offer_indexes().len(), 0usize);
        })
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(first_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    1u64,
                    managed_biguint!(10u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(200u64),
                ),
                quantity: managed_biguint!(1u64),
            };

            let offer_from_storage = sc.offers().get(&0u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(20u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(200u64),
                    OptionalValue::Some(managed_biguint!(4u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper.check_nft_balance(
        &setup.contract_wrapper.address_ref(),
        SFT_TICKER,
        2u64,
        &rust_biguint!(20u64),
        Option::Some(&DataNftAttributes::<DebugApi> {
            data_preview_url: managed_buffer!(DATA_PREVIEW),
            data_stream_url: managed_buffer!(DATA_STREAM),
            data_marshal_url: managed_buffer!(DATA_MARSHAL),
            creator: managed_address!(&second_user_address),
            creation_time: 100u64,
            title: managed_buffer!(SFT_NAME),
            description: managed_buffer!(SFT_NAME),
        }),
    );

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(second_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    2u64,
                    managed_biguint!(5u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(200u64),
                ),
                quantity: managed_biguint!(4u64),
            };

            let offer_from_storage = sc.offers().get(&1u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            assert_eq!(sc.view_number_of_offers(), 2usize);
        })
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer_mock = OfferOut::<DebugApi> {
                index: 0u64,
                owner: managed_address!(first_user_address),
                offered_token_identifier: managed_token_id!(SFT_TICKER),
                offered_token_nonce: 1u64,
                offered_token_amount: managed_biguint!(10u64),
                wanted_token_identifier: managed_token_id_wrapped!(TOKEN_ID),
                wanted_token_nonce: 0u64,
                wanted_token_amount: managed_biguint!(204u64),
                quantity: managed_biguint!(1u64),
            };

            let offer_out = sc.view_offer(0u64).unwrap();

            assert_eq!(offer_out.index, offer_mock.index);
            assert_eq!(offer_out.owner, offer_mock.owner);
            assert_eq!(
                offer_out.offered_token_identifier,
                offer_mock.offered_token_identifier
            );
            assert_eq!(
                offer_out.offered_token_nonce,
                offer_mock.offered_token_nonce
            );
            assert_eq!(
                offer_out.offered_token_amount,
                offer_mock.offered_token_amount
            );
            assert_eq!(
                offer_out.wanted_token_identifier,
                offer_mock.wanted_token_identifier
            );
            assert_eq!(offer_out.wanted_token_nonce, offer_mock.wanted_token_nonce);
            assert_eq!(
                offer_out.wanted_token_amount,
                offer_mock.wanted_token_amount
            );
        })
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer_mock_1 = OfferOut::<DebugApi> {
                index: 0u64,
                owner: managed_address!(first_user_address),
                offered_token_identifier: managed_token_id!(SFT_TICKER),
                offered_token_nonce: 1u64,
                offered_token_amount: managed_biguint!(10u64),
                wanted_token_identifier: managed_token_id_wrapped!(TOKEN_ID),
                wanted_token_nonce: 0u64,
                wanted_token_amount: managed_biguint!(204u64),
                quantity: managed_biguint!(1u64),
            };

            let offer_mock_2 = OfferOut::<DebugApi> {
                index: 1u64,
                owner: managed_address!(second_user_address),
                offered_token_identifier: managed_token_id!(SFT_TICKER),
                offered_token_nonce: 2u64,
                offered_token_amount: managed_biguint!(5u64),
                wanted_token_identifier: managed_token_id_wrapped!(TOKEN_ID),
                wanted_token_nonce: 0u64,
                wanted_token_amount: managed_biguint!(204u64),
                quantity: managed_biguint!(4u64),
            };

            let offers = sc.view_offers_paged(0u64, 1u64, OptionalValue::None);

            assert_eq!(offers.get(0usize).index, offer_mock_1.index);
            assert_eq!(offers.get(0usize).owner, offer_mock_1.owner);
            assert_eq!(
                offers.get(0usize).offered_token_identifier,
                offer_mock_1.offered_token_identifier
            );
            assert_eq!(
                offers.get(0usize).offered_token_nonce,
                offer_mock_1.offered_token_nonce
            );
            assert_eq!(
                offers.get(0usize).offered_token_amount,
                offer_mock_1.offered_token_amount
            );
            assert_eq!(
                offers.get(0usize).wanted_token_identifier,
                offer_mock_1.wanted_token_identifier
            );
            assert_eq!(
                offers.get(0usize).wanted_token_nonce,
                offer_mock_1.wanted_token_nonce
            );
            assert_eq!(
                offers.get(0usize).wanted_token_amount,
                offer_mock_1.wanted_token_amount
            );
            assert_eq!(offers.get(0usize).quantity, offer_mock_1.quantity);

            assert_eq!(offers.get(1usize).index, offer_mock_2.index);
            assert_eq!(offers.get(1usize).owner, offer_mock_2.owner);
            assert_eq!(
                offers.get(1usize).offered_token_identifier,
                offer_mock_2.offered_token_identifier
            );
            assert_eq!(
                offers.get(1usize).offered_token_nonce,
                offer_mock_2.offered_token_nonce
            );
            assert_eq!(
                offers.get(1usize).offered_token_amount,
                offer_mock_2.offered_token_amount
            );
            assert_eq!(
                offers.get(1usize).wanted_token_identifier,
                offer_mock_2.wanted_token_identifier
            );
            assert_eq!(
                offers.get(1usize).wanted_token_nonce,
                offer_mock_2.wanted_token_nonce
            );
            assert_eq!(
                offers.get(1usize).wanted_token_amount,
                offer_mock_2.wanted_token_amount
            );
            assert_eq!(offers.get(1usize).quantity, offer_mock_2.quantity);

            let offers_2 = sc.view_offers_paged(
                0u64,
                1u64,
                OptionalValue::Some(managed_address!(first_user_address)),
            );

            assert_eq!(offers_2.get(0usize).index, offer_mock_1.index);
            assert_eq!(offers_2.get(0usize).owner, offer_mock_1.owner);
            assert_eq!(
                offers_2.get(0usize).offered_token_identifier,
                offer_mock_1.offered_token_identifier
            );
            assert_eq!(
                offers_2.get(0usize).offered_token_nonce,
                offer_mock_1.offered_token_nonce
            );
            assert_eq!(
                offers_2.get(0usize).offered_token_amount,
                offer_mock_1.offered_token_amount
            );
            assert_eq!(
                offers_2.get(0usize).wanted_token_identifier,
                offer_mock_1.wanted_token_identifier
            );
            assert_eq!(
                offers_2.get(0usize).wanted_token_nonce,
                offer_mock_1.wanted_token_nonce
            );
            assert_eq!(
                offers_2.get(0usize).wanted_token_amount,
                offer_mock_1.wanted_token_amount
            );
            assert_eq!(offers_2.get(0usize).quantity, offer_mock_1.quantity);

            assert_eq!(offers_2.len(), 1usize);

            assert_eq!(
                sc.view_user_total_offers(&managed_address!(first_user_address)),
                1usize
            );

            let mut multi_values = MultiValueEncoded::new();
            multi_values.push(0u64);
            multi_values.push(1u64);

            let offers_3 = sc.view_offers(multi_values);

            assert_eq!(offers_3.get(0usize).index, offer_mock_1.index);
            assert_eq!(offers_3.get(0usize).owner, offer_mock_1.owner);
            assert_eq!(
                offers_3.get(0usize).offered_token_identifier,
                offer_mock_1.offered_token_identifier
            );
            assert_eq!(
                offers_3.get(0usize).offered_token_nonce,
                offer_mock_1.offered_token_nonce
            );
            assert_eq!(
                offers_3.get(0usize).offered_token_amount,
                offer_mock_1.offered_token_amount
            );
            assert_eq!(
                offers_3.get(0usize).wanted_token_identifier,
                offer_mock_1.wanted_token_identifier
            );
            assert_eq!(
                offers_3.get(0usize).wanted_token_nonce,
                offer_mock_1.wanted_token_nonce
            );
            assert_eq!(
                offers_3.get(0usize).wanted_token_amount,
                offer_mock_1.wanted_token_amount
            );
            assert_eq!(offers_3.get(0usize).quantity, offer_mock_1.quantity);

            assert_eq!(offers_3.get(1usize).index, offer_mock_2.index);
            assert_eq!(offers_3.get(1usize).owner, offer_mock_2.owner);
            assert_eq!(
                offers_3.get(1usize).offered_token_identifier,
                offer_mock_2.offered_token_identifier
            );
            assert_eq!(
                offers_3.get(1usize).offered_token_nonce,
                offer_mock_2.offered_token_nonce
            );
            assert_eq!(
                offers_3.get(1usize).offered_token_amount,
                offer_mock_2.offered_token_amount
            );
            assert_eq!(
                offers_3.get(1usize).wanted_token_identifier,
                offer_mock_2.wanted_token_identifier
            );
            assert_eq!(
                offers_3.get(1usize).wanted_token_nonce,
                offer_mock_2.wanted_token_nonce
            );
            assert_eq!(
                offers_3.get(1usize).wanted_token_amount,
                offer_mock_2.wanted_token_amount
            );
            assert_eq!(offers_3.get(1usize).quantity, offer_mock_2.quantity);

            let offers_4 = sc.view_user_listed_offers(&managed_address!(first_user_address));

            assert_eq!(offers_4.get(0usize).index, offer_mock_1.index);
            assert_eq!(offers_4.get(0usize).owner, offer_mock_1.owner);
            assert_eq!(
                offers_4.get(0usize).offered_token_identifier,
                offer_mock_1.offered_token_identifier
            );
            assert_eq!(
                offers_4.get(0usize).offered_token_nonce,
                offer_mock_1.offered_token_nonce
            );
            assert_eq!(
                offers_4.get(0usize).offered_token_amount,
                offer_mock_1.offered_token_amount
            );
            assert_eq!(
                offers_4.get(0usize).wanted_token_identifier,
                offer_mock_1.wanted_token_identifier
            );
            assert_eq!(
                offers_4.get(0usize).wanted_token_nonce,
                offer_mock_1.wanted_token_nonce
            );
            assert_eq!(
                offers_4.get(0usize).wanted_token_amount,
                offer_mock_1.wanted_token_amount
            );
            assert_eq!(offers_4.get(0usize).quantity, offer_mock_1.quantity);

            let offers_5 = sc.view_user_listed_offers(&managed_address!(second_user_address));
            assert_eq!(offers_5.get(0usize).index, offer_mock_2.index);
            assert_eq!(offers_5.get(0usize).owner, offer_mock_2.owner);
            assert_eq!(
                offers_5.get(0usize).offered_token_identifier,
                offer_mock_2.offered_token_identifier
            );
            assert_eq!(
                offers_5.get(0usize).offered_token_nonce,
                offer_mock_2.offered_token_nonce
            );
            assert_eq!(
                offers_5.get(0usize).offered_token_amount,
                offer_mock_2.offered_token_amount
            );
            assert_eq!(
                offers_5.get(0usize).wanted_token_identifier,
                offer_mock_2.wanted_token_identifier
            );
            assert_eq!(
                offers_5.get(0usize).wanted_token_nonce,
                offer_mock_2.wanted_token_nonce
            );
            assert_eq!(
                offers_5.get(0usize).wanted_token_amount,
                offer_mock_2.wanted_token_amount
            );
            assert_eq!(offers_5.get(0usize).quantity, offer_mock_2.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let mut accepted_tokens = ManagedVec::new();
            accepted_tokens.push(managed_token_id!(SFT_TICKER));
            let mut accepted_payments = ManagedVec::new();
            accepted_payments.push(managed_token_id_wrapped!(TOKEN_ID));
            let mut maximum_payment_fees = ManagedVec::new();
            maximum_payment_fees.push(managed_biguint!(10_000));
            let req = MarketPlaceRequirements::<DebugApi> {
                accepted_tokens,
                accepted_payments,
                maximum_payment_fees,
                discount_fee_percentage_buyer: managed_biguint!(0),
                discount_fee_percentage_seller: managed_biguint!(0),
                percentage_cut_from_buyer: managed_biguint!(200u64),
                percentage_cut_from_seller: managed_biguint!(200u64),
            };

            let sc_req = sc.view_requirements();

            assert_eq!(sc_req.accepted_tokens, req.accepted_tokens);
            assert_eq!(sc_req.accepted_payments, req.accepted_payments);
            assert_eq!(sc_req.maximum_payment_fees, req.maximum_payment_fees);
            assert_eq!(
                sc_req.discount_fee_percentage_buyer,
                req.discount_fee_percentage_buyer
            );
            assert_eq!(
                sc_req.discount_fee_percentage_seller,
                req.discount_fee_percentage_seller
            );
            assert_eq!(
                sc_req.percentage_cut_from_buyer,
                req.percentage_cut_from_buyer
            );
            assert_eq!(
                sc_req.percentage_cut_from_seller,
                req.percentage_cut_from_seller
            );
        })
        .assert_ok();
}

#[test]
fn change_offer_price_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;
    let first_user_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;

    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(second_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    2u64,
                    managed_biguint!(1u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(100u64),
                ),
                quantity: managed_biguint!(2u64),
            };

            let offer_from_storage = sc.offers().get(&0u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.change_offer_price(0u64, managed_biguint!(21_000)); // max 20_000 (10_000 per 1 data NFT-FT)
            },
        )
        .assert_user_error("Payment fee too high");

    b_wrapper
        .execute_tx(
            second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.change_offer_price(0u64, managed_biguint!(200u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(second_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    2u64,
                    managed_biguint!(1u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(200u64),
                ),
                quantity: managed_biguint!(2u64),
            };

            let offer_from_storage = sc.offers().get(&0u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            first_user_address,
            &setup.contract_wrapper,
            TOKEN_ID,
            0,
            &(&rust_biguint!(200)
                + ((&rust_biguint!(200) * rust_biguint!(200u64)) / rust_biguint!(10000u64))), // buys with the updated price
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();
}

#[test]
fn accept_free_offer_test() {
    let mut setup = setup_contract(data_market::contract_obj);
    let b_wrapper = &mut setup.blockchain_wrapper;
    let owner_address = &setup.owner_address;
    let treasury_address = &setup.treasury_address;
    let first_user_address = &setup.first_user_address;
    let second_user_address = &setup.second_user_address;

    // Test add_accepted_payment function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_payment(
                    managed_token_id_wrapped!(TOKEN_ID),
                    managed_biguint!(10_000),
                );
            },
        )
        .assert_ok();

    // Test add_accepted_token function
    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.add_accepted_token(managed_token_id!(SFT_TICKER));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_treasury_address(managed_address!(treasury_address));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_tx(
            &owner_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.set_is_paused(false);
            },
        )
        .assert_ok();

    b_wrapper
        .execute_esdt_transfer(
            second_user_address,
            &setup.contract_wrapper,
            SFT_TICKER,
            2,
            &rust_biguint!(2u64),
            |sc| {
                sc.add_offer(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0u64,
                    managed_biguint!(100),
                    OptionalValue::Some(managed_biguint!(2u64)),
                );
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(second_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    2u64,
                    managed_biguint!(1u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(100u64),
                ),
                quantity: managed_biguint!(2u64),
            };

            let offer_from_storage = sc.offers().get(&0u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.change_offer_price(0u64, managed_biguint!(21_000));
            },
        )
        .assert_user_error("Payment fee too high");

    b_wrapper
        .execute_tx(
            second_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.change_offer_price(0u64, managed_biguint!(0u64));
            },
        )
        .assert_ok();

    b_wrapper
        .execute_query(&setup.contract_wrapper, |sc| {
            let offer = Offer::<TxContextRef> {
                owner: managed_address!(second_user_address),
                offered_token: EsdtTokenPayment::new(
                    managed_token_id!(SFT_TICKER),
                    2u64,
                    managed_biguint!(1u64),
                ),
                wanted_token: EgldOrEsdtTokenPayment::new(
                    managed_token_id_wrapped!(TOKEN_ID),
                    0,
                    managed_biguint!(0u64),
                ),
                quantity: managed_biguint!(2u64),
            };

            let offer_from_storage = sc.offers().get(&0u64).unwrap();

            assert_eq!(offer_from_storage.owner, offer.owner);
            assert_eq!(offer_from_storage.offered_token, offer.offered_token);
            assert_eq!(offer_from_storage.wanted_token, offer.wanted_token);
            assert_eq!(offer_from_storage.quantity, offer.quantity);
        })
        .assert_ok();

    b_wrapper
        .execute_tx(
            first_user_address,
            &setup.contract_wrapper,
            &rust_biguint!(0u64),
            |sc| {
                sc.accept_offer(0u64, managed_biguint!(1u64));
            },
        )
        .assert_ok();

    let treasury_address_balance = b_wrapper.get_esdt_balance(treasury_address, TOKEN_ID, 0u64);
    assert_eq!(treasury_address_balance, rust_biguint!(0)); // no fee was paid

    let second_user_address_balance =
        b_wrapper.get_esdt_balance(second_user_address, TOKEN_ID, 0u64);
    assert_eq!(second_user_address_balance, rust_biguint!(10_000)); // 10_000 initial balance of the seller
}
