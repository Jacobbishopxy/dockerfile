#!/usr/bin/env bash

source .env
export USERNAME=${USERNAME}
export PASSWORD=${PASSWORD}
export MONGOURL=${MONGOURL}
echo "mongodb://${USERNAME}:${PASSWORD}@${MONGOURL}" | docker secret create charts-mongodb-uri -

docker stack deploy -c charts-docker-swarm-19.12.1.yml mongodb-charts
