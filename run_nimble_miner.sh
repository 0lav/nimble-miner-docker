#!/bin/bash
source ./nimenv_localminers/bin/activate

git pull

# Run the Nimble Miner with the provided wallet address
make run addr=${NIMBLE_WALLET_ADDRESS}