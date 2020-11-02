#!/usr/bin/env bash
# author: Jacob Bishop

source ../resources/docker.env
docker build \
    -t "${APP_IMAGE_NAME}":"${APP_IMAGE_VERSION}" \
    --build-arg DEPS_IMAGE_NAME="${DEPS_IMAGE_NAME}" \
    --build-arg DEPS_IMAGE_VERSION="${DEPS_IMAGE_VERSION}" \
    -f ../docker-app/Dockerfile ..

