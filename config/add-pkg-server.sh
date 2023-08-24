#/bin/bash

sudo apt update -y && sudo apt upgrade -y

#Install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y

##Install Docker compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version

git clone git@github.com:Doric-Blockchain/doric-blockchain-nodes.git

cd doric-blockchain-nodes

ACCOUNT_FILE_CONTENT='export ACCOUNT_FILE_CONTENT=[WALLET-CONTENT]'

echo '
export STATIC_NODES_ARRAY="[ENODES]"
export CHAIN_ID="CHAIN_ID"
export NODEPORT="30303"
export TYPE_BLOCKCHAIN="TYPE"
export NODE_HTTP_PORT="8545"
export NODE_WS_PORT="8546"
export BLOCKCHAIN_ENVIRONMENT="NETWORK"
export WALLET_ACCOUNT="WALLET_ACCOUNT"
export PASSWORD_NODE="PASSWORD_WALLET_ACCOUNT"
export GIT_COMMIT_HASH="df52967ff6080a27243569020ff64cd956fb8362"
export STATS_SERVER="STATS"
export STATS_NODE_USER="YOUR_NAME_NODE"
export STATS_NODE_PASSWORD="pzJx&n2rOtO#B29"' > ./.env

echo ${ACCOUNT_FILE_CONTENT} >> .env

sudo docker compose up -d
