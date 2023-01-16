PROXY=https://devnet-gateway.elrond.com
CHAIN_ID="D"

WALLET="./wallet.pem"
SELLER="./wallet2.pem"
BUYER="./wallet3.pem"

ADDRESS=$(erdpy data load --key=address-devnet)
DEPLOY_TRANSACTION=$(erdpy data load --key=deployTransaction-devnet)

TOKEN="ITHEUM-a61317"
TOKEN_HEX="0x$(echo -n ${TOKEN} | xxd -p -u | tr -d '\n')"

deploy(){
    erdpy --verbose contract deploy \
    --bytecode output/data_market.wasm \
    --outfile deployOutput \
    --metadata-not-readable \
    --pem ${WALLET} \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --gas-limit 150000000 \
    --send \
    --recall-nonce \
    --outfile="./interaction/deploy-devnet.interaction.json" || return

    TRANSACTION=$(erdpy data parse --file="./interaction/deploy-devnet.interaction.json" --expression="data['emittedTransactionHash']")
    ADDRESS=$(erdpy data parse --file="./interaction/deploy-devnet.interaction.json" --expression="data['contractAddress']")

    erdpy data store --key=address-devnet --value=${ADDRESS}
    erdpy data store --key=deployTransaction-devnet --value=${TRANSACTION}
}


initializeContract(){
    # $1 = token identifier of the collection to be traded
    # $2 = token identifier of the accetepted token payment
    # $3 = treasury address

    token_identifier_collection="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"
    token_identifier_payment="0x$(echo -n ${2} | xxd -p -u | tr -d '\n')"
    treasury_address="0x$(erdpy wallet bech32 --decode ${3})"

    erdpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "initializeContract" \
    --arguments $token_identifier_collection $token_identifier_payment $treasury_address \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

pauseContract(){
    erdpy --verbose contract call ${ADDRESS} \
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
    erdpy --verbose contract call ${ADDRESS} \
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

    treasury_address="0x$(erdpy wallet bech32 --decode ${1})"

    erdpy --verbose contract call ${ADDRESS} \
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

    administrator_address="0x$(erdpy wallet bech32 --decode ${1})"

    erdpy --verbose contract call ${ADDRESS} \
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

    erdpy --verbose contract call ${ADDRESS} \
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

     erdpy --verbose contract call ${ADDRESS} \
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


     erdpy --verbose contract call ${ADDRESS} \
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

    token_identifier=${TOKEN_HEX}

      erdpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "addAcceptedPayment" \
    --arguments $token_identifier \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}


setMaximumPaymentFee(){
    # $1 = maximum payment fee

    erdpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${WALLET} \
    --gas-limit=6000000 \
    --function "setMaximumPaymentFee" \
    --arguments ${1} \
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

    user_address="$(erdpy wallet pem-address $SELLER)"
    token_identifier="0x$(echo -n ${1} | xxd -p -u | tr -d '\n')"
    method="0x$(echo -n 'addOffer' | xxd -p -u | tr -d '\n')"
    payment_token_identifier="0x$(echo -n ${4} | xxd -p -u | tr -d '\n')"

erdpy --verbose contract call $user_address \
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

    erdpy --verbose contract call ${ADDRESS} \
    --recall-nonce \
    --pem=${SELLER} \
    --gas-limit=6000000 \
    --function "cancelOffer" \
    --arguments ${1} \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}

acceptOffer(){
    # $1 = amount of esdt to send
    # $2 = offer id
    # $3 = quantity 

    method="0x$(echo -n 'acceptOffer' | xxd -p -u | tr -d '\n')"

    erdpy --verbose contract call $ADDRESS \
    --recall-nonce \
    --pem=${BUYER} \
    --gas-limit=10000000 \
    --function "ESDTTransfer" \
    --arguments ${TOKEN_HEX} $1 $method $2 $3 \
    --proxy ${PROXY} \
    --chain ${CHAIN_ID} \
    --send || return
}