# Nimble Miner

This project is to run Nimble AI Miner in Docker and uses the official repo.
https://github.com/nimble-technology/nimble-miner-public

This project also includes Tmux. Use "tmux attach-session -r -t nimble" through a terminal session to view mining progress.

## index
- [Run using Docker](#run-using-docker)
- [Run using RunPod GPU Cloud](#run-using-runpod-gpu-cloud)
- [Run using Docker Compose](#run-using-docker-compose)
- [Building the Pre-built Docker Image](#building-the-pre-built-docker-image)
- [Contributors](#contributors)


## Run using Docker

Execute this command to download and run Nimble Miner using your supplied wallet address. Replace "YOURWALLETADDRESS" with yours.

  ```sh
  docker run --gpus all -e NVIDIA_VISIBLE_DEVICES=all -e TMUX=false -e NIMBLE_WALLET_ADDRESS=YOURWALLETADDRESS 0lav/nimble-miner-prebuilt
  ```
  ### Optional Flags
  - Run without Tmux, for displaying mining activity in docker logs only.
    ```sh
    -e TMUX=false
    ```
  - Use a custom miner repository for custom miner configurations.
    ```sh
    -e REPO=https://github.com/your-username/custom-miner-repo
  - Specify GPU, for running on specific GPUs
    ```sh
    --gpus=0 -e CUDA_VISIBLE_DEVICES=0
    ```
## Run using RunPod GPU Cloud
**RunPod referral link [https://runpod.io?ref=qvfcm6u5](https://runpod.io?ref=qvfcm6u5 )**  
- Login to your account and create a new GPU Pod
- Select the GPU you want to use (RTX 4090 recommended) and click Deploy
- Click `Customize Deployment`
- Replace Container Image with this
  ```sh
  0lav/nimble-miner-prebuilt:latest
  ```

- Expand `Enviornment Variables` and enter your wallet address in a key and value format.
  ```dotenv
  # Required
    Key: NIMBLE_WALLET_ADDRESS
    Value: YOUR_WALLET_ADDRESS
    
  # Optional
    Key: TMUX
    Value: false  # Set to false to run without Tmux
    
  # Optional, provide a custom miner repository
    Key: REPO
    Value: https://github.com/your-username/custom-miner-repo
  ```
  
**RunPod referral link [https://runpod.io?ref=qvfcm6u5](https://runpod.io?ref=qvfcm6u5 )**  

## Run using Docker Compose

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
   If Nimble releases a new version of their miner you can update it by restarting your docker container. It will check for a new version. 


## Building the Pre-built Docker Image
To create a pre-built Docker image with all the dependencies installed and the Nimble Miner repository cloned and set up, you can use a multi-stage build approach.

* Open the `Dockerfile` and update the `ARG` instruction with the desired repository URL:
```sh
ARG REPO=https://github.com/your-username/custom-miner-repo
```
Replace https://github.com/your-username/custom-miner-repo with the URL of the repository you want to use.
* Build the pre-built Docker image:
```sh
docker build -t nimble-miner-prebuilt .
```
* Push the pre-built Docker image to a container registry (e.g., Docker Hub) for distribution:
```sh
docker tag nimble-miner-prebuilt your-dockerhub-username/nimble-miner-prebuilt
docker push your-dockerhub-username/nimble-miner-prebuilt
```
Replace your-dockerhub-username with your actual Docker Hub username.



## Contributors
```
- Olav (Discord @saintolav)
- Hani (Discord @xH)
```