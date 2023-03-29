[<img src='https://miro.medium.com/v2/resize:fit:1400/format:webp/1*irsTrXmd7bzT-fcO7VM9xg.jpeg' alt='TESTNETS'  width='100%'>]()

**How to deploy a smart contract**

You need to create (generate) Aleo wallet, you can do it here https://aleo.tools/

Click on Generate and save your Private key, View key and address

[<img src='https://miro.medium.com/v2/resize:fit:1400/format:webp/1*BCFCIxixwObGcyC7m5xong.png' alt='TESTNETS'  width='100%'>]()



**Download required packages and create a tmux session**

```apt update && \
apt install make clang pkg-config libssl-dev build-essential gcc xz-utils git curl vim tmux ntp jq llvm ufw -y && \
tmux new -s deploy
```

**Add your wallet and private key as a variable.**

```
echo Enter your Private Key: && read PK && \
echo Enter your View Key: && read VK && \
echo Enter your Address: && read ADDRESS
```

**Make sure the data is correct. If not, you can do step 3 again.**

```
echo Private Key: $PK && \
echo View Key: $VK && \
echo Address: $ADDRESS
```

**Generate a tweet with your wallet to get tokens**

```
echo "@AleoFaucet%20send%2010%20credits%20to%20$ADDRESS">https://twitter.com/intent/tweet?text=@AleoFaucet%20send%2010%20credits%20to%20$ADDRESS"
```

P.S. You need to past the output of the command above into your browser and publish a tweet and wait for the response form a bot. It will take about 30–40 minutes. The bot will send you a link which you will need to use in the step 7.


**EXAMPLE**

[<img src='https://miro.medium.com/v2/resize:fit:1400/format:webp/1*5MPQAIOcALz8B1iOe_nyCQ.png' alt='TESTNETS'  width='100%'>]()

When your tweet get quoted you will receive this message. Copy the link that you get from Aleo faucet

[<img src='https://miro.medium.com/v2/resize:fit:1400/format:webp/1*OhVekf9CJxjWpGIvBKhyFw.png' alt='TESTNETS'  width='100%'>]()


**Install required software**

```
cd $HOME
git clone https://github.com/AleoHQ/snarkOS.git --depth 1
cd snarkOS
bash ./build_ubuntu.sh
source $HOME/.bashrc
source $HOME/.cargo/env
```

```
cd $HOME
git clone https://github.com/AleoHQ/leo.git
cd leo
cargo install --path .
```


**Deploy a contract**

```
echo Enter the Name of your contract "(any)": && read NAME
```

```
cd $HOME && mkdir leo_deploy && cd leo_deploy
leo new $NAME
```


**P.S In the command below past the link which you got from Aleo faucet bot on twitter**

```
echo Paste the link: && read QUOTE_LINK && \
CIPHERTEXT=$(curl -s $QUOTE_LINK | jq -r '.execution.transitions[0].outputs[0].value')
```

```
RECORD=$(snarkos developer decrypt --ciphertext $CIPHERTEXT --view-key $VK)
```

```
snarkos developer deploy "$NAME.aleo" \
--private-key "$PK" \
--query "https://vm.aleo.org/api" \
--path "$HOME/leo_deploy/$NAME/build/" \
--broadcast "https://vm.aleo.org/api/testnet3/transaction/broadcast" \
--fee 600000 \
--record "$RECORD"
```

**Congratulations we just deployed a smart contract on Aleo**

**Follow Crouton Digital for more guides and daily news**

**https://t.me/CroutonDigital**




