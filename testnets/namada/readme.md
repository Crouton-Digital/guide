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
PROTOC_TAG="v23.3"
```

**Download the Protocol Buffers archive from GitHub**
```bash
curl -LO "https://github.com/protocolbuffers/protobuf/releases/download/$PROTOC_TAG/protoc-23.3-linux-x86_64.zip"
```

**Unzip the Protocol Buffers binary and place it in /usr/local/bin**
```bash
sudo unzip -o "protoc-23.3-linux-x86_64.zip" -d /usr/local bin/protoc
```

**Unzip the Protocol Buffers include files and place them in /usr/local/include**
```bash
sudo unzip -o "protoc-23.3-linux-x86_64.zip" -d /usr/local 'include/*'
```

**Remove the downloaded archive**
```bash
rm -f "protoc-23.3-linux-x86_64.zip"
```
