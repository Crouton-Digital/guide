___
[<img src='' alt='banner' width= '99.5%'>]()
___
## Useful links

* [**`Website`**]()
* [**`Twitter`**]()
* [**`Discord`**]()
* [**`Github`**]()
* [**`Official doc`**]()
* [**`Whitepaper`**]()
* [**`Faucet`**]()
* **`Explorer:`** [**`Official`**]() [**`Nodes Guru`**]()
___
## Minimum System Requirements
?????
* **2 x dedicated/physical CPUs withSSE4.1 and SSE4.2 flags (use [lscpu](https://manpages.ubuntu.com/manpages/trusty/man1/lscpu.1.html) to verify)**
* **8 GB RAM**
* **200 GB SSD**
* **100 Mbit/s always-on internet connection with 4 TB/month data plan**
* **Linux OS (Ubuntu 20.04 or the latest version is recommended)**
___
## Prepare a server
```python
UPDATE AND INSTALL PACKAGES
```
```bash
sudo apt update && sudo apt upgrade -y && \
sudo apt install curl tar wget pkg-config libssl-dev libleveldb-dev jq build-essential bsdmainutils git make unzip bc  -y
```
#
```python
INSTALLING GO v1.21.6
```
```bash
cd $HOME && \
ver="1.21.6" && \
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz" && \
sudo rm -rf /usr/local/go && \
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz" && \
rm "go$ver.linux-amd64.tar.gz" && \
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile && \
source $HOME/.bash_profile && \
go version
```
___
## Installation
```python
INSTALL LAST BINARY
```
```bash
git clone https://github.com/celestiaorg/celestia-app.git 
cd celestia-app
git checkout tags/v1.6.0  -b v1.6.0 
make install
```
#
```python
INIT CONFIG
```
```bash
celestia-appd init <moniker> --chain-id mocha-4
celestia-appd config chain-id mocha-4
celestia-appd config keyring-backend test
```
#
```python
DOWNLOAD GENESIS
```
```bash
wget -O $HOME/.celestia-app/config/genesis.json https://raw.githubusercontent.com/celestiaorg/networks/master/mocha-4/genesis.json
```
#
```python
SET PEERS
```
```bash
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$(curl -sL https://raw.githubusercontent.com/celestiaorg/networks/master/mocha-4/peers.txt | head -c -1 | tr '\n' ',')\"/" $HOME/.celestia-app/config/config.toml
```
#
```python
SET MINIMUM GAS PRICE
```
```bash
sed -i.bak -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.0025utia\"/" $HOME/.celestia-app/config/config.toml
```
#
```python
CREATE SERVICE FILE
```
```bash
sudo tee /etc/systemd/system/celestia-appd.service > /dev/null <<EOF
[Unit]
Description=Celestia-testnet
After=network-online.target

[Service]
User=$USER
ExecStart=$(which celestia-appd) start
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF
```
#
```python
SERVICE FILE ACTIVATION
```
```bash
sudo systemctl daemon-reload && \
sudo systemctl enable celestia-appd && \
sudo systemctl restart celestia-appd
```
#
```python
CHECK LOGS
```
```bash
journalctl -fu celestia-appd -o cat
```
___
## Creating a validator
```python
CREATE WALLET
```
```bash
celestia-appd keys add <wallet_name>
```
#
```python
CREATE A VALIDATOR
```
```bash
celestia-appd tx staking create-validator \
  --amount=1000000utia \
  --pubkey=$(celestia-appd tendermint show-validator) \
  --moniker="<moniker>" \
  --identity="<identity>" \
  --website="<website>" \
  --details="<details>" \
  --security-contact="<contact>" \
  --chain-id="mocha-4" \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1" \
  --gas "auto" \
  --fees 500utia \
  --from=<wallet_name>
  ```
___
