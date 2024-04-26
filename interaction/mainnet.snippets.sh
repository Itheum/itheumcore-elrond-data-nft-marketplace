PROXY=https://gateway.multiversx.com
CHAIN_ID="1"

ADDRESS=$(mxpy data load --key=address-mainnet)

TOKEN="ITHEUM-df6f26"
TOKEN_HEX="0x$(echo -n ${TOKEN} | xxd -p -u | tr -d '\n')"

# to deploy from last reprodubible build, we need to change 
# --bytecode output/data_market.wasm \
# to 
# --bytecode output-docker/data_market/data_market.wasm \
deployLedgerMainnet(){
    mxpy --verbose contract deploy \
    --bytecode output-docker/data_market/data_market.wasm \
    --outfile deployOutputMainnet \
    --metadata-not-readable \
    --metadata-payable-by-sc \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --gas-limit 150000000 \
    --send \
    --recall-nonce \
    --ledger \
    --ledger-address-index 0 \
    --outfile="./interaction/deploy-mainnet.interaction.json" || return

    TRANSACTION=$(mxpy data parse --file="./interaction/deploy-mainnet.interaction.json" --expression="data['emittedTransactionHash']")
    ADDRESS=$(mxpy data parse --file="./interaction/deploy-mainnet.interaction.json" --expression="data['contractAddress']")

    mxpy data store --key=address-mainnet --value=${ADDRESS}
    mxpy data store --key=deployTransaction-mainnet --value=${TRANSACTION}
}

# any change to code or property requires a full upgrade 
# always check if you are deploy via a reprodubible build and that the code hash is the same before and after upgrade (that is if you are only changing props and not code.. for code, the RB will be different)
# if only changing props, you can't just "append" new props. you have to add the old ones again and then add a new prop you need. i.e. it's not append, it's a whole reset
# for upgrade, --outfile deployOutput is not needed
# in below code example we added --metadata-payable to add PAYABLE to the prop of the SC and removed --metadata-not-readable to make it READABLE
upgrade(){
    mxpy --verbose contract upgrade ${ADDRESS} \
    --bytecode output-docker/data_market/data_market.wasm \
    --metadata-not-readable \
    --metadata-payable-by-sc \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --gas-limit 150000000 \
    --recall-nonce \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

# if you interact without calling deploy(), then you need to 1st run this to restore the vars from data
restoreDeployDataMainnet() {
  TRANSACTION=$(mxpy data parse --file="./interaction/deploy-mainnet.interaction.json" --expression="data['emittedTransactionHash']")
  ADDRESS=$(mxpy data parse --file="./interaction/deploy-mainnet.interaction.json" --expression="data['contractAddress']")

  # after we upgraded to mxpy 8.1.2, mxpy data parse seems to load the ADDRESS correctly but it breaks when used below with a weird "Bad address" error
  # so, we just hardcode the ADDRESS here. Just make sure you use the "data['contractAddress'] from the latest deploy-devnet.interaction.json file
  ADDRESS="erd1qqqqqqqqqqqqqpgqay2r64l9nhhvmaqw4qanywfd0954w2m3c77qm7drxc"
}

initializeContractMainnet(){
    # $1 = token identifier of the collection to be traded
    # $2 = token identifier of the accepted token payment
    # $3 = maximum payment fee per SFT
    # $4 = treasury address

    token_identifier_collection="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"
    token_identifier_payment="0x$(echo -n ${2} | xxd -p -u | tr -d '\n')"
    treasury_address="0x$(mxpy wallet bech32 --decode ${4})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=8000000 \
    --function "initializeContract" \
    --arguments $token_identifier_collection $token_identifier_payment $3 $treasury_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

pauseContractMainnet(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setIsPaused" \
    --arguments 1 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

unPauseContractMainnet(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setIsPaused" \
    --arguments 0 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setTreasuryAddressMainnet(){
    # $1 = treasury address

    treasury_address="0x$(mxpy wallet bech32 --decode ${1})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setTreasuryAddress" \
    --arguments $treasury_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setAdministratorMainnet(){
    # $1 = administrator address

    administrator_address="0x$(mxpy wallet bech32 --decode ${1})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setAdministrator" \
    --arguments $administrator_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setDiscountsMainnet(){
    # $1 = seller discount
    # $2 = buyer discount

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setDiscounts" \
    --arguments ${1} ${2} \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setFeesMainnet(){
    # $1 = seller fee    
    # $2 = buyer fee

     mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setFees" \
    --arguments ${1} ${2} \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

addAcceptedTokenMainnet(){
    # $1 = token identifier

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

     mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "addAcceptedToken" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

removeAcceptedTokenMainnet(){
    # $1 = token identifier

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

     mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "removeAcceptedToken" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

addAcceptedPaymentMainnet(){
    # $1 =token identifier  
    # $2 = maximum payment fee per SFT
 
    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

      mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "addAcceptedPayment" \
    --arguments $token_identifier $2 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

removeAcceptedPayment(){
    # $1 = token identifier

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

      mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "removeAcceptedPayment" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setClaimsContractMainnet(){
    # $1 = claims contract address

    claims_address="0x$(mxpy wallet bech32 --decode ${1})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setClaimsContract" \
    --arguments $claims_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setRoyaltiesClaimTokenMainnet(){
    # $1 = token identifier

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setRoyaltiesClaimToken" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setClaimIsEnabledMainnet(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setClaimIsEnabled" \
    --arguments 1 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}

setClaimIsDisabledMainnet(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --gas-limit=6000000 \
    --function "setClaimIsEnabled" \
    --arguments 0 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --ledger \
    --ledger-address-index 0 \
    --send || return
}
