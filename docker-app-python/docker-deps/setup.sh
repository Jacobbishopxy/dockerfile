#!/usr/bin/env bash
# author: Jacob Bishop

source ../resources/docker.env
docker build \
    -t ${DEPS_IMAGE_NAME}:${DEPS_IMAGE_VERSION} \
    --build-arg BASE_IMAGE_NAME=${BASE_IMAGE_NAME} \
    --build-arg BASE_IMAGE_VERSION=${BASE_IMAGE_VERSION} \
    -f ../docker-app/Dockerfile ..

