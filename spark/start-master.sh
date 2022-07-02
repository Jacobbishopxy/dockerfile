#!/usr/bin/env bash
# author: Jacob Bishop

source .env
export COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME}
export WORKER_NUM=${WORKER_NUM}
docker-compose -f master.yml down
docker-compose -f master.yml up --scale spark-worker=${WORKER_NUM} -d
