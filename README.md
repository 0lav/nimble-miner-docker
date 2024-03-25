# Nimble Miner

This project is a GPU miner powered by Nimble Technology. It allows you to mine cryptocurrency efficiently using your GPU.

## Installation

1. Clone the repository using Git:

   ```sh
   git clone https://github.com/nimble-technology/nimble-miner-public.git
   cd nimble-miner-public

### Setting Environment Variables and Running Miner

1. **Option 1: Use `.env` File**
   - Make a copy of the `.env.example` file in the root of the project.
   - Rename the copied file to `.env`.
   - Open the `.env` file in a text editor and enter your Nimble wallet address.
   - Run the following command to start the miner using Docker Compose:
     ```sh
     docker-compose up
     
2. **Option 2: Use System Variables**
   - Set the necessary environment variables directly in your system or hosting provider.
   - Run the following command to start the miner using Docker Compose:
     ```sh
     docker-compose up

    #### Environment Variables 
    ## Linux
    ```sh
    export NIMBLE_WALLET_ADDRESS=your_wallet_address
    export GPU=<gpu_index>
    ```
    ## Windows (PowerShell)
    ```powershell
    $env:NIMBLE_WALLET_ADDRESS="your_wallet_address"
    $env:GPU="<gpu_index>"
    ```
    ## Windows (Command Prompt)
    ```batch
    set NIMBLE_WALLET_ADDRESS=your_wallet_address
    set GPU=<gpu_index>
    ```
    ## macOS
    ```sh
    export NIMBLE_WALLET_ADDRESS=your_wallet_address
    export GPU=<gpu_index>
    ```



