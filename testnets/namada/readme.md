![namadagithub](https://github.com/Crouton-Digital/guide/assets/113435724/bd6273b8-5b47-4201-b6c6-4cacbe9df032)

## 🛠 Installation Guide

\### 🚀 Namada 

**Description:**  
Namada is a powerful tool designed for [short description or purpose of the tool]. Experience [specific advantages or features] with this tool.

<details>
  <summary>📦 Install Namada ➡️</summary>
  
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

### 🔄 Protocol Buffers 

**Description:**  
Protocol Buffers (or "protobuf") are Google's language-neutral, platform-neutral mechanism. Install it to efficiently read and write data across languages.

<details>
  <summary>📦 Install Protocol Buffers ➡️</summary>
  
  - **Set the desired version**:
    ```bash
    PROTOBUF_TAG="v23.3"
    ```

  - **Download and extract**:
    ```bash
    curl -L -o protobuf.zip "https://github.com/protocolbuffers/protobuf/releases/download/$PROTOBUF_TAG/protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip"
    unzip protobuf.zip
    ```

  - **Move to `/usr/local/bin` and `/usr/local/include`**:
    ```bash
    sudo mv bin/protoc /usr/local/bin/
    sudo mv include/* /usr/local/include/
    ```

  - **Cleanup**:
    ```bash
    rm -rf protobuf.zip bin include
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

  - **Download and extract**:
    ```bash
    curl -L -o cometbft.tar.gz "https://github.com/cometbft/cometbft/releases/download/$COMETBFT_TAG/cometbft_${COMETBFT_TAG#v}_linux_amd64.tar.gz"
    tar -xvf cometbft.tar.gz
    ```

  - **Move to `/usr/local/bin`**:
    ```bash
    sudo mv cometbft_${COMETBFT_TAG#v}_linux_amd64/cometbft /usr/local/bin/
    ```

  - **Cleanup**:
    ```bash
    rm -rf cometbft_${COMETBFT_TAG#v}_linux_amd64 cometbft.tar.gz
    ```

  - **Verify the installation**:
    ```bash
    cometbft version
    ```

</details>

---
