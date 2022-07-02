#!/usr/bin/env bash
# author: Jacob Bishop

source .env
export COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME}
export SPARK_MASTER_URL=${SPARK_MASTER_URL}
export SPARK_WORKER_MEMORY=${SPARK_WORKER_MEMORY}
export SPARK_WORKER_CORES=${SPARK_WORKER_CORES}
docker-compose -f worker.yml down
docker-compose -f worker.yml up -d
