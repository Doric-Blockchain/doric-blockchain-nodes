#!/usr/bin/env node
const getAwsSecretString = require('../aws/index')

const run = async () =>{
    if(process.env.AWS_ACCESS_KEY_ID){
        const secret = await getAwsSecretString(process.env.WS_SECRET);
        process.env.WS_SECRET = JSON.parse(secret).WS_SECRET;
    }

    var debug = require('debug')('eth-netstats');
    var app = require('../app');
}

run();