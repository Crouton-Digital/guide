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

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Bebas+Neue&size=30&duration=1000&color=F75242&center=true&vCenter=true&multiline=true&repeat=false&width=1000&height=100&lines=Remember+that+you+can+only+use+Cosmos+NYM+tokens+to+bond+your+mixnode.;+You+cannot+use+ERC20+representations+of+NYM+to+run+a+node.)](https://git.io/typing-svg)
___
## [![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Bebas+Neue&size=30&duration=1000&color=F46D22&background=91683700&vCenter=true&repeat=false&width=1050&height=32&lines=Minimum+System+Requirements%3A)](https://git.io/typing-svg)

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
## Configuration Mixnode
```python
STORE MIXNODE NAME
```
```
echo Enter your Mixnode Name: && \
read ID && echo 'export ID='$ID >> $HOME/.bash_profile && \
source ~/.bash_profile
```
```python
INITIALIZE MIXNODE
```
```
nym-mixnode init --id $ID --host $(curl ifconfig.me)
```
## Running Mixnode
```python
CREATING SERVICE
```
```ruby
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
```python
START SERVICE
```
```
sudo systemctl daemon-reload
sudo systemctl enable nym-mixnode
sudo systemctl restart nym-mixnode
```
```python
CHECK LOGS
```
```
sudo journalctl -u nym-mixnode -o cat -f
```
<img width="1095" alt="Слой 1" src="https://github.com/Crouton-Digital/guide/assets/83868103/b746b29a-a9fa-4457-ad43-aca32675513e">

## Bonding Mixnode


#### Bond via the Desktop wallet (recommended)
[<img align="right" src='https://github.com/Crouton-Digital/guide/assets/83868103/c57f4935-ee52-41fa-bafb-b3c16dd1f7f2' alt='Detail'  width='55%'>]() 
```python
OBTAIN NODE DETAILS
```
```bash
nym-mixnode node-details --id $ID
```

* **Open your wallet, and head to the `Bond` page, then select the node type and input your node details. Press `Next`.**



  <img src='https://github.com/Crouton-Digital/guide/assets/83868103/053e42b8-9e6d-409f-90cd-f168782f57d5' alt='Bonding'  width=48% > 
  
  <img src='https://github.com/Crouton-Digital/guide/assets/83868103/163db173-f677-441a-8c41-3c300df56730' alt='Bonding'  width=50% > 


You will be asked to run a the sign command with your gateway - copy and paste the long signature as the value of --contract-msg and run it. It will look something like this:
```
echo Enter the "Message" copied from the NYM wallet: && \
read MSG 
nym-mixnode sign --id $ID --contract-msg $MSG
```



<img width="589" alt="Слой 1" src="https://github.com/Crouton-Digital/guide/assets/83868103/4cc03f4d-269e-4553-bc87-c77d0b565e76">

Copy the resulting signature:
<img width="1377" alt="Слой 1" src="https://github.com/Crouton-Digital/guide/assets/83868103/e87e7c3d-fd4a-4618-8398-0c306ab4a289">

<img width="588" alt="Слой 1" src="https://github.com/Crouton-Digital/guide/assets/83868103/5ff1a29f-596a-4f90-8a10-8a31aac50d35">

<img width="586" alt="Слой 1" src="https://github.com/Crouton-Digital/guide/assets/83868103/460884bd-1db4-4f31-a41e-30962acd904b">

<img width="1525" alt="image" src="https://github.com/Crouton-Digital/guide/assets/83868103/7adb6f02-f199-486e-8f4a-81d0d6efebe7">


