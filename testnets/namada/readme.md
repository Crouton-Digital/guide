## Installation Instructions

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
