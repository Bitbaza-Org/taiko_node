#!/bin/bash

cd simple-taiko-node

# Prompt user for input
read -p "Enter L1 HTTP endpoint: " L1_ENDPOINT_HTTP
read -p "Enter L1 WS endpoint: " L1_ENDPOINT_WS
read -p "Enable proposer (true/false): " ENABLE_PROPOSER
if [[ $ENABLE_PROPOSER == "true" ]]; then
    read -p "Enter L1 proposer private key: " L1_PROPOSER_PRIVATE_KEY
    read -p "Enter propose block gas limit: " PROPOSE_BLOCK_TX_GAS_LIMIT
    read -p "Enter block proposal fee: " BLOCK_PROPOSAL_FEE
fi

# Update the environment file
sed -i "s|^L1_ENDPOINT_HTTP=.*|L1_ENDPOINT_HTTP=$L1_ENDPOINT_HTTP|" .env.sample
sed -i "s|^L1_ENDPOINT_WS=.*|L1_ENDPOINT_WS=$L1_ENDPOINT_WS|" .env.sample
sed -i "s|^ENABLE_PROPOSER=.*|ENABLE_PROPOSER=$ENABLE_PROPOSER|" .env.sample
if [[ $ENABLE_PROPOSER == "true" ]]; then
    sed -i "s|^L1_PROPOSER_PRIVATE_KEY=.*|L1_PROPOSER_PRIVATE_KEY=$L1_PROPOSER_PRIVATE_KEY|" .env.sample
    sed -i "s|^PROPOSE_BLOCK_TX_GAS_LIMIT=.*|PROPOSE_BLOCK_TX_GAS_LIMIT=$PROPOSE_BLOCK_TX_GAS_LIMIT|" .env.sample
    sed -i "s|^BLOCK_PROPOSAL_FEE=.*|BLOCK_PROPOSAL_FEE=$BLOCK_PROPOSAL_FEE|" .env.sample
fi

#Copy .env.sample file to .env

cp .env.sample .env

echo "Environment file updated successfully."

# Starting the node

docker-compose up -d

echo "Node started running successfully"
