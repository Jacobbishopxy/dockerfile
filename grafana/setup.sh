#!/usr/bin/env bash

source ./.env
#mkdir data
#sudo chown -R 472:472 ./data

docker build -t ${IMAGE} .
