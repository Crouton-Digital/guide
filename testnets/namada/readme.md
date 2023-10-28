![namadagithab](https://github.com/Crouton-Digital/guide/assets/113435724/cd4429ca-b48d-4d34-9642-af251bfc9f89)

### ⚙️ Installation of Required Binaries:
**Description:** *This section provides instructions on how to install the necessary software components to run and manage a Namada node.*

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
**Description:** *Here, you'll find steps on how to set up and initialize your node, whether you're a pre-genesis validator or aiming to run a full node.*


<details>
  <summary>Preparation</summary>

  - **Create the required directories**:
    ```bash
    mkdir -p $HOME/.local/share/namada/pre-genesis/
    ```

    If you have a pre-genesis file, place it inside the directory. For instance, if your alias is `CroutonDigital`, the file should be located at `$HOME/.local/share/namada/pre-genesis/CroutonDigital/`.

  - **Set the chain ID**:
    ```bash
    CHAIN_ID=public-testnet-14.5d79b6958580
    echo "export CHAIN_ID=$CHAIN_ID" >> ~/.bashrc
    ```

    **Guidance:** 
    - If you possess a pre-genesis file, proceed to the "Initialization for Pre-Genesis Validators" section. 
    - If you don't have a pre-genesis file but aim to be a validator post-genesis or run a full node, proceed to "Initialization for Full Nodes & Post-Genesis Validators".

</details>

<details>
  <summary>For Pre-Genesis Validators</summary>

  - **Set your validator alias**:
    ```bash
    ALIAS=$(basename $(ls -d $HOME/.local/share/namada/pre-genesis/*/) | head -n 1)
    echo "export ALIAS=$ALIAS" >> ~/.bashrc
    ```

  - **Join the network as a validator**:
    ```bash
    namada client utils join-network --chain-id $CHAIN_ID --genesis-validator $ALIAS
    ```

</details>

<details>
  <summary>For Full Nodes & Intending Post-Genesis Validators</summary>

  - **Join the network**:
    ```bash
    namada client utils join-network --chain-id $CHAIN_ID
    ```

</details>

### 🔄 Service Creation for Node Startup:
**Description:** *This section covers how to configure your node to run as a service, ensuring it starts correctly upon boot or after any potential crashes.*

<details>
  <summary>Service Creation and Monitoring</summary>

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
    sudo journalctl -u namadad -f -o cat
    ```

</details>

### 🌐 Additional Steps for Post-Genesis Validators:
**Description:** *If you intend to become a validator after the network genesis, this section provides the additional steps required.*

<details>
  <summary>Setup for Post-Genesis Validators</summary>

  - **Check for full synchronization**:
    Before proceeding, ensure that your node is fully synchronized. You can check the synchronization status with:
    ```bash
    curl -s localhost:26657/status | grep "catching_up"
    ```
    Wait until you see `"catching_up": false` before proceeding to the next steps.

  - **Set Validator Alias**:
    ```bash
    ALIAS=<your-validator-alias-here>
    echo "export ALIAS=$ALIAS" >> ~/.bashrc
    ```

  - **Generate a Validator Account**:
    ```bash
    namada wallet address gen --alias $ALIAS
    ```

  - **Initialize the Validator Account**:
    ```bash
    namada client init-validator \
      --alias $ALIAS \
      --account-keys $ALIAS \
      --signing-keys $ALIAS \
      --commission-rate <enter-your-commission-rate> \
      --max-commission-rate-change <enter-decimal-rate>
    ```

</details>
