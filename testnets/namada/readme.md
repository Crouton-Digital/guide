![namadagithab](https://github.com/Crouton-Digital/guide/assets/113435724/cd4429ca-b48d-4d34-9642-af251bfc9f89)


## Namada Node Setup Guide

### ⚙️ Installation of Required Binaries:

<details>
  <summary>Install Namada</summary>
      
  - **Set the desired version**:
    ```bash
    NAMADA_TAG="v0.23.1"
    ```

  - **Download and extract**:
    ```bash
    curl -L -o namada.tar.gz "https://github.com/anoma/namada/releases/download/$NAMADA_TAG/namada-${NAMADA_TAG}-Linux-x86_64.tar.gz"
    tar -xvf namada.tar.gz
    ```

  - **Move to `/usr/local/bin`**:
    ```bash
    sudo mv namada-${NAMADA_TAG}-Linux-x86_64/* /usr/local/bin/
    ```

  - **Cleanup**:
    ```bash
    rm -rf namada-${NAMADA_TAG}-Linux-x86_64 namada.tar.gz
    ```

  - **Verify the installation**:
    ```bash
    namada --version
    ```

</details>

<details>
  <summary>Install Protocol Buffers</summary>
      
  - **Set the desired version**:
    ```bash
    PROTOBUF_TAG="v24.4"
    ```

  - **Download and extract to a specific folder**:
    ```bash
    curl -L -o protobuf.zip "https://github.com/protocolbuffers/protobuf/releases/download/$PROTOBUF_TAG/protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip"
    mkdir protobuf_temp && unzip protobuf.zip -d protobuf_temp/
    ```

  - **Move to `/usr/local/bin` and `/usr/local/include`**:
    ```bash
    sudo cp protobuf_temp/bin/protoc /usr/local/bin/
    sudo cp -r protobuf_temp/include/* /usr/local/include/
    ```

  - **Cleanup**:
    ```bash
    rm -rf protobuf_temp protobuf.zip
    ```

  - **Verify the installation**:
    ```bash
    protoc --version
    ```

</details>

<details>
  <summary>Install CometBFT</summary>
      
  - **Set the desired version**:
    ```bash
    COMETBFT_TAG="v0.37.2"
    ```

  - **Download and extract to a specific folder**:
    ```bash
    curl -L -o cometbft.tar.gz "https://github.com/cometbft/cometbft/releases/download/$COMETBFT_TAG/cometbft_${COMETBFT_TAG#v}_linux_amd64.tar.gz"
    mkdir cometbft_temp && tar -xvf cometbft.tar.gz -C cometbft_temp/
    ```

  - **Move to `/usr/local/bin`**:
    ```bash
    sudo mv cometbft_temp/cometbft /usr/local/bin/
    ```

  - **Cleanup**:
    ```bash
    rm -rf cometbft_temp cometbft.tar.gz
    ```

  - **Verify the installation**:
    ```bash
    cometbft version
    ```

</details>

### 🌟 Node Initialization:

### 🔧 Pre-Initialization Setup:

<details>
  <summary>Prepare for Initialization</summary>

  1. **Create the required directories**:

     - Create the directory for the pre-genesis backup:
       ```bash
       mkdir -p $HOME/.local/share/namada/pre-genesis/
       ```

  2. **Transfer your pre-genesis backup**:
     
     Transfer your backup (for example, `CroutonDigital`) to the server under `$HOME/.local/share/namada/pre-genesis/`.

     ```bash
     # Example for creating CroutonDigital directory
     mkdir $HOME/.local/share/namada/pre-genesis/CroutonDigital/
     ```

  3. **Set your alias**:

     Replace `YourAliasHere` with your actual alias (e.g., `CroutonDigital`):
     ```bash
     echo "export ALIAS=YourAliasHere" >> ~/.bashrc
     ```

  4. **Set the chain ID**:

     Replace `YourChainIDHere` with the actual chain ID (e.g., `public-testnet-14.5d79b6958580`):
     ```bash
     echo "export CHAIN_ID=YourChainIDHere" >> ~/.bashrc
     ```

     **Note:** Ensure you've set the correct chain ID. If in doubt, refer to the latest chain ID posted in the Discord channel.

  5. **Reload your bash profile** to make sure the environment variables are set:

     ```bash
     source ~/.bashrc
     ```

</details>

<details>
  <summary>Initialization for Pre-Genesis Validators</summary>

  **IMPORTANT:** Only follow these steps if you are a pre-genesis validator. If you are not a pre-genesis validator, please skip this section.

  1. **Setup the directory**:
     ```bash
     mkdir $HOME/.local/share/namada
     ```

  2. **Copy the pre-genesis data**:
     ```bash
     cp -r $HOME/namada_backup/pre-genesis* $HOME/.local/share/namada/
     ```

  3. **Join the network**:
     ```bash
     namada client utils join-network --chain-id $CHAIN_ID --genesis-validator $VALIDATOR_ALIAS
     ```

  4. **Restart the service and monitor logs**:
     ```bash
     sudo systemctl restart namadad && sudo journalctl -u namadad -f -o cat 
     ```

</details>



<details>
  <summary>Initialization for Full Nodes</summary>

  1. **Navigate to the home directory**:
     ```bash
     cd $HOME
     ```

  2. **Join the network**:
     ```bash
     namada client utils join-network --chain-id $CHAIN_ID
     ```

  3. **Start the service and monitor logs**:
     ```bash
     sudo systemctl start namadad && sudo journalctl -u namadad -f -o cat 
     ```

</details>

### 🔄 Service Creation for Node Startup:
<details>
  <summary>Service Creation</summary>

  - **Create the Systemd Service File**:
    ```bash
    sudo tee /etc/systemd/system/namadad.service > /dev/null <<EOF
    [Unit]
    Description=namada
    After=network-online.target
    [Service]
    User=$USER
    WorkingDirectory=$HOME/.local/share/namada
    Environment=TM_LOG_LEVEL=p2p:none,pex:error
    Environment=NAMADA_CMT_STDOUT=true
    ExecStart=/usr/local/bin/namada node ledger run 
    StandardOutput=syslog
    StandardError=syslog
    Restart=always
    RestartSec=10
    LimitNOFILE=65535
    [Install]
    WantedBy=multi-user.target
    EOF
    ```

  - **Reload the Systemd Configuration:**
    ```bash
    sudo systemctl daemon-reload
    ```

  - **Enable and Start the Service:**
    ```bash
    sudo systemctl enable namadad
    sudo systemctl restart namadad
    ```

  - **Monitor the Service Logs:**
    ```bash
    sudo journalctl -u namadad -f -o ca
    ```

</details>



