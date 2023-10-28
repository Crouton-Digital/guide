![test](https://github.com/Crouton-Digital/guide/assets/113435724/7cfd7024-287c-4c03-b10d-302b1eeb0057)


---

## Installation Guide 🛠

Below are the step-by-step installation instructions for various tools. Each tool has its set of commands presented in a dropdown format. Simply click on the tool you're interested in to view the detailed installation steps. Follow along to ensure a smooth setup.

---

### Namada 🚀

Namada is a powerful tool designed to [short description or purpose of the tool]. Installing it ensures [specific advantages or features].

<details>
  <summary>📦 Install Namada</summary>
  
  - **Set the desired version**:
    ```bash
    TAG="v0.23.1"
    ```

  - **Download the archive from GitHub**:
    ```bash
    curl -L -o namada.tar.gz "https://github.com/anoma/namada/releases/download/$TAG/namada-$TAG-Linux-x86_64.tar.gz"
    ```

  - **Extract the downloaded archive**:
    ```bash
    tar -xvf namada.tar.gz
    ```

  - **Replace old files with the new ones**:
    ```bash
    sudo cp namada/* /usr/local/bin/
    ```

  - **Cleanup**:
    ```bash
    rm -rf namada namada.tar.gz
    ```

</details>

### Protocol Buffers 🔄

Protocol Buffers (or "protobuf") are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data. By installing Protocol Buffers, you can efficiently read and write data from different languages.

<details>
  <summary>📦 Install Protocol Buffers</summary>
  
  - **Set the desired version**:
    ```bash
    PROTOC_TAG="23.3"
    ```

  - **Download Protocol Buffers from GitHub**:
    ```bash
    curl -LO "https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_TAG/protoc-$PROTOC_TAG-linux-x86_64.zip"
    ```

  - **Extract and install Protocol Buffers**:
    ```bash
    sudo unzip -o "protoc-$PROTOC_TAG-linux-x86_64.zip" -d /usr/local bin/protoc
    sudo unzip -o "protoc-$PROTOC_TAG-linux-x86_64.zip" -d /usr/local 'include/*'
    ```

  - **Cleanup**:
    ```bash
    rm -f "protoc-$PROTOC_TAG-linux-x86_64.zip"
    ```

</details>
