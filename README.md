# Run Nodes Doric Network

This document show how do setup of a new full node or validator

## Index

| NETWORK | TYPE      | CHAIN ID | STATS SERVER                                                                      |
| ------- | --------- | -------- | --------------------------------------------------------------------------------- |
| mainnet | validator | 1717     | ws://lb-doric-mainnet-stats-db74894ede9b9ba8.elb.us-east-1.amazonaws.com:3000/api |
| testnet | fullnode  | 1313     | ws://lb-doric-testnet-stats-cc0fe234c9e6d6c9.elb.us-east-1.amazonaws.com:3000/api |

## ENODES

| NETWORK | TYPE      | NUMBER | HOST                                                                                                                                                          |
| ------- | --------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| mainnet | fullnode  | 1      | enode://d1766a67c000f63868d28347c3de1acc6c7b6bcf46270039a0a72acdb35a1002ad9fd6169affaf9567a5a068d6692460a7293da8437b3d9d9f6b9739e9a7afb7@146.190.50.161:30303 |
| testnet | fullnode  | 1      | enode://e5f55e330905d804146f93eca7a05d994de6b3a50cb49416349c079ab9757659b798adeb57f3cfbcc7e32aa464d245beebbf2ee5dee8744ea7f8479e1d1a6f71@137.184.35.48:30303  |

## Preparation Setup

### 1 - Create to EC2 AWS

- Access AWS EC2 Instances
- Click in **`launch new instance`**
- Define the `Name` to your instance
- Select `Ubuntu` option in **`OS Images`** (use last version)
- Select `t2.medium` in **`Instance Type`**
- Select **`Key pair name`** with name `doric-[NETWORK]-[TYPE]`
- In **`Network Settings`** click in **`Edit`**
  - Select the `vpc-doric-[NETWORK]`
  - If the [TYPE] === "validator" ? `Select Private Subnet` : `Select Public Subnet`
  - **`Select Auto-assign public IP`** with `enable`
  - In **`Firewall Group`** select option Select existing security group
    - **`Select Common security groups`** `doric-[NETWORK]`
- **`Config Storage`** with `150 GB` and `gp2`
- Click in `Launch Instance`

### 2 - Create a new Wallet (Only Validator)

- Install `Geth`
  - Access [Download Geth](https://geth.ethereum.org/downloads)
  - Click your platform (Mac, Linux or Windows)
- Access the `Folder` of `Geth` in your downloads
- Run the Command in your terminal

```
geth --datadir . account new
```

- Generate new `Password` in [Lastpass](https://www.lastpass.com/pt/features/password-generator#generatorTool) with 15 digits and without symbols.
- Save new `Password` in security local
- Access Terminal again

  - Set password of validator wallet with `password generate` in last step
  - Repeat password
  - Your will receive the follow message in the terminal

  ```
    Your new key was generated

    Public address of the key:   [ADDRESS WALLET]
    Path of the secret key file: keystore/UTC--2023-08-21T19-15-04.712108000Z--  [ADDRESS WALLET]

    - You can share your public address with anyone. Others need it to interact with you.
    - You must NEVER share the secret key with anyone! The key controls access to your funds!
    - You must BACKUP your key file! Without the key, it's impossible to access account funds!
    - You must REMEMBER your password! Without the password, it's impossible to decrypt the key!
  ```

- Access keystore folder
- Copy the content of wallet that was generate

### 3 - Copy Content Script

- Access your EC2 Instance created in last step
- Access server that was created in before step
- Access the folder `Config` in this repository and Copy content of script `add-pkg-server.sh` in your server
- Modify the file `add-pkg-server.sh` in your server with env as example below

```bash
export STATIC_NODES_ARRAY="[ENODES]"
export CHAIN_ID=[CHAINID]
export NODEPORT="30303"
export TYPE_BLOCKCHAIN=[TYPE]
export NODE_HTTP_PORT="8545"
export NODE_WS_PORT="8546"
export BLOCKCHAIN_ENVIRONMENT=[NETWORK]
export ACCOUNT_FILE_CONTENT=[CONTENT FILE OF WALLET]
export WALLET_ACCOUNT=[PUBLIC ADDRESS OF WALLET]
export PASSWORD_NODE=[PASSWORD OF WALLET]
export GIT_COMMIT_HASH="df52967ff6080a27243569020ff64cd956fb8362"
export STATS_SERVER=[STATS SERVER]
export STATS_NODE_USER=[NAME NODE]
export STATS_NODE_PASSWORD="pzJx&n2rOtO#B29" ' > ./.env
```

- Add allow to execute

```
chmod +x add-pkg-server.sh && chmod +x run-docker.sh
```

- Run bash
  - Preparing and run docker
  ```
  ./add-pkg-server.sh
  ```
### 4 - Allow that the validator valid new blocks

- Contact [Doric Support](https://discord.gg/vYBUr3zKXj) to receive validade permission:
