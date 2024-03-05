#!/bin/bash

cd simple-taiko-node

# Accepting inputs from command-line arguments
L1_ENDPOINT_HTTP=$1
L1_ENDPOINT_WS=$2
ENABLE_PROPOSER=$3
L1_PROPOSER_PRIVATE_KEY=$4
PROPOSE_BLOCK_TX_GAS_LIMIT=$5
BLOCK_PROPOSAL_FEE=$6

# Update the environment file
sed -i "s|^L1_ENDPOINT_HTTP=.*|L1_ENDPOINT_HTTP=$L1_ENDPOINT_HTTP|" .env.sample
sed -i "s|^L1_ENDPOINT_WS=.*|L1_ENDPOINT_WS=$L1_ENDPOINT_WS|" .env.sample
sed -i "s|^ENABLE_PROPOSER=.*|ENABLE_PROPOSER=$ENABLE_PROPOSER|" .env.sample
if [[ $ENABLE_PROPOSER == "true" ]]; then
    sed -i "s|^L1_PROPOSER_PRIVATE_KEY=.*|L1_PROPOSER_PRIVATE_KEY=$L1_PROPOSER_PRIVATE_KEY|" .env.sample
    sed -i "s|^PROPOSE_BLOCK_TX_GAS_LIMIT=.*|PROPOSE_BLOCK_TX_GAS_LIMIT=$PROPOSE_BLOCK_TX_GAS_LIMIT|" .env.sample
    sed -i "s|^BLOCK_PROPOSAL_FEE=.*|BLOCK_PROPOSAL_FEE=$BLOCK_PROPOSAL_FEE|" .env.sample
fi

# Copy .env.sample file to .env
cp .env.sample .env

echo "Environment file updated successfully."

# Starting the node
docker-compose up -d

echo "Node started running successfully"
