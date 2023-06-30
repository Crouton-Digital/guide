```
sudo apt update && sudo apt install curl ufw 
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
sudo ufw allow 1789,1790,8000,22,80,443/tcp
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
ExecStart=/usr/local/bin/nym-mixnode run --id '$node_id'
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
