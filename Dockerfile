############# Build stage
FROM nvidia/cuda:12.1.0-base-ubuntu22.04 AS build

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

# Clone the Nimble Miner repository ( ovierride with docker build --build-arg REPO=... or in docker-compose.yml )
ARG REPO=https://github.com/nimble-technology/nimble-miner-public.git
RUN git clone $REPO nimble-miner

WORKDIR /usr/src/app/nimble-miner

# Install Nimble Miner
RUN make install

# Clean pip cache to reduce image size
RUN rm -rf /root/.cache/pip

# Copy the Nimble Miner script
COPY run_nimble_miner.sh .

# Make the script executable
RUN chmod +x run_nimble_miner.sh

############# Runtime stage
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

# Copy the Nimble Miner script
COPY run_nimble_miner.sh /usr/src/app/run_nimble_miner.sh

# Copy the required files from the build stage
COPY --from=build /usr/src/app/nimble-miner /usr/src/app/nimble-miner

# Set the working directory
WORKDIR /usr/src/app/nimble-miner

# Start the Nimble Miner script
ENTRYPOINT ["/usr/src/app/run_nimble_miner.sh"]