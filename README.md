# Run Nodes Doric Network

This document show how do setup of a new full node or validator

## Index

| NETWORK | TYPE      | CHAIN ID | STATS SERVER                                                                      |
| ------- | --------- | -------- | --------------------------------------------------------------------------------- |
| mainnet | validator | 1717     | ws://lb-doric-mainnet-stats-db74894ede9b9ba8.elb.us-east-1.amazonaws.com:3000/api |
| testnet | fullnode  | 1313     | ws://lb-doric-testnet-stats-cc0fe234c9e6d6c9.elb.us-east-1.amazonaws.com:3000/api |

## ENODES

| NETWORK | TYPE      | NUMBER | HOST                                                                                                                                                       |
| ------- | --------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| mainnet | Validator | 1      | enode://2ff09365a248a0b7e8f70b3e3e62aa4f2bd9308ac6d85f5e6c810cc760c71f2a69a09035b45c72da903cb532373e8c39a5206564dc5d21424b1fe5a58b88b18c@10.0.15.50:30303  |
| mainnet | Validator | 2      | enode://735b3e39ff23ba0029452422167d5abe08c23cc09488293873da38229a4a5a775420eb5378a46ae7c5c124e43f8cae79cfda9b88bb6fd15ffc6e1d97b6f32320@10.0.9.212:30303  |
| mainnet | Validator | 3      | enode://d42cfc4aefee9424f4891652228239c24907ff9856da24be15382e787c594b66ffdfefeab1da5e6eb96611e84a256ddcedc650f11e540981c1ecc04199beb9dc@10.0.13.255:30303 |
| mainnet | Validator | 4      | enode://15edfb64a9dd271279f32c85c31b6cd94d085a3881dff07cf890fb3e1dfc2cbf79af42272e3928fdc4672a2c9453ba92b6d21c947c83bdd4605692446ea29e3d@10.0.8.161:30303  |
| mainnet | Validator | 5      | enode://14fa6e41ea8dca27633bd2a4aa91040879be5a62ec7cced1f25ffa61970fdbb0d44207ec158fbc03f9345aef867d0337310f4921e2a147a911fab0f9d464bc4b@10.0.9.162:30303  |
| mainnet | Validator | 6      | enode://101b3b6f8b8038db81595530bad10a2bf6023462cdf79efb7ab808c079c6174b3727f7bdb039fa8954ee1698d1bfc31fe0022eb7d17b39076c9bf4c1d60b1108@10.0.14.26:30303  |
| mainnet | Validator | 7      | enode://ce361d33eda71412e0c5f6da080a4fc9687b5cd66dc011776287c49a7994abe4693e82a6969e2d6795d23294c44d61f0ebf1619b691ff9c7d85e4911b59d27c8@10.0.14.84:30303  |
| mainnet | Validator | 8      | enode://f97f261c4e5949cc121ff43b1f99fbbe4230f1eed9b2c672763e3781cbe41cd4dfeffe313a2c1a4d607692352dc236f64e9f8a8124f7addff58dc06e2cd4c535@10.0.13.130:30303 |
| mainnet | Validator | 9      | enode://9a764ab47f6d3b5dbb77aaeaf31fac66d2fbae18509d40311d308d5daa96360ca9680bbcb9c8e759ffddc26d9030e29b7f446344f719f60581acc5406b96f40f@10.0.6.34:30303   |
| mainnet | Validator | 10     | enode://3dfa4fea60da4e1dd0104d3e9a9958400954dc12a9005a0d4ec70f3553779e248b3a3ea2893f3fd079bc57e26d8dc80b02d9e4441e4e5b0daeb819c5ee9f91ce@10.0.14.213:30303 |
| mainnet | Validator | 11     | enode://669e7816d60da2817db859270715e9def30ab4d1c78ff15dc7e04a52eaeccca647fdf90062ea2f86c516ba1fc88a4eaf6b0a7e3b8879ddc1642be32b7ab813d8@10.0.6.169:30303  |
| mainnet | Validator | 12     | enode://abe152203b5c095163337b13c1da4f8def7583c30c05d547f9e7cdf39dc2e63017ad9ac93383e8077f04e184fb562419b695ac3837e73324cdee3abe8d76630b@10.0.8.71:30303   |
| mainnet | Validator | 13     | enode://5974735382f669b01ce55291160da607e14ca1e9b5ca06a3e6d22dfe10f8bbe5363d7def0c8809c7941c33720500a176f2214b0147ba7ba1f0720343c67af200@10.0.2.77:30303   |
| mainnet | Validator | 14     | enode://3d88cac9db163961c47e0f8f3a9431027d14b0a3c4de4b557a3a6089840ce5043e1654cb44242122f88ea0ddb08103b26fb52a68950e41295fdaf873890cdf50@10.0.9.116:30303  |
| mainnet | Validator | 15     | enode://4135ebaa62bc594e6a6a4bf73644ad2a44077c89a92c1e53d25fe23bd17374970bf62c21bf22a7be660c36508c2a701a468ddec6290c3dca44cdbb13d75792f1@10.0.8.79:30303   |
| mainnet | fullnode  | 1      | enode://336f7ef25477d71cf1bd42e350b06553c07f377b9dea95c936321f37d5149de865dba2168226f68946be639744852d3d96d8e9254c915d4a622da91a0ed07849@10.0.10.161:30303 |
| testnet | Validator | 1      | enode://74c64dd94df4946a6d5aa089b866cb12f458a20f65ea09a12c261544b1734bdc9bc604b4f64e19ce294020d00cea0b3f93b9fc040651e689e2188f833dfcc570@10.0.13.166:30303 |
| testnet | Validator | 2      | enode://814c09d8be7a77d2b326291baef40ff693ab90b321ed66d8da0e373a17c7a148d2d8639827cb5f31ceb8ac28788f481f7b9967e50dd1e71c46583c71eaf1acf9@10.0.1.161:30303  |
| testnet | Validator | 3      | enode://8758dfb5eb6b185d55a5a316dee425b224f9185490b1035f180b99f724ed4f2245990eabe49e3817c0376e7d6109adecab1d1e4d0cf05e162e658fb871dbee30@10.0.12.128:30303 |
| testnet | Validator | 4      | enode://f3397088430a7fc422dc5c8e6869c891b12ff78afb7f98eadc39729a4837656f768bede39f54fdfaa5e75eb5fd833a2c5a696df37cf33f5c584c9efd2234b79f@10.0.11.115:30303 |
| testnet | Validator | 5      | enode://10f2dc788d37dc07551e88a40820c9b24f4b5b5442db3b2c61f85c7be6f7395e056f4210b2bb24a77d1ed0b3489581d19bf995632a218c98e18d3baa492b1eaa@10.0.1.26:30303   |
| testnet | fullnode  | 1      | enode://336f7ef25477d71cf1bd42e350b06553c07f377b9dea95c936321f37d5149de865dba2168226f68946be639744852d3d96d8e9254c915d4a622da91a0ed07849@10.0.10.161:30303 |

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
- Access the folder `Config` in this repository and Copy content of script `run-docker.sh` in your server
- Modify the file `run-docker.sh` in your server with env as example below

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
  - Preparing to docker
  ```
  ./add-pkg-server.sh
  ```
  - Run docker
  ```
  ./run-docker.sh
  ```

### 4 - Allow that the validator valid new blocks

- Access all validators
- run command bellow in terminal

```
curl -d '{"jsonrpc":"2.0","method": "clique_propose", "params": ["PUBLIC-ADDRESS-OF-WALLET", true],"id":1}' -H 'Content-Type: application/json' http://localhost:8545
```

- Your will receive the follow message

```
{"jsonrpc":"2.0","id":1,"result":null}
```

### 5 - Update List Enodes

- get enode id of the your new validator or node and update list

curl -d '{"jsonrpc":"2.0","method": "clique_propose", "params": ["0xd181274ab532f795e7250b41d840cb3f922cf5fb", true],"id":1}' -H 'Content-Type: application/json' http://localhost:8545
