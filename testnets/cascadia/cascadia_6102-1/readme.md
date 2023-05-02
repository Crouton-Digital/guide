## Useful links

* [**`Website`**](https://www.cascadia.foundation)
* [**`Twitter`**](https://twitter.com/CascadiaSystems)
* [**`Discord`**](https://discord.gg/cascadia)
* [**`Github`**](https://github.com/CascadiaFoundation)
* [**`Official doc`**](https://cascadia.gitbook.io/gitbook)
* [**`Whitepaper`**](https://drive.google.com/file/d/1t_s9tc04Ewr_CzHEWochzwZzVL7Vh3bz/edit)
* [**`Faucet`**](https://www.cascadia.foundation/faucet)
* **`Explorer:`** [**`Official`**](https://validator.cascadia.foundation) [**`Nodes Guru`**](https://testnet.cascadia.explorers.guru)
___
## Minimum System Requirements
* 2 x dedicated/physical CPUs withSSE4.1 and SSE4.2 flags (use [lscpu](https://manpages.ubuntu.com/manpages/trusty/man1/lscpu.1.html) to verify)
* 8 GB RAM
* 200 GB SSD
* 100 Mbit/s always-on internet connection with 4 TB/month data plan
* Linux OS (Ubuntu 20.04 or the latest version is recommended)
___
## Prepare a server
```python
UPDATE AND INSTALL PACKAGES
```
```bash
sudo apt update && sudo apt upgrade -y && \
sudo apt install curl tar wget clang pkg-config libssl-dev libleveldb-dev jq build-essential bsdmainutils git make ncdu htop screen unzip bc fail2ban htop -y
```
#
```python
INSTALLING GO v1.19.4
```
```bash
cd $HOME && \
ver="1.19.4" && \
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
git clone https://github.com/CascadiaFoundation/cascadia
cd cascadia
git checkout v0.1.1
make install
```
#
```python
INIT CONFIG
```
```bash
cascadiad init <moniker> --chain-id cascadia_6102-1
cascadiad config chain-id cascadia_6102-1
```
#
```python
DOWNLOAD GENESIS
```
```bash
curl -LO https://github.com/CascadiaFoundation/chain-configuration/raw/master/testnet/genesis.json.gz
gunzip genesis.json.gz
cp genesis.json ~/.cascadiad/config/
```
#
```python
ADD PEERS
```
```bash
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$(curl  https://raw.githubusercontent.com/CascadiaFoundation/chain-configuration/master/testnet/persistent_peers.txt)\"/" ~/.cascadiad/config/config.toml
```
#
```python
SET MINIMUM GAS PRICE
```
```bash
sed -i.bak -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.0025aCC\"/" ~/.cascadiad/config/app.toml
```
#
```python
CREATE SERVICE FILE
```
```bash
sudo tee /etc/systemd/system/cascadiad.service > /dev/null <<EOF
[Unit]
Description=Cascadia
After=network-online.target

[Service]
User=$USER
ExecStart=$(which cascadiad) start
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
sudo systemctl enable cascadiad && \
sudo systemctl restart cascadiad
```
#
```python
CHECK LOGS
```
```bash
journalctl -fu cascadiad -o cat
```
___
## Creating a validator
```python
CREATE WALLET
```
```bash
cascadiad keys add <wallet_name>
```
#
```python
CREATE ADDRESS TO EMV
```
```bash
cascadiad address-converter <wallet_address>
```
#
```python
CREATE A VALIDATOR
```
```bash
cascadiad tx staking create-validator \
  --amount=1000000000000000000aCC \
  --pubkey=$(cascadiad tendermint show-validator) \
  --moniker="<moniker>" \
  --identity="<identity>" \
  --website="<website>" \
  --details="<details>" \
  --security-contact="<contact>" \
  --chain-id="cascadia_6102-1" \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1" \
  --gas "auto" \
  --gas-adjustment=1.2 \
  --gas-prices="7aCC" \
  --from=<wallet_name>
  ```
___
[<img src='https://user-images.githubusercontent.com/113435724/230788690-cbc1327f-7bc9-40ff-b6c5-fbf78182593b.png' alt='medium'  width='19.5%'>](https://medium.com/@CroutonDigital)
[<img src='https://user-images.githubusercontent.com/113435724/230788691-74ac3bf2-b5ad-424c-86a9-f4dad5a0c76b.png' alt='telegram'  width='19.5%'>](https://t.me/CroutonDigital)
[<img src='https://user-images.githubusercontent.com/113435724/230788692-c1974fe3-aaf2-42cb-90a5-75e699ef979d.png' alt='twitter'  width='19.5%'>](https://twitter.com/CroutonDigital)
[<img src='https://user-images.githubusercontent.com/113435724/230788686-c18f685e-f5da-4016-81c9-619142135f7a.png' alt='email'  width='19.5%'>](mailto:croutondigital@aol.com)
[<img src='https://user-images.githubusercontent.com/113435724/230986711-7f73c016-5ee1-4588-9b5b-91fbba898c83.png' alt='web'  width='19.5%'>](https://crouton-nodes-prod.web.app)
