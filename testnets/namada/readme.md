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
