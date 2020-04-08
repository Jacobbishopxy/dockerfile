#!/usr/bin/env bash

source .env
export USERNAME=${USERNAME}
export PASSWORD=${PASSWORD}
export MONGOURL=${MONGOURL}
echo "mongodb://${USERNAME}:${PASSWORD}@${MONGOURL}"

docker run --rm quay.io/mongodb/charts:19.12.1 charts-cli test-connection \
    "mongodb://${USERNAME}:${PASSWORD}@${MONGOURL}"
