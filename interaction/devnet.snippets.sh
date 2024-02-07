PROXY=https://devnet-gateway.multiversx.com
CHAIN_ID="D"

WALLET="./wallet.pem"
SELLER="./wallet.pem"
BUYER="./wallet2.pem"

ADDRESS=$(mxpy data load --key=address-devnet)
DEPLOY_TRANSACTION=$(mxpy data load --key=deployTransaction-devnet)

TOKEN="ITHEUM-fce905"
TOKEN_HEX="0x$(echo -n ${TOKEN} | xxd -p -u | tr -d '\n')"

# to deploy from last reprodubible build, we need to change 
# --bytecode output/data_market.wasm \
# to 
# --bytecode output-docker/data_market/data_market.wasm \
deploy(){
    mxpy --verbose contract deploy \
    --bytecode output/data_market.wasm \
    --outfile deployOutput \
    --metadata-not-readable \
    --metadata-payable-by-sc \
    --pem ${WALLET} \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --gas-limit 150000000 \
    --send \
    --recall-nonce \
    --outfile="./interaction/deploy-devnet.interaction.json" || return

    TRANSACTION=$(mxpy data parse --file="./interaction/deploy-devnet.interaction.json" --expression="data['emittedTransactionHash']")
    ADDRESS=$(mxpy data parse --file="./interaction/deploy-devnet.interaction.json" --expression="data['contractAddress']")

    mxpy data store --key=address-devnet --value=${ADDRESS}
    mxpy data store --key=deployTransaction-devnet --value=${TRANSACTION}
}

# if you interact without calling deploy(), then you need to 1st run this to restore the vars from data
restoreDeployData() {
  TRANSACTION=$(mxpy data parse --file="./interaction/deploy-devnet.interaction.json" --expression="data['emittedTransactionHash']")
  ADDRESS=$(mxpy data parse --file="./interaction/deploy-devnet.interaction.json" --expression="data['contractAddress']")

  # after we upgraded to mxpy 8.1.2, mxpy data parse seems to load the ADDRESS correctly but it breaks when used below with a weird "Bad address" error
  # so, we just hardcode the ADDRESS here. Just make sure you use the "data['contractAddress'] from the latest deploy-devnet.interaction.json file
  ADDRESS="erd1qqqqqqqqqqqqqpgqlhewm06p4c9qhq32p239hs45dvry948tfsxshx3e0l"
}

initializeContract(){
    # $1 = token identifier of the collection to be traded
    # $2 = token identifier of the accepted token payment
    # $3 = maximum payment fee per SFT
    # $4 = treasury address

    token_identifier_collection="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"
    token_identifier_payment="0x$(echo -n ${2} | xxd -p -u | tr -d '\n')"
    treasury_address="0x$(mxpy wallet bech32 --decode ${4})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=8000000 \
    --function "initializeContract" \
    --arguments $token_identifier_collection $token_identifier_payment $3 $treasury_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

pauseContract(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setIsPaused" \
    --arguments 1 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

unPauseContract(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setIsPaused" \
    --arguments 0 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

setTreasuryAddress(){
    # $1 = treasury address

    treasury_address="0x$(mxpy wallet bech32 --decode ${1})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setTreasuryAddress" \
    --arguments $treasury_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

setAdministrator(){
    # $1 = administrator address

    administrator_address="0x$(mxpy wallet bech32 --decode ${1})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setAdministrator" \
    --arguments $administrator_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

setDiscounts(){
    # $1 = seller discount
    # $2 = buyer discount

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setDiscounts" \
    --arguments ${1} ${2} \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

setFees(){
    # $1 = seller fee    
    # $2 = buyer fee

     mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setFees" \
    --arguments ${1} ${2} \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

addAcceptedToken(){
    # $1 = token identifier

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"


     mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "addAcceptedToken" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return

}

addAcceptedPayment(){
    # $1 = token identifier
    # $2 = maximum payment fee per SFT
 

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

      mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "addAcceptedPayment" \
    --arguments $token_identifier $2 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

removeAcceptedPayment(){
    # $1 = token identifier

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

      mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "removeAcceptedPayment" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}


setClaimsContract(){
    # $1 = claims contract address

    claims_address="0x$(mxpy wallet bech32 --decode ${1})"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setClaimsContract" \
    --arguments $claims_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return

}

setRoyaltiesClaimToken(){
    # $1 = token identifier

    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setRoyaltiesClaimToken" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return


}

setClaimIsEnabled(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setClaimIsEnabled" \
    --arguments 1 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

setClaimIsDisabled(){
    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setClaimIsEnabled" \
    --arguments 0 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}


addOffer(){
    # $1 = token identifier
    # $2 = sft nonce
    # $3 = amount of sft to send
    # $4 = payment token identifier
    # $5 = payment token nonce
    # $6 = payment token amount
    # $7 = quantity (optional)


    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"
    method="0x$(echo -n 'addOffer' | xxd -p -u | tr -d '\n')"
    payment_token_identifier="0x$(echo -n ${4} | xxd -p -u | tr -d '\n')"

  mxpy --verbose contract call $user_address \
    --recall-nonce \
    --pem=${SELLER} \
    --gas-limit=10000000 \
    --function "ESDTNFTTransfer" \
    --arguments $token_identifier $2 $3 ${ADDRESS} $method $payment_token_identifier $5 $6 $7 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

cancelOffer(){
    # $1 = offer id

    mxpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${SELLER} \
    --gas-limit=6000000 \
    --function "cancelOffer" \
    --arguments ${1} 1 00 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

acceptOffer(){
    # $1 = amount of esdt to send
    # $2 = offer id
    # $3 = quantity 

    method="0x$(echo -n 'acceptOffer' | xxd -p -u | tr -d '\n')"

    mxpy --verbose contract call $ADDRESS \
    --recall-nonce \
    --pem=${BUYER} \
    --gas-limit=10000000 \
    --function "ESDTTransfer" \
    --arguments ${TOKEN_HEX} $1 $method $2 $3 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}