#/bin/bash

# Install jq
apt install jq -y

# Install Go version 1.20
tar -C /usr/local -xzf ./utils/go1.20.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install Make
if ! which make > /dev/null; then
    echo "INSTALL make"
    apt install make -y
fi

# Create Blockchain Directory
if ! [ -d "blockchain" ]; then
    echo "CREATE blockchain"
    mkdir blockchain
fi

# Copy Genesis File
if ! [ -d "blockchain/geth" ]; then
    echo "COPY GENESIS"
    if [ $BLOCKCHAIN_ENVIRONMENT == "MAINNET" ]; then
        cp genesis/mainnet.json blockchain/genesis.json
    else
        cp genesis/testnet.json blockchain/genesis.json
    fi
fi

# Create Config File
CONFIG_FILE_CONTENT=$(printf "[Eth]\nSyncMode = '%s'\n\nNetworkId = %s\n\n\n[Node]\nDataDir = \"./\"\nIPCPath = \"./geth.ipc\"\n\n[Node.P2P]\nNoDiscovery = false\n\nStaticNodes = "%s"\n" "$SYNC_MODE" "$CHAIN_ID" "$STATIC_NODES_ARRAY")
echo "$CONFIG_FILE_CONTENT" > ./blockchain/config.toml

# Initialize Node
if ! [ -d "geth" ]; then
    ./utils/geth1.14.9 --datadir ./blockchain/init ./blockchain/genesis.json
fi

# Set Node IP and Sync Mode
NODEIP=$(curl ifconfig.me/ip)
SYNC_MODE_ARGS="--syncmode $SYNC_MODE" # "snap", "full" or "light"

# Set SYNC_GCMODE to "archive" for block explorers/indexing data
if [ $SYNC_GCMODE != "" ]; then
    SYNC_MODE_ARGS="$SYNC_MODE_ARGS --gcmode $SYNC_GCMODE"
fi

if [ $IS_VALIDATOR_NODE == "true" ]; then
    # Configure Validator Node Account

    # Add Account Password
    echo ${PASSWORD_NODE} > ./blockchain/keystore/password.txt

    # Create Account File
    if ! [ 0 -lt $(ls ./blockchain/keystore/UTC* 2>/dev/null | wc -w) ]; then
        echo ${ACCOUNT_FILE_CONTENT} > ./blockchain/keystore/UTC--$(date -u '+%Y-%m-%d-T%H-%M-%S.%N')--$(echo $WALLET_ACCOUNT | tr '[:upper:]' '[:lower:]')
    fi

    # Run Validator Node
    ./utils/geth1.14.9 --datadir=./ --config ./blockchain/config.toml $SYNC_MODE_ARGS \
    --networkid $CHAIN_ID --nat extip:"$NODEIP" --port "$NODE_PORT" \
    --http --http.addr 0.0.0.0 --http.port $NODE_HTTP_PORT --http.api admin,eth,miner,net,txpool,clique,personal,web3,debug \
    --ws --ws.addr 0.0.0.0 --ws.port $NODE_WS_PORT --ws.origins "" --ws.api "web3, net, eth," \
    --allow-insecure-unlock --unlock $WALLET_ACCOUNT --password ./blockchain/keystore/password.txt \
    --mine --miner.etherbase $WALLET_ACCOUNT
else
    # Run Node without validator account
    ./utils/geth1.14.9 --datadir=./ --config ./blockchain/config.toml $SYNC_MODE_ARGS --networkid $CHAIN_ID --nat extip:"$NODEIP" --port "$NODE_PORT" \
    --http --http.addr 0.0.0.0 --http.port $NODE_HTTP_PORT --http.api admin,eth,miner,net,txpool,personal,web3,debug \
    --ws --ws.addr 0.0.0.0 --ws.port $NODE_WS_PORT --ws.origins "" --ws.api "web3, net, eth"
fi