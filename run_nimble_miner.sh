#!/bin/bash

set -e

WORKDIR=/usr/src/app
NIMBLE_MINER_DIR="$WORKDIR/nimble-miner-public"

cd "$WORKDIR"

# Check if a custom repository URL is provided
if [ -n "$REPO" ]; then
    echo "Cloning repository: $REPO"
    rm -rf "$NIMBLE_MINER_DIR"
    git clone "$REPO" "$NIMBLE_MINER_DIR"
    cd "$NIMBLE_MINER_DIR"
    make install
    rm -rf /root/.cache/pip
    source ./nimenv_localminers/bin/activate
else
    cd "$NIMBLE_MINER_DIR"
    source ./nimenv_localminers/bin/activate
    echo "No custom repository provided. Using default miner."
    git pull
fi

# Start the miner session
if [ -z "$TMUX" ] || [ "$TMUX" != "false" ]; then
    tmux new-session -d -s "nimble" "make run addr=${NIMBLE_WALLET_ADDRESS}"
    echo "Started Nimble Miner session. Use 'tmux attach-session -r -t nimble' to view the output."
else
    make run addr="${NIMBLE_WALLET_ADDRESS}"
fi

tail -f /dev/null
