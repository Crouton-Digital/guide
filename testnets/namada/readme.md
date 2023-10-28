___
## Installation
**Set the TAG variable to the desired version**
```bash
TAG="v0.23.1"
```

**Download the archive from GitHub**
```bash
curl -L -o namada.tar.gz "https://github.com/anoma/namada/releases/download/$TAG/namada-$TAG-Linux-x86_64.tar.gz"
```

**Extract the downloaded archive**
```bash
tar -xvf namada.tar.gz
```

**Replace old files with the new ones in /usr/local/bin**
```bash
sudo cp namada/* /usr/local/bin/
```

**Remove temporary files**
```bash
rm -rf namada namada.tar.gz
```

**Set the desired Protocol Buffers version tag**
```bash
PROTOC_TAG="23.3"
```

**Construct the URL for downloading Protocol Buffers**
```bash
PROTOC_URL="https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_TAG/protoc-$PROTOC_TAG-linux-x86_64.zip"
```

**Define the name of the zip file**
```bash
PROTOC_ZIP="protoc-$PROTOC_TAG-linux-x86_64.zip"
```

**Download Protocol Buffers**
```bash
curl -OL "$PROTOC_URL"
```

**Install Protocol Buffers**
```bash
sudo unzip -o "$PROTOC_ZIP" -d /usr/local bin/protoc
sudo unzip -o "$PROTOC_ZIP" -d /usr/local 'include/*'
```

**Remove the downloaded zip file**
```bash
rm -f "$PROTOC_ZIP"
```
