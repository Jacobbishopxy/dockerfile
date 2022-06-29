#!/usr/bin/env bash
# author: Jacob Bishop

docker build \
    -t xy/nginx:0.0.0 \
    -f ./Dockerfile .

