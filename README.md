# Nimble Miner

This project is to run Nimble Miner in docker-compose. 
https://github.com/nimble-technology/nimble-miner-public

## To-Do (Not Implemented Yet)
- [ ] Multi-GPU support
- [ ] Performance optimizations

## Installation

1. Clone the repository using Git:

   ```sh
   git clone https://github.com/0lav/nimble-miner-docker.git
   cd nimble-miner-docker

### Setting Environment Variables and Running Miner

1. **Option 1: Use `.env` File**
   - Make a copy of the `.env.example` file in the root of the project.
   - Rename the copied file to `.env`.
   - Open the `.env` file in a text editor and enter your Nimble wallet address.
   - Run the following command to start the miner using Docker Compose:
     ```sh
     docker-compose up -d
     
2. **Option 2: Use System Variables**
   - Set the necessary environment variables directly in your system or hosting provider.
   - Run the following command to start the miner using Docker Compose:
     ```sh
     docker-compose up -d

    #### Environment Variables 
    ## Linux
    ```sh
    export NIMBLE_WALLET_ADDRESS=your_wallet_address
    ```
    ## Windows (PowerShell)
    ```powershell
    $env:NIMBLE_WALLET_ADDRESS="your_wallet_address"
    ```
    ## Windows (Command Prompt)
    ```batch
    set NIMBLE_WALLET_ADDRESS=your_wallet_address
    ```
    ## macOS
    ```sh
    export NIMBLE_WALLET_ADDRESS=your_wallet_address
    ```
## Updating Nimble Miner
   If Nimble releases a new version of their miner you can update it and re-launch by running
   ```sh
   docker-compose down
   docker-compose build --no-cache && docker-compose up -d
```
## Contributors
- Olav (Discord @saintolav)
- Hani (Discord @xH)
