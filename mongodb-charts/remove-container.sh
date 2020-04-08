#!/usr/bin/env bash

docker stack rm mongodb-charts
docker secret rm charts-mongodb-uri
