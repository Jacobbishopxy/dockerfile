#!/usr/bin/env bash
# author: Jacob Bishop

source ../resources/docker.env
docker build \
    -t ${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION} \
    --build-arg NODE_IMAGE=${NODE_IMAGE} \
    -f ../docker-base/Dockerfile ..

