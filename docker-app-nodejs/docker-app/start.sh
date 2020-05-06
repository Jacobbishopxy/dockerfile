#!/usr/bin/env bash
# author: Jacob Bishop

source ../resources/docker.env
export APP_IMAGE_NAME=${APP_IMAGE_NAME}
export APP_IMAGE_VERSION=${APP_IMAGE_VERSION}
export CONTAINER_NAME=${CONTAINER_NAME}
export APP_PORT=${APP_PORT}
docker-compose down
docker-compose up -d
