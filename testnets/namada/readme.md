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

  - **Download and extract to a specific folder**:
    ```bash
    curl -L -o namada.tar.gz "https://github.com/anoma/namada/releases/download/$NAMADA_TAG/namada-${NAMADA_TAG}-Linux-x86_64.tar.gz"
    mkdir namada_folder && tar -xvf namada.tar.gz -C namada_folder/
    ```

  - **Move to `/usr/local/bin`**:
    ```bash
    sudo mv namada_folder/* /usr/local/bin/
    ```

  - **Cleanup**:
    ```bash
    rm -rf namada_folder namada.tar.gz
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

  - **Download and extract to a specific folder**:
    ```bash
    curl -L -o protobuf.zip "https://github.com/protocolbuffers/protobuf/releases/download/$PROTOBUF_TAG/protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip"
    mkdir protobuf_folder && unzip protobuf.zip -d protobuf_folder/
    ```

  - **Move to `/usr/local/bin` and `/usr/local/include`**:
    ```bash
    sudo mv protobuf_folder/bin/protoc /usr/local/bin/
    sudo mv protobuf_folder/include/* /usr/local/include/
    ```

  - **Cleanup**:
    ```bash
    rm -rf protobuf_folder protobuf.zip
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

  - **Download and extract to a specific folder**:
    ```bash
    curl -L -o cometbft.tar.gz "https://github.com/cometbft/cometbft/releases/download/$COMETBFT_TAG/cometbft_${COMETBFT_TAG#v}_linux_amd64.tar.gz"
    mkdir cometbft_folder && tar -xvf cometbft.tar.gz -C cometbft_folder/
    ```

  - **Move to `/usr/local/bin`**:
    ```bash
    sudo mv cometbft_folder/cometbft /usr/local/bin/
    ```

  - **Cleanup**:
    ```bash
    rm -rf cometbft_folder cometbft.tar.gz
    ```

  - **Verify the installation**:
    ```bash
    cometbft version
    ```

</details>

---
