#!/usr/bin/env bash
# author: Jacob Bishop

source ../resources/docker.env
docker pull "${FUND_IMAGE}":"${FUND_IMAGE_VERSION}"
docker image tag \
  "${FUND_IMAGE}":"${FUND_IMAGE_VERSION}" "${BASE_IMAGE_NAME}":"${BASE_IMAGE_VERSION}"
