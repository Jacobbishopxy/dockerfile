#!/usr/bin/env bash
# author: Jacob Bishop

source .env
docker pull ${SPARK_IMAGE}:${SPARK_IMAGE_VERSION}
docker image tag \
  ${SPARK_IMAGE}:${SPARK_IMAGE_VERSION} ${FUND_IMAGE}:${FUND_IMAGE_VERSION}
