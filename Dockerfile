FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3.10-venv \
    git \
    tmux  # Install tmux

WORKDIR /usr/src/app

# Clone the Nimble Miner repository
RUN git clone https://github.com/nimble-technology/nimble-miner-public.git

WORKDIR /usr/src/app/nimble-miner-public

RUN make install

# Copy the Nimble Miner script
COPY run_nimble_miner.sh /usr/src/app/run_nimble_miner.sh
RUN chmod +x /usr/src/app/run_nimble_miner.sh

# Start a tmux session and run the Nimble Miner script within it
ENTRYPOINT ["/usr/src/app/run_nimble_miner.sh"]

