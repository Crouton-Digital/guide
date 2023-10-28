![namadagithub](https://github.com/Crouton-Digital/guide/assets/113435724/bd6273b8-5b47-4201-b6c6-4cacbe9df032)

## 🛠 Installation Guide

Below are the step-by-step installation instructions for various tools. Each tool has its set of commands presented in a dropdown format. Simply click on the tool you're interested in to view the detailed installation steps.

---

### 🚀 Namada 

**Description:**  
Namada is a powerful tool designed for [short description or purpose of the tool]. Experience [specific advantages or features] with this tool.

<details>
  <summary>📦 Install Namada ➡️</summary>
  
  - **Set the desired version**:
    ```bash
    NAMADA_TAG="v0.23.1"
    ```

  - **Download the archive from GitHub**:
    ```bash
    curl -L -o namada.tar.gz "https://github.com/anoma/namada/releases/download/$NAMADA_TAG/namada-${NAMADA_TAG#v}-Linux-x86_64.tar.gz"
    ```

  - **Extract the downloaded archive**:
    ```bash
    tar -xvf namada.tar.gz
    ```

  - **Move the binary to the local bin directory**:
    ```bash
    sudo cp namada/* /usr/local/bin/
    ```

  - **Cleanup**:
    ```bash
    rm -rf namada namada.tar.gz
    ```

  - **Verify the installation**:
    ```bash
    namada --version
    ```

</details>

---

### 🔄 Protocol Buffers 

**Description:**  
Protocol Buffers (or "protobuf") are Google's language-neutral, platform-neutral mechanism. Install it to efficiently read and write data across languages.

<details>
  <summary>📦 Install Protocol Buffers ➡️</summary>
  
  - **Set the desired version**:
    ```bash
    PROTOBUF_TAG="v23.3"
    ```

  - **Download Protocol Buffers from GitHub**:
    ```bash
    curl -LO "https://github.com/protocolbuffers/protobuf/releases/download/$PROTOBUF_TAG/protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip"
    ```

  - **Extract and install Protocol Buffers**:
    ```bash
    sudo unzip -o "protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip" -d /usr/local bin/protoc
    sudo unzip -o "protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip" -d /usr/local 'include/*'
    ```

  - **Cleanup**:
    ```bash
    rm -f "protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip"
    ```

  - **Verify the installation**:
    ```bash
    protoc --version
    ```

</details>

---

### 🌌 CometBFT 

**Description:**  
CometBFT is [short description or purpose of the tool]. With CometBFT, you can [specific advantages or features].

<details>
  <summary>📦 Install CometBFT ➡️</summary>
  
  - **Set the desired version**:
    ```bash
    COMETBFT_TAG="v0.37.2"
    ```

  - **Download the archive from GitHub**:
    ```bash
    curl -L -o cometbft.tar.gz "https://github.com/cometbft/cometbft/releases/download/$COMETBFT_TAG/cometbft_${COMETBFT_TAG#v}_linux_amd64.tar.gz"
    ```

  - **Extract the downloaded archive**:
    ```bash
    tar -xvf cometbft.tar.gz
    ```

  - **Move the binary to the local bin directory**:
    ```bash
    sudo mv cometbft /usr/local/bin/cometbft
    ```

  - **Cleanup**:
    ```bash
    rm cometbft.tar.gz
    ```

  - **Verify the installation**:
    ```bash
    cometbft version
    ```

</details>

---
