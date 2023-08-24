#/bin/bash


# Install jq
apt install jq

# Create Account File
if ! which go > /dev/null; then
    echo "INSTALL Golang"
    add-apt-repository ppa:longsleep/golang-backports -y
    apt update
    apt install golang-go
fi

if ! which make > /dev/null; then
    echo "INSTALL make"
    apt install make
fi

# Clone Ethereum Repository
if ! [ -d "go-ethereum" ]; then
    git clone https://github.com/ethereum/go-ethereum.git
    cd go-ethereum

    if [ $GIT_COMMIT_HASH != "" ]; then
        git checkout ${GIT_COMMIT_HASH}
    fi

    make all
    cd ../
fi

# Create Account File

if ! [ -d "blockchain" ]; then
    echo "CREATE blockchain"
    mkdir blockchain
fi

if ! [ -d "blockchain/utils" ]; then
    echo "CREATE blockchain/util"
    mkdir blockchain/utils
fi

# Create Account File
if ! [ 0 -lt $(ls blockchain/utils/geth* 2>/dev/null | wc -w) ]; then
    echo "COPY GETH"
    cp go-ethereum/build/bin/geth blockchain/utils/geth
fi

# rm -rf go-ethereum

if ! [ -d "blockchain/geth" ]; then
    echo "PASSOU blockchain/geth GENESIS"

    if [ $BLOCKCHAIN_ENVIRONMENT == "MAINNET" ]; then
        cp genesis/mainnet.json blockchain/genesis.json
    else
        cp genesis/testnet.json blockchain/genesis.json
    fi
fi

cd blockchain

# Create Static Nodes JSON
STATIC_NODES_ARRAY=${STATIC_NODES_ARRAY//"["/'["'}
STATIC_NODES_ARRAY=${STATIC_NODES_ARRAY//"]"/'"]'}
STATIC_NODES_ARRAY=${STATIC_NODES_ARRAY//',enode'/'","enode'}

# echo ${STATIC_NODES_ARRAY=} > static-nodes.json

# Create Config File
CONFIG_FILE_CONTENT=$'[Eth]\nSyncMode = "full"\nNetworkId = '"${CHAIN_ID}"$'\n\n[Node]\nDataDir = "./"\nIPCPath = "./geth.ipc"\n\n[Node.P2P]\nNoDiscovery = false\n\nStaticNodes ='

echo "$CONFIG_FILE_CONTENT" "${STATIC_NODES_ARRAY}" > config.toml

# Initialize Node
if ! [ -d "geth" ]; then
    ./utils/geth --datadir ./ init ./genesis.json
fi

NODEIP=$(curl ifconfig.me/ip)

if [ $TYPE_BLOCKCHAIN == "VALIDATOR" ]; then

    # Run Node
    echo ${PASSWORD_NODE} > ./keystore/password.txt

    # Create Account File
    if ! [ 0 -lt $(ls ./keystore/UTC* 2>/dev/null | wc -w) ]; then
        echo ${ACCOUNT_FILE_CONTENT} > ./keystore/UTC--$(date -u '+%Y-%m-%d-T%H-%M-%S.%N')--$(echo $WALLET_ACCOUNT | tr '[:upper:]' '[:lower:]')
    fi

    # Run Validator Node
    ./utils/geth --datadir=./ --config ./config.toml --syncmode 'full' \
    --networkid $CHAIN_ID --nat extip:"$NODEIP" --port "$NODEPORT" \
    --http --http.addr 0.0.0.0 --http.port $NODE_HTTP_PORT --http.api admin,eth,miner,net,txpool,clique,personal,web3 \
    --ws --ws.addr 0.0.0.0 --ws.port $NODE_WS_PORT --ws.origins "" --ws.api "web3, net, eth," \
    --allow-insecure-unlock --unlock $WALLET_ACCOUNT --password ./keystore/password.txt \
    --mine --miner.etherbase $WALLET_ACCOUNT --ethstats "$STATS_NODE_USER:$STATS_NODE_PASSWORD@$STATS_SERVER"
else
    ./utils/geth --datadir=./ --config ./config.toml --syncmode 'full' --networkid $CHAIN_ID --nat extip:"$NODEIP" --port "$NODEPORT" \
    --http --http.addr 0.0.0.0 --http.port $NODE_HTTP_PORT --http.api admin,eth,miner,net,txpool,personal,web3 \
    --ws --ws.addr 0.0.0.0 --ws.port $NODE_WS_PORT --ws.origins "" --ws.api "web3, net, eth" \
    --ethstats "$STATS_NODE_USER:$STATS_NODE_PASSWORD@$STATS_SERVER"
fi