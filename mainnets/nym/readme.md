## Useful links

* [**`Website`**](https://nymtech.net)
* [**`Twitter`**](https://twitter.com/nymproject)
* [**`Discord`**](https://discord.gg/4QVWMyhu)
* [**`Github`**](https://github.com/nymtech/nym)
* [**`Official doc`**](https://cascadia.gitbook.io/gitbook)
* **`Explorer:`** [**`Official`**](https://explorer.nymtech.net/network-components/mixnodes/) [**`Nodes Guru`**](https://mixnet.explorers.guru/mixnodes)
___
## Preparing the Wallet

#### Before you begin initializing and running your mixnode, please visit [**`NYM website`**](https://nymtech.net/download/) and download the wallet designed for your specific operating system. In case pre-compiled binaries are not available for your operating system, you can follow the provided [**`instructions`**](https://nymtech.net/docs/wallet/desktop-wallet.html) to build the wallet on your own.

#### If you do not have a Nym address yet, kindly create one using the wallet and ensure that it is funded with tokens. The minimum amount required to bond a mixnode is 100 NYM, but we recommend having a slightly higher balance to cover any associated gas costs.

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Bebas+Neue&size=30&duration=500&color=F75242&center=true&vCenter=true&multiline=true&repeat=false&width=1000&height=100&lines=Remember+that+you+can+only+use+Cosmos+NYM+tokens+to+bond+your+mixnode.;+You+cannot+use+ERC20+representations+of+NYM+to+run+a+node.)](https://git.io/typing-svg)
___
## Minimum System Requirements
* **`Processors:`** **2 cores are fine. Get the fastest CPUs you can afford.**
* **`RAM:`** **Memory requirements are very low - typically a mix node may use only a few hundred MB of RAM.**
* **`Disks:`** **The mixnodes require no disk space beyond a few bytes for the configuration files.**
* **`Bandwidth:`** **100 Mbit/s always-on internet connection with 4 TB/month data plan.**
* **`Linux OS:`** **Ubuntu 20.04 or the latest version is recommended**
___

## Prepare a server

```python
UPDATE AND INSTALL REQUIRED PACKAGES
```
```
sudo apt update && sudo apt install curl ufw 
```
```python
ALLOW PORTS
```
```
sudo ufw allow 1789,1790,8000,22,80,443/tcp
```
## Installing Mixnode
```python
DETERMINING THE LATEST VERSION
```
```
tag=$(curl -s https://github.com/nymtech/nym/tags | grep -oE "nym-binaries-v[0-9.]+" | head -n 1)
```
```python
DOWNLOAD AND MAKE BINARY EXECUTABLE
```
```
curl -L "https://github.com/nymtech/nym/releases/download/$tag/nym-mixnode" -o /usr/local/bin/nym-mixnode && \
chmod +x /usr/local/bin/nym-mixnode
```
## Mixnode configuration
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
