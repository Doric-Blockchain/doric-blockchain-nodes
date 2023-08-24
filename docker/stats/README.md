Ethereum Network Stats "Classic"
============
Eth-Netstats "Classic" is a visual interface for tracking ethereum network status. It uses WebSockets to receive stats from running nodes and output them through an Angular interface. It is the front-end implementation for [eth-net-intelligence-api](https://github.com/ethereum/eth-net-intelligence-api).

Other implementations of Eth-Netstats can be found at:  
- [Alethio EthStats](https://github.com/Alethio/ethstats-network-dashboard)
- [Görli EthStats](https://github.com/goerli/ethstats-server/)

![Screenshot](https://raw.githubusercontent.com/ethereum/eth-netstats/master/src/images/screenshot.jpg?v=0.0.6 "Screenshot")

## Prerequisite
* node
* npm

## Installation
Make sure you have node.js and npm installed.

Clone the repository and install the dependencies

```bash
git clone https://github.com/ethereum/eth-netstats
cd eth-netstats
npm install
sudo npm install -g grunt-cli
```

## Build the resources
NetStats features two versions: the full version and the lite version. In order to build the static files you have to run grunt tasks which will generate dist or dist-lite directories containing the js and css files, fonts and images.


To build the full version run
```bash
grunt
```

To build the lite version run
```bash
grunt lite
```

If you want to build both versions run
```bash
grunt all
```

## Run
```bash
npm start
```

see the interface at http://localhost:3000

In order to receive stats from running nodes the web socket password needs to be provided

```bash
WS_SECRET=<secret> npm start
```

where `<secret>` is the value specified in the *app.json* file in the eth-net-intelligence-api directory. Running these tools concurrently with an etherium node will display the node on the eth-netstats interface.

## Receiving Stats From an Ethereum Node

Follow the instructions for [installing and running The Ethereum Network Intelligence API](https://github.com/ethereum/eth-net-intelligence-api). Make sure to edit the `app.json` file with the appropriate information. In particular:

- Confirm the correct configuration for the `RPC_PORT` and `CONFIGURATION_PORT`. The defaults are `"8545"` and `"30303"` respectively.
- `INSTANCE_NAME` is the name your Ethereum node appears as in the front end.
- `WS_SERVER` is the IP address and port (3000 is default).
- As mentioned earlier `WS_SECRET` needs to match the environmental variable provided when running `npm start`.

The Ethereum Network Intelligence API should be run concurrently with the Ethereum client of your choice. More information on running Ethereum node can be found [here](http://www.ethdocs.org/en/latest/ethereum-clients/choosing-a-client.html#sec-clients).
