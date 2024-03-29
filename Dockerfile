FROM nvidia/cuda:12.1.0-base-ubuntu22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3.10-venv \
    git \
    make \
    tmux \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Clone the Nimble Miner repository
RUN git clone https://github.com/nimble-technology/nimble-miner-public.git

WORKDIR /usr/src/app/nimble-miner-public

# Install Nimble Miner
RUN make install

# Clean pip cache to reduce image size
RUN rm -rf /root/.cache/pip

# Copy the Nimble Miner script
COPY run_nimble_miner.sh .

# Make the script executable
RUN chmod +x run_nimble_miner.sh

# Start the Nimble Miner script
ENTRYPOINT ["./run_nimble_miner.sh"]
