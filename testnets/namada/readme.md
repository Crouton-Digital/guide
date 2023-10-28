![namadagithub](https://github.com/Crouton-Digital/guide/assets/113435724/bd6273b8-5b47-4201-b6c6-4cacbe9df032)

## Namada Node Setup Guide

#### ⚙️ Installation of Required Binaries:

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

#### 🌟 Node Initialization:
<details>
  <summary>Node Initialization</summary>

  _[Here we'll describe the steps required for initializing the Namada node after the required binaries are installed. This will include configuration, setting up directories, etc.]_

</details>

#### 🔄 Service Creation for Node Startup:
<details>
  <summary>Service Creation</summary>

To ensure that the Namada node starts automatically and runs as a system service, follow these steps:

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



