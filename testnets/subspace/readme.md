<p align="center">
  <img src='https://user-images.githubusercontent.com/113435724/229927873-b0a3a7ff-bd89-4c06-b89f-cea0c41b2f6f.png' alt='PRE-RELISE'  width=100% > 
</p>

**Subspace Network** allows developers to launch **Web3** applications at Internet scale. It provides a simple interface for quickly deploying decentralized applications with multiple chains that automatically scale as needed. Subspace runs on a new, environmentally friendly **4th-generation blockchain** that provides scalable storage and computing in the network without compromising security or decentralization. It easily integrates with existing **blockchains**, second-layer protocols, and decentralized applications, allowing it to serve as the foundational level of infrastructure for the entire **Web3** ecosystem. **Subspace** will enable developers to unlock the next wave of cryptography adoption, supporting **NFTs, GameFi, and the Metaverse** at Internet scale.

- The project offers a non-standard consensus system, specifically **Proof-of-Archive-Storage (POAS).**

- **Investors:** Pantera Capital, Coinbase Ventures, Crypto.com, Alameda Research, ConsenSys Mesh.
#
⎜[**Discord**](https://discord.gg/subspace-network) ⎜ [**Twitter**](https://twitter.com/NetworkSubspace) ⎜ [**Website**](https://subspace.network) ⎜ [**Explorer**](https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Feu-0.gemini-3d.subspace.network%2Fws#/explorer) ⎜ [**Telemetry**](https://telemetry.subspace.network/#list/0x7f489750cfe91e17fc19b42a5acaba41d1975cedd3440075d4a4b4171ad0ac20) ⎜
___

### `Server requirements:`
```python
CPU: 2 
RAM: 2GB 
SSD/NVME: 150GB
```
#
### `Server preparation:`
```bash
# Distribution update
sudo apt-get update && sudo apt-get upgrade -y 
```
```bash
# Installing required packages
sudo apt-get install wget jq ocl-icd-opencl-dev \
libopencl-clang-dev libgomp1 ocl-icd-libopencl1 -y
```
___
### `Node install:`

```bash

# Determine latest release
TAG=$(wget -qO- https://api.github.com/repos/subspace/subspace-cli/releases | jq '.[] | select(.prerelease==false) | select(.draft==false) | .html_url' | grep -Eo "v[0-9]*.[0-9]*.[0-9]*" | head -n 1) && echo "Cli version: $TAG"
```
**You can make sure the version is determined successfully, it should match the ⎧<img src='https://user-images.githubusercontent.com/83868103/228858929-859e6479-e1e9-465f-9f92-73a6bc437207.png' alt='latest'  height=25 >⎫ [release](https://github.com/subspace/subspace-cli/releases)** 

**Don't use a ⎧<img src='https://user-images.githubusercontent.com/83868103/228862961-161b7ca9-fa19-4207-94e3-140cc744bf1c.png' alt='PRE-RELISE'  height=25 >⎫ unless required by the latest [discord](https://discord.gg/subspace-network) announcements** ⚠️
#
```bash
# Download Cli
wget https://github.com/subspace/subspace-cli/releases/download/$TAG-alpha/subspace-cli-ubuntu-x86_64-v3-$TAG-alpha -qO subspace && \
sudo chmod 777 subspace && \
sudo mv subspace /usr/local/bin/ && \
echo "Cli version: $(subspace -V)"
```
___
### `Wallet preparation:`
**`Installing wallet:` follow the [link](https://polkadot.js.org/extension/) and install the Polkadot extension for your browser**  
**`Metadata update:` to add the Subspace Gemini 3d network to your wallet, follow the [link](https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Feu-0.gemini-3d.subspace.network%2Fws#/accounts) and update the metadata**
<p align="center">
<img src='https://user-images.githubusercontent.com/83868103/228912506-fd61edc7-1ed6-4228-994d-0c0e827aa581.png' alt='PRE-RELISE'  width=50% > 
</p>

#

**`The wallet is already added in the extension:` simply select the new "Subspace Gemini 3d" network for your wallet and proceed to the next step**
<p align="center">
  <img src='https://user-images.githubusercontent.com/113435724/229575671-fb66d41d-6ba7-4124-a8a2-0cb19a189a92.png' alt='PRE-RELISE'  width=80% > 
</p> 



#

**`Restore wallet from past testnets:`**  
  - Press ✚ in your extension
  - Press  "🔑 Import account from pre-existing seed" 
  - Enter your mnemonic seed, select "Subspace Gemini 3d" network and click "Next"
  - Enter descriptive name for your account, password and click "Add the account with the supplied seed"
  - After restoring the wallet, you can proceed to the next step

<p align="center">
  <img src='https://user-images.githubusercontent.com/113435724/229575733-8eec7c32-06d0-4f2a-b370-1752b8ebb1e3.png' alt='PRE-RELISE'  width=80% > 
</p> 

#

**`Create a new wallet:`**  

<p align="center">
  <img src='https://user-images.githubusercontent.com/113435724/229575933-80010139-6464-4601-a3ad-d0abf8cfbb30.png' alt='PRE-RELISE'  width=80% > 
</p> 


___

### `Farmer setup:`

#

```bash
# Farmer initialization
subspace init
```
- Enter your farmer/reward address: enter the wallet from the previous [step](https://github.com/CroutonDigital/guide/tree/main/testnets/subspace#wallet-preparation)
- Enter your node name: unique name for telemetry search
- Plot location: leave by default (press enter)
- Plot size: 50GB
- Chain to farm: leave by default (press enter)

#

```bash
# Create service file
sudo tee <<EOF >/dev/null /etc/systemd/system/subspaced.service
[Unit]
Description=Subspace farmer
After=network.target
[Service]
Type=simple
User=$USER
ExecStart=$(which subspace) farm -v
Restart=always
RestartSec=3
LimitNOFILE=1024000
[Install]
WantedBy=multi-user.target
EOF
```
```bash
# Service start
sudo systemctl daemon-reload && \
sudo systemctl enable subspaced && \
sudo systemctl start subspaced
```
```bash
# Check logs
sudo journalctl -fu subspaced -o cat
```
#  
    Example of normal logs:

<p align="center">
  <img src='https://user-images.githubusercontent.com/83868103/228957696-08706ed1-6118-48a8-b1a0-5b8d1997cf4b.png' alt='PRE-RELISE'  width=100% > 
</p> 

#
**`Make sure your farmer is visible in telemetry:`**
  - Go to [telemetry](https://telemetry.subspace.network/#list/0x7f489750cfe91e17fc19b42a5acaba41d1975cedd3440075d4a4b4171ad0ac20)
  - Start typing your node name. You can see the node synchronization status and the actual height of the blocks ⬇︎ 


<p align="center">
  <img src='https://user-images.githubusercontent.com/113435724/229576726-9962d76f-444d-4387-9e0f-71a95f2ed150.png' alt='PRE-RELISE'  width=80% > 
</p> 




<p align="center">
  <img src='https://user-images.githubusercontent.com/83868103/228972409-bf0ec248-8d8d-4e49-88fb-5862a6ad50bb.png' alt='PRE-RELISE'  width=30% > 
</p>

**`Once fully synced, your wallet balance should receive farming rewards:`**
- Go to your [wallet](https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Feu-0.gemini-3d.subspace.network%2Fws#/accounts)

<p align="center">
  <img src='https://user-images.githubusercontent.com/83868103/228966327-31f62b0f-d499-45ef-a837-1c1045b8a277.png' alt='PRE-RELISE'  width=40% > 
</p> 

___


### `Node update:`
```bash
# Reset database
subspace wipe
```
### ⛔️ IMPORTANT! Execute the command only when switching between chains! ⛔️
#
**`Repeat steps:`  [Node install](https://github.com/CroutonDigital/guide/tree/main/testnets/subspace#node-install)**

```bash
# Service restart
sudo systemctl restart subspaced
```
```bash
# Check logs
sudo journalctl -fu subspaced -o cat
```
___
### `Delete node:`
```bash
# Stop service
sudo systemctl stop subspaced && \
sudo systemctl disable subspaced
```
```bash
# Delete node files
rm -Rvf $HOME/.local/share/subspace* \
$HOME/.config/subspace* \
/usr/local/bin/subspace
````
```bash
# Disabling and deleting a service
sudo rm -v /etc/systemd/system/subspaced.service && \
sudo systemctl daemon-reload
```
___
