# Itheum Core MultiversX - Marketplace Smart Contract

## Abstract

The marketplace smart contract is designed for reusability, but its primary function is to facilitate trading of data NFT-FTs among users.

## Introduction

This contract allows users to trade data NFT-FTs previously created by the data NFT-FT minter contract. The creator can list any data NFT-FT for sale, choosing the price, the supply and even to sell the same data NFT-FTs in batches. The offer can be canceled any time by the creator and the smart contract owner. The marketplace has a fee that is charged to the traders.

## Prerequisites

This documentation assumes the user has previous programming experience. Moreover, the user should have a basic understanding of the Elrond blockchain. If you are new to the blockchain, please refer to the [Elrond documentation](https://docs.elrond.com/). In order to develop Elrond smart contract related solutions, one needs to have installed [erdpy](https://docs.elrond.com/sdk-and-tools/erdpy/installing-erdpy/).

Understanding this document is also easier if one knows how [ESDT token transactions](https://docs.elrond.com/developers/esdt-tokens/#transfers-to-a-smart-contract) are structured on the Elrond blockchain and how [NFT tokens](https://docs.elrond.com/tokens/nft-tokens/) work on the Elrond Blockchain.

## Itheum deployed Data NFT-FT martketplace contract addresses

| Devnet           | Mainnet          |
| ---------------- | ---------------- |
| Not deployed yet | Not deployed yet |

## Endpoints

### Setup endpoints

The setup workflow for the smart contract is as follows:

- The SC deployment
- Setting up the parameters used in trades (Accepted payment token, Accepted trade token, fees, discounts, maximum price per offer )

#### init

```rust
    #[init]
    fn init(&self);
```

The init function is called when deploying or upgrading the smart contract. It receives no arguments and does the following: pauses the contract, sets the trading fee to 2% and sets the discount for sellers and buyers to 0%.

### Only owner endpoints

#### initializeContract

```rust
#[only_owner]
    #[endpoint(initializeContract)]
    fn initialize_contract(
        &self,
        accepted_token_id: TokenIdentifier,
        payment_token_id: EgldOrEsdtTokenIdentifier,
        maximum_payment_fee: BigUint,
        treasury_address: ManagedAddress,
    );
```

Endpoint that initializes the contract with the token ids accepted for trading and payments and sets the treasury address. It can only be called by the contract owner. It can only be called once.

Call structure: "initializeContract" + "@" + accepted_token_id hex encoded + "@" + payment_token_id hex encoded + "@" + treasury_address hex encoded

Example: initializeContract@444154414e46542d613631333137@2049544845554d2d613631333137@30bf219fe20c3918f1d32e98c37b9eab14a2a5bb4bf0871fdb1186683e0d4832

#### setTreasuryAddress

```rust
 fn set_treasury_address(&self,
  address: ManagedAddress
 );
```

Endpoint that sets the treasury address. The treasury address is the address that will receive buyer/seller fee when a trade completes.

Call structure: "setTreasuryAddress" + "@" + address hex encoded.

Example: "setTreasuryAddress@afb9aa109340a83cdb2129635b060a3a2d67ba2659ad86bf6ef49f948c43572c"

#### setAdministrator

```rust
    #[endpoint(setAdministrator)]
    fn set_administrator(
        &self,
        administrator: ManagedAddress
    );
```

Endpoint that sets the administrator of the contract. The administrator has some privileges that will be presented in the [Owner and administrator endpoints](#owner-and-administrator-endpoints) section.

Call structure: "setAdministrator" + "@" + administrator hex encoded.

Example: "setAdministrator@afb9aa109340a83cdb2129635b060a3a2d67ba2659ad86bf6ef49f948c43572c"

#### setClaimsContract

```rust
    #[endpoint(setClaimsContract)]
    fn set_claims_contract(&self,
        claims_contract: ManagedAddress
    );
```

Endpoint that sets the claims contract address. The claims contract is used to let the user claim their royalties.

Call structure: "setClaimsContract" + "@" + claims_contract hex encoded.

Example: "setClaimsContract@afb9aa109340a83cdb2129635b060a3a2d67ba2659ad86bf6ef49f948c43572c"

#### setRoyaltiesClaimToken

```rust
    #[endpoint(setRoyaltiesClaimToken)]
    fn set_royalties_claims_token(&self,
        royalties_claims_token: TokenIdentifier
    );
```

Endpoint that sets the royalties claim token. When trading with this token the royalties are sent to the claims contract address for royalties to be claimed.

Call structure: "setRoyaltiesClaimToken" + "@" + royalties_claims_token hex encoded.

Example: "setRoyaltiesClaimToken@444154414e46542d613631333137"

#### setClaimIsEnabled

```rust
    #[endpoint(setClaimIsEnabled)]
    fn set_claim_is_enabled(&self,
        is_enabled: bool
    );
```

Endpoint that enables or disables the royalties to be claimed. When disabled the royalties are sent directly to the creator.

### Owner and administrator endpoints

#### setDiscounts

```rust
#[endpoint(setDiscounts)]
    fn set_discounts(
        &self,
        seller_discount: BigUint,
        buyer_discount: BigUint
    );
```

Endpoint that sets the discounts for sellers and buyers. This discounts are applied to the trading fee.

Call structure: "setDiscounts" + "@" + seller_discount hex encoded + "@" + buyer_discount hex encoded.

Example: "setDiscounts@32@32"

#### setFees

```rust
#[endpoint(setFees)]
    fn set_fees(&self,
    seller_fee: BigUint,
    buyer_fee: BigUint
    );
```

Endpoint that sets the fees for sellers and buyers. This fees are applied to the price of the offer. The fees are collected in the treasury address.

Call structure: "setFees" + "@" + seller_fee hex encoded + "@" + buyer_fee hex encoded.

Example: "setFees@32@32"

#### addAcceptedToken

```rust
#[endpoint(addAcceptedToken)]
    fn add_accepted_token(&self,
    token_id: TokenIdentifier
    );
```

Endpoint that adds the token id to the list of accepted tokens for trading. The token_id is an ESDT token id. Primary use case is to add the Data NFT-FT token id. The sellers will be able to offer only the accepted tokens for trade. Same for the buyers.

Call structure: "addAcceptedToken" + "@" + token_id hex encoded.

Example: "addAcceptedToken@444154414e46542d613631333137"

#### AddAcceptedPayment

```rust
#[endpoint(addAcceptedPayment)]
    fn add_accepted_payment(&self,
    token_id: EgldOrEsdtTokenIdentifier,
    maximum_fee: BigUint,
    );
```

Endpoint that adds the token id to the list of accepted tokens for payments.It also adds in pair the maximum value for a data NFT-FT sale. The token id can be an ESDT token id or the EGLD token id. The sellers will be able to set and receive payments in the accepted payment tokens. Same for the buyers.

Call structure: "addAcceptedPayment" + "@" + token_id hex encoded.

Example: "addAcceptedPayment@2049544845554d2d613631333137"

#### setIsPaused

```rust
    #[endpoint(setIsPaused)]
    fn set_is_paused(
        &self,
        is_paused: bool
    );
```

Endpoint that sets the value of the pause variable. This variable is used to determined whether the marketplace is paused (i.e. does not allow offers to be placed or redeemed)

Call structure: "setIsPaused" + "@" + is_paused hex encoded.

Example: "setIsPaused@00"

### Public endpoints

#### addOffer

```rust
#[payable("*")]
    #[endpoint(addOffer)]
    fn add_offer(
        &self,
        payment_token_id: EgldOrEsdtTokenIdentifier,
        payment_token_nonce: u64,
        payment_token_fee: BigUint,
        opt_quantity: OptionalValue<BigUint>,
    );
```

Endpoint that lets seller create their offers. The seller can set the payment token id but it requires to be in the list of accepted payment tokens. The payment token fee must not exceed the maximum payment fee. The seller can set the quantity of the offer and there are 3 cases:

- The quantity is not set (The optional value is not passed as an argument): In this case the seller will be able to sell all the tokens that he sends to the endpoint to the selected price.
- The quantity is set equal to the amount of tokens sent to the endpoint: In this case the seller will sell 1 token at a time with the selected price.
- The quantity is set to a value less than the amount of tokens sent to the endpoint: In this case the seller will sell batches of tokens at a time with the selected price.
  > quantity = 2 and offered_token_amount = 5; it means that the seller offers 2 batches of 5 tokens each for the selected price.

Call structure: "ESDTNFTTransfer" + "@" + accepted_token_id hex encoded + "@" + accepted_token_nonce hex encoded + "@" + accepted_token_quantity hex encoded + "@" + receiver_address hex encoded + "@" + "addOffer" hex encoded + "@" + payment_token_id hex encoded + "@" + payment_token_nonce hex encoded + "@" + payment_token_fee hex encoded + "@" + opt_quantity hex encoded.

Example: "ESDTNFTTransfer@444154414e46542d613631333137@01@0a@30bf219fe20c3918f1d32e98c37b9eab14a2a5bb4bf0871fdb1186683e0d4832@6164644f66666572@2049544845554d2d613631333137@00@01a055690d9db80000" - opt_quantity is not set

Example: "ESDTNFTTransfer@444154414e46542d613631333137@01@0a@30bf219fe20c3918f1d32e98c37b9eab14a2a5bb4bf0871fdb1186683e0d4832@6164644f66666572@2049544845554d2d613631333137@00@01a055690d9db80000@01" - opt_quantity is set

#### changePrice

```rust
#[endpoint(changeOfferPrice)]
    fn change_offer_price(&self,
     offer_id: u64,
     new_fee: BigUint
     )
```

Endpoint that lets the seller change the price of their offers. The seller can change only their offers. It takes the offer_id and the new price.

Call structure: "changeOfferPrice" + "@" + offer_id hex encoded + "@" + new_fee hex encoded.

Example: "changeOfferPrice@00@91b77e5e5d9a0000"

#### cancelOffer

```rust
#[endpoint(cancelOffer)]
    fn cancel_offer(&self,
    offer_id: u64,
    quantity: BigUint,
    );
```

Endpoint that lets the seller cancel their offers. The seller can cancel only their offers. The owner and administrator can cancel any offer. It takes the offer_id and the quantity that needs to be cancelled. The quantity is the same as in the addOffer endpoint.

Call structure: "cancelOffer" + "@" + offer_id hex encoded + "@" + quantity hex encoded.

Example: "cancelOffer@00@02"

#### acceptOffer

```rust
#[payable("*")]
    #[endpoint(acceptOffer)]
    fn accept_offer(&self,
    offer_id: u64,
    quantity: BigUint
    );
```

Endpoint that will allow the buyer to accept the offer. The buyer needs to send the payment token id and the payment token fee and also to take into consideration the marketplace fee that needs to be sent along with the token price. The endpoint takes two arguments the offer_id and the quantity. What to keep in mind about the quantity here is the fact that in the offer the seller can sell batches of the same token or one token at a time.

Call structure: "ESDTTransfer" + "@" + payment_token_id hex encoded + "@" + payment_token_nonce hex encoded + "@" + (payment_token_fee hex encoded + marketplace fee hex encoded ) + "@" + "acceptOffer" hex encoded + "@" + offer_id hex encoded + "@" + quantity hex encoded.

Example: "ESDTTransfer@2049544845554d2d613631333137@00@01a8a909dfcef40000@6163636570744f66666572@00@01"

### Views

#### viewOffer

```rust
 #[view(viewOffer)]
    fn view_offer(&self,
    offer_id: u64
    ) -> Option<OfferOut<Self::Api>>
```

Endpoint that returns the offer details. It takes the offer_id as an argument.

The structure contains the following fields:

- **offer_id**: the offer id of the offer
- **owner**: the address of the owner(seller) of the offer
- **offered_token_identifier**: the token id of the offered token
- **offered_token_nonce**: the token nonce of the offered token
- **offered_token_amount**: the amount of the offered token
- **wanted_token_identifier**: the token id of the wanted(payment) token
- **wanted_token_nonce**: the token nonce of the wanted(payment) token
- **wanted_token_amount**: the amount(price) of the wanted(payment) token
- **quantity**: the quantity represents the remaining supply of the offered token that can be sold

Call structure: "viewOffer" + "@" + offer_id hex encoded.

Example: "viewOffer@00"

## Development

This smart contract aims to offer the Elrond community an audited NFT marketplace smart contract that is easy to use, well documented and secure.

### Setting up dev environment (project development bootstrap) + how to build

- Uses `multiversx-sc-* 0.39.5` SDK libs (see Cargo.toml)
- Building requires minimum **mxpy 6.1.1** (newer version should also work but devs used 6.1.1). Check version using `mxpy --version`
- To build the project, requires minimum Rust version `1.69.0-nightly`. Check your Rust version by running `rustc --version`. To update your Rust, run `rustup update`. To set to nightly run `rustup default nightly` (devs used 1.69.0-nightly)
- After you make sure you have the minimum Rust version you can then begin development. After you clone repo and before you run build, deploy or run the tests - follow these steps

```
rustup default nightly
mxpy deps install rust --overwrite
cargo clean
cargo build
```

- The above should all work without any errors, next you can successfully run the following command to build via mxpy: `mxpy contract build`
- mxpy may ask you to install `nodejs` and `wasm-opt` to optimize the build, if so then follow instructions given by mxpy and do this
- You can now run the tests. See "How to test" section below
- You can now update code as needed

### Architecture

The Smart Contract is structured in 6 files:

- events: This file has all the defined events of the smart contract. They are emitted whenever something relevant happens in the smart contract. Their role is to make debugging and logging easier and to allow data collecting based on the smart contract.
- storage: This file has all the storage/memory declaration of the smart contract. This is the main file that allows the smart contract to save data in the blockchain.
- views: This file contains all the read-only endpoints of the smart contract. These endpoints are used to retrieve relevant data from the smart contract.
- requirements: This file contains requirements for the endpoints of the smart contract. In order to avoid code duplication, encourage a healthy project structure and increase code readability we have decided to separate most of the requirements that would otherwise have been duplicated from the endpoints and put them here.
- offer_accept_utils: utils to accept an offer
- offer_adding_utils: utils to add an offer
- lib: This is the main file of the smart contract, where all the logic of the smart contract is implemented. This connects all the other files (modules) and uses them to implement what is the contract itself.

### How to test

Prior to running the below, make sure you check section called **Setting up dev environment (project development bootstrap)** above and your dev environment is configured correctly. You also need to run `mxpy contract build` (requires you to be online with internet connection) prior to running tests.

The tests are located in the tests folder, in the rust_tests file. In order to run the tests one can use the command:

```shell
    cargo test --package data_market --test rust_tests --  --nocapture
```

Another way of running the tests is by using the rust-analyzer extension in Visual Studio Code, which is also very helpful for Elrond Smart Contract development. If one has the extension installed, they can go open and go to the top of the rust_tests file and click the Run Tests button.

Note: In order to run the tests, one has to use the rust nightly version. One can switch to the nightly version by using:

```shell
    rustup default nightly
```

### How to deploy

In order to deploy the smart contract on devnet one can use the interaction snippets present in the devnet. snippets file (which is located in the interactions folder). Before using the snippets, make sure to add your pem file in the root of the project under the name "wallet.pem" (or change the name to whichever one you wish to use in the interaction snippets). If you need info about how to derive a pem file you can find them [here](https://docs.elrond.com/sdk-and-tools/erdpy/deriving-the-wallet-pem-file/). To run the functions from the interaction file, one can use:

```shell
    source interaction/devnet.snippets.sh
```

After using that, to deploy one can simply use:

```shell
    deploy
```

### How to interact

After deployment, one can interact with the smart contract and test its functionality. To do so, one can use the interaction snippets already presented above. More explanations can be found about the snippets inside the devnet.snippets file.

### Mainnet Deployment (via Reproducible Builds)
- After the security audit has passed the Mainnet deployment need to be verified to match the version that was audited. This guarantee is given via [Reproducible Builds](https://docs.multiversx.com/developers/reproducible-contract-builds/#how-to-run-a-reproducible-build-using-mxpy)

**Step 1 (Final build + Code Hash):**
- Be in the latest `main` branch. On the commit that was audited. Update the cargo.toml files with the correct version. This should match the version we use in our requirements files (i.e Notion). e.g. 1.0.0. you need to update the `cargo.toml` files in the root folder, wasm folder and meta folder.

- In the `cargo.toml` files make sure you set the correct `edition`. i.e. edition = "2021"

- As the `cargo.toml` files has been updated. Build locally as normal. i.e. see "how to build" above and also run tests as per "how to test". This will reflect the `cargo.toml` update in the linked cargo.lock files and produces the final local meta build files to keep the final github check-in and version tagging perfect.


**Step 2 (Final build + Code Hash):**
Once the main commit is locked in, we can then produce the code hash and build to deploy to devnet 1st (for final testing) and then to mainnet (after sending the code hash to the auditor)

1. Make sure your mxpy version is >= 6.
2. If Cargo.lock is in gitignore, remove it, build the contract and make a new commit. Otherwise this step can be skipped. (see Step 1 and repeat if needed)
3. Run the following in the root of the repository (run the latest Docker client in your computer. Used `Docker Desktop 4.18.0 (104112) on MacOX 12.6`):

`mxpy contract reproducible-build --docker-image="multiversx/sdk-rust-contract-builder:v4.1.4"`

Note that if you already have a output-docker from a previous build and deploy then delete this folder.

This process may take some time. After it's done you should see "Docker build ran successfully!". An output-docker folder will be created containing the WASM files built in a reproducible way and artifacts.json containing the code hash of the WASM files.

You can then share the auditor the code hash. The auditor will follow the same steps and compare the code hash with yours. If they match, we will be good to go!

Note that "output-docker" folder should not be check-into GIT. 

**Step 4 (Send Code Hash to auditor to verify against devnet and give us all final clear):**
We should have got this final clear in Step 2, but we still do a final check here.

**Step 5 (Deploy to Devnet as final build for testing + Move ABI to all apps that need it):**

**Step 6 (Tag the commit in the main branch of Github with the version that was deployed. e.g. 1.0.0):**

**Step 6 (Deploy SC to Mainnet):**

## Contributing

Feel free the contact the development team if you wish to contribute or if you have any questions. If you find any issues, please report them in the Issues sections of the repository. You can also create your own pull requests which will be analyzed by the team.
