#!/bin/bash

# Set the working directory
WORKDIR=/usr/src/app

cd $WORKDIR

# Check if a custom repository URL is provided
if [ -n "$REPO" ]; then
    # Print the repository URL
    echo "Cloning repository: $REPO"

    rm -rf $WORKDIR/nimble-miner-public

    git clone $REPO $WORKDIR/nimble-miner-public

    cd $WORKDIR/nimble-miner-public

    make install

    if [ -f "./nimenv_localminers/bin/activate" ]; then
        source ./nimenv_localminers/bin/activate
    fi
else
    # If no custom repository is provided, use the default miner
    cd $WORKDIR/nimble-miner-public
	source ./nimenv_localminers/bin/activate
    echo "No custom repository provided. Using default miner."
	# Pull the latest changes from the repository
    git pull
fi

# Check if TMUX is set to true
if [ -z "$TMUX" ] || [ "$TMUX" != "false" ]; then
    # Start a new tmux session named "nimble" and run the miner inside it
    tmux new-session -d -s "nimble" "make run addr=${NIMBLE_WALLET_ADDRESS}"
    echo "Started Nimble Miner session. Use 'tmux attach-session -r -t nimble' to view the output."
else
    # Run the miner directly without tmux
    make run addr=${NIMBLE_WALLET_ADDRESS}
fi

tail -f /dev/null