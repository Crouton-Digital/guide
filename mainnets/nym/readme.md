sudo apt update && sudo apt install curl

tag=$(curl -s https://github.com/nymtech/nym/tags | grep -oE "nym-binaries-v[0-9.]+" | head -n 1)
url="https://github.com/nymtech/nym/releases/download/$tag/nym-mixnode"

curl -L "$url" -o /usr/local/bin/nym-mixnode
chmod +x /usr/local/bin/nym-mixnode
