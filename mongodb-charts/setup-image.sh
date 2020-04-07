#!/usr/bin/env bash

docker swarm init
docker pull quay.io/mongodb/charts:19.12.1
docker pull alpine
