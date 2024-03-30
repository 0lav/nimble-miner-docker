#!/bin/bash

set -e

WORKDIR=/usr/src/app
NIMBLE_MINER_DIR="$WORKDIR/nimble-miner"

cd "$NIMBLE_MINER_DIR"
git pull # Update the miner code if needed
source ./nimenv_localminers/bin/activate
make install # Install the miner dependencies if needed

# Start the miner session
if [ -z "$TMUX" ] || [ "$TMUX" != "false" ]; then
    tmux new-session -d -s "nimble" "make run addr=${NIMBLE_WALLET_ADDRESS}"
    echo "Started Nimble Miner session. Use 'tmux attach-session -r -t nimble' to view the output."
else
    make run addr="${NIMBLE_WALLET_ADDRESS}"
fi

tail -f /dev/null