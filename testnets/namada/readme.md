![namadagithub](https://github.com/Crouton-Digital/guide/assets/113435724/bd6273b8-5b47-4201-b6c6-4cacbe9df032)

### 🚀 **1. Installation of Required Binaries**

<details>
<summary>📦 Installation Details ➡️</summary>

#### 🛠 **Namada** 

**Description:**  
Namada is a crucial binary for running the Namada node. Ensure that you have the latest version for optimal performance and security.

<details>
  <summary>Install Namada ➡️</summary>
  
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

---

#### 🔄 **Protocol Buffers** 

**Description:**  
Protocol Buffers (or "protobuf") are essential for data serialization in the Namada node. They enable efficient data reading and writing across different languages.

<details>
  <summary>Install Protocol Buffers ➡️</summary>
  
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

---

#### 🌌 **CometBFT** 

**Description:**  
CometBFT aids in the consensus mechanism of the Namada node. Ensure its latest version is installed for the best node performance.

<details>
  <summary>Install CometBFT ➡️</summary>
  
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

</details>

---

### 🚀 **2. Node Initialization**

_[Here we'll describe the steps required for initializing the Namada node after the required binaries are installed. This will include configuration, setting up directories, etc.]_

---

### 🚀 **3. Service Creation for Node Startup**

_[This section will guide users on how to create a system service so that the Namada node starts up automatically. It will include steps for creating a systemd service, enabling it, and checking its status.]_
