**CONCLUSION**

We completed IBC token [transfer](https://github.com/Crouton-Digital/guide/blob/main/testnets/namada/shielded-expedition/shielded-transfer-issue.md#executing-a-transfer-transferchannel-1uosmo-to-the-pilots-payment-addresses) `transfer/channel-1/uosmo` to shielded address from `tnam1qq6lxympuusdqrn7lnva7htzemrlsq2kkqyaxc0q`  to `znam1qr6v55a2gjhevsu4ukmqha54952az4vzavn3fy9ljwk9ns3n55zq6dsv2p2mnt6wg32y29qxnejhc`

Token transfer was [**successful**](https://github.com/Crouton-Digital/guide/blob/main/testnets/namada/shielded-expedition/shielded-transfer-issue.md#checking-the-balance-of-the-shielded-address) and we see it on balance as `tnam1p5z8ruwyu7ha8urhq2l0dhpk2f5dv3ts7uyf2n75`

We completed shielded transfer from `znam1qr6v55a2gjhevsu4ukmqha54952az4vzavn3fy9ljwk9ns3n55zq6dsv2p2mnt6wg32y29qxnejhc` to ` znam1qpt0524f38c24feffwkuugc27jvmvt3a9x4mtu8wwm8day2tqnvp4ye0fyqcqu7czc6ples54h5yg`

Transfer was **successful** and we see token on balance as `fc53dad0b9f1ee25ea954d3583d63a00e3efc3f60b256e172ffa9e1bc68acb58` ( **contract address was changed**  :rotating_light:)

On crew address we tried to complete unshield transfer and we got **ERROR**, also we tried to return the IBC token back to shielded pilot address and we got the **ERROR**

We completed unshielded transfer on  pilot account and tokens was **successfully** converted back to initial token

**WE THINK** that sending IBC token with **shielded transfer makes it impossible to use it in future on another account**. Because token **contract is changed**, and we receive an **ERROR** that Namada **cannot read** this token

For the experiment, 2 sets of wallets were used:

1 registered as pilot:
```
Transparent address: tnam1qq6lxympuusdqrn7lnva7htzemrlsq2kkqyaxc0q
Payment addresses:   znam1qr6v55a2gjhevsu4ukmqha54952az4vzavn3fy9ljwk9ns3n55zq6dsv2p2mnt6wg32y29qxnejhc
```

2 registered as crew:
```
Transparent address: tnam1qr9vy2t28cu2ezhax5r7mpeknh4wzn58tupq0cf4
Payment addresses:   znam1qpt0524f38c24feffwkuugc27jvmvt3a9x4mtu8wwm8day2tqnvp4ye0fyqcqu7czc6ples54h5yg
```

Checking the pilot's balance:
```
namadac balance --owner croutondigital

naan: 360.707602
transfer/channel-1/uosmo: 7
transfer/channel-12/ustars: 9
transfer/channel-22/uflix: 9
transfer/channel-3/uatom: 9
```

### Executing a transfer transfer/channel-1/uosmo to the pilot's Payment addresses:
```
namadac transfer     --source croutondigital     --target croutondigital-pay     --token transfer/channel-1/uosmo     --amount 2     --memo "tpknam1qqjzwxrku9pv8vtz0x2y578ytj58cwc55ughh7qlj3rwekye2lz2y30dua2"

Enter your decryption password: 
Transaction added to mempool.
Wrapper transaction hash: 770ED12777007A2278388BE1DB3DAB508048B557A997CCDD9CA686C30F02B568
Inner transaction hash: 96E37EFABBC98189C5087653D3F722F49DAC3ADA94B769263B9C933501C6FC77
Wrapper transaction accepted at height 12979. Used 47 gas.
Waiting for inner transaction result...
Transaction was successfully applied at height 12980. Used 10166 gas.
```

### Checking the balance of the Shielded address:
```
namadac balance --owner croutondigital-spend
Last committed epoch: 3
tnam1p5z8ruwyu7ha8urhq2l0dhpk2f5dv3ts7uyf2n75 : 2
```
The token transfer/channel-1/uosmo appeared as tnam1p5z8ruwyu7ha8urhq2l0dhpk2f5dv3ts7uyf2n75  on the Shielded address

**Transfer between shielded addresses Pilot and Crew**

```
namadac transfer     --source croutondigital-spend     --target znam1qpt0524f38c24feffwkuugc27jvmvt3a9x4mtu8wwm8day2tqnvp4ye0fyqcqu7czc6ples54h5yg  --token tnam1p5z8ruwyu7ha8urhq2l0dhpk2f5dv3ts7uyf2n75     --amount 1 --memo "tpknam1qqjzwxrku9pv8vtz0x2y578ytj58cwc55ughh7qlj3rwekye2lz2y30dua2" --signing-keys croutondigital
Enter your decryption password: 
Enter your decryption password: 
Transaction added to mempool.
Wrapper transaction hash: 87BE20044A2D82A447EAEAF6AC650AD5F231AF6D9F0B8AAFFF32BE83CEAA0AB9
Inner transaction hash: 299E4D6373E7C7ADFE4F008D134B151F4130FEC75C522DF389EC8E5A778CC2F9
Wrapper transaction accepted at height 13361. Used 67 gas.
Waiting for inner transaction result...
Transaction was successfully applied at height 13362. Used 9742 gas.
```

Tokens received on the Shielded address Crew
```
namadac balance --owner crew-spend
Last committed epoch: 3
converting current asset type to latest asset type...
naan : 2
fc53dad0b9f1ee25ea954d3583d63a00e3efc3f60b256e172ffa9e1bc68acb58 : 2
```

**The token contract has changed** on fc53dad0b9f1ee25ea954d3583d63a00e3efc3f60b256e172ffa9e1bc68acb58  ❗️


Attempt to withdraw token from shielded to transparent address

```
namadac transfer     --source crew-spend     --target crew     --token fc53dad0b9f1ee25ea954d3583d63a00e3efc3f60b256e172ffa9e1bc68acb58      --amount 1     --signing-keys crew     --memo "tpknam1qqjzwxrku9pv8vtz0x2y578ytj58cwc55ughh7qlj3rwekye2lz2y30dua2"
Enter your decryption password: 
The application panicked (crashed).
Message:  called `Result::unwrap()` on an `Err` value: "Unknown address fc53dad0b9f1ee25ea954d3583d63a00e3efc3f60b256e172ffa9e1bc68acb58"
Location: crates/apps/src/lib/cli/context.rs:246

Backtrace omitted. Run with RUST_BACKTRACE=1 environment variable to display it.
Run with RUST_BACKTRACE=full to include source snippets.
```
Attempt to return IBC token with shielded transfer from crew to pilot

```
namadac transfer     --source crew-spend     --target znam1qr6v55a2gjhevsu4ukmqha54952az4vzavn3fy9ljwk9ns3n55zq6dsv2p2mnt6wg32y29qxnejhc  --token fc53dad0b9f1ee25ea954d3583d63a00e3efc3f60b256e172ffa9e1bc68acb58     --amount 1 --memo "tpknam1qqjzwxrku9pv8vtz0x2y578ytj58cwc55ughh7qlj3rwekye2lz2y30dua2" --signing-keys crew
Enter your decryption password: 
The application panicked (crashed).
Message:  called `Result::unwrap()` on an `Err` value: "Unknown address fc53dad0b9f1ee25ea954d3583d63a00e3efc3f60b256e172ffa9e1bc68acb58"
Location: crates/apps/src/lib/cli/context.rs:246

Backtrace omitted. Run with RUST_BACKTRACE=1 environment variable to display it.
Run with RUST_BACKTRACE=full to include source snippets.
```
Return of tokens from the shielded address to the transparent for the pilot:
```
namadac balance --owner croutondigital
naan: 353.207602
transfer/channel-1/uosmo: 5
transfer/channel-12/ustars: 9
transfer/channel-22/uflix: 9
transfer/channel-3/uatom: 9
```

```
namadac transfer     --source croutondigital-spend     --target croutondigital     --token tnam1p5z8ruwyu7ha8urhq2l0dhpk2f5dv3ts7uyf2n75      --amount 1     --signing-keys croutondigital     --memo "tpknam1qqjzwxrku9pv8vtz0x2y578ytj58cwc55ughh7qlj3rwekye2lz2y30dua2"
Enter your decryption password: 
Enter your decryption password: 
Wrapper transaction hash: FAA3758B80E4EB05DBB5B6F4D298FA12E1121A5140376B2307AAB2CD332B2ED2
Inner transaction hash: B993E8741627167AADF04CCF188057C281E016E81847B4569363AAE66BCFD779
Wrapper transaction accepted at height 13235. Used 70 gas.
Waiting for inner transaction result...
Transaction was successfully applied at height 13236. Used 10176 gas.
```

```namadac balance --owner croutondigital
naan: 350.707602
transfer/channel-1/uosmo: 6
transfer/channel-12/ustars: 9
transfer/channel-22/uflix: 9
transfer/channel-3/uatom: 9
```
