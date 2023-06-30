## Useful links

* [**`Website`**](https://nymtech.net)
* [**`Twitter`**](https://twitter.com/nymproject)
* [**`Discord`**](https://discord.gg/4QVWMyhu)
* [**`Github`**](https://github.com/nymtech/nym)
* [**`Official doc`**](https://cascadia.gitbook.io/gitbook)
* **`Explorer:`** [**`Official`**](https://explorer.nymtech.net/network-components/mixnodes/) [**`Nodes Guru`**](https://mixnet.explorers.guru/mixnodes)
___
## Minimum System Requirements
* **2 x dedicated/physical CPUs withSSE4.1 and SSE4.2 flags (use [lscpu](https://manpages.ubuntu.com/manpages/trusty/man1/lscpu.1.html) to verify)**
* **8 GB RAM**
* **200 GB SSD**
* **100 Mbit/s always-on internet connection with 4 TB/month data plan**
* **Linux OS (Ubuntu 20.04 or the latest version is recommended)**
___
## Prepare a server

```
sudo apt update && sudo apt install curl ufw 
```
```
sudo ufw allow 1789,1790,8000,22,80,443/tcp
```
```
tag=$(curl -s https://github.com/nymtech/nym/tags | grep -oE "nym-binaries-v[0-9.]+" | head -n 1)
url="https://github.com/nymtech/nym/releases/download/$tag/nym-mixnode"
```
```
curl -L "$url" -o /usr/local/bin/nym-mixnode
chmod +x /usr/local/bin/nym-mixnode
```
```
echo Enter your Wallet Address: && read ADDRESS && echo 'export ADDRESS='$ADDRESS >> $HOME/.bash_profile && \
echo Enter your Mixnode Name: && read ID && echo 'export ID='ID >> $HOME/.bash_profile && \
source ~/.bash_profile
```
```
nym-mixnode init --id $ID --host $(curl ifconfig.me)
```

```
sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF
sudo systemctl restart systemd-journald
sudo tee <<EOF >/dev/null /etc/systemd/system/nym-mixnode.service
[Unit]
Description=Nym Mixnode

[Service]
User=$USER
ExecStart=/usr/local/bin/nym-mixnode run --id '$ID'
KillSignal=SIGINT
Restart=on-failure
RestartSec=30
StartLimitInterval=350
StartLimitBurst=10
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
echo "DefaultLimitNOFILE=65535" >> /etc/systemd/system.conf
```

```
sudo systemctl daemon-reload
sudo systemctl enable nym-mixnode
sudo systemctl restart nym-mixnode
```
