#!/usr/bin/env bash

source .env
export CHARTS_FIRST_NAME=${CHARTS_FIRST_NAME}
export CHARTS_LAST_NAME=${CHARTS_LAST_NAME}
export CHARTS_EMAIL=${CHARTS_EMAIL}
export CHARTS_PASSWORD=${CHARTS_PASSWORD}
export CHARTS_ROLE=${CHARTS_ROLE}

docker exec -it \
    $(docker container ls --filter name=_charts -q) \
    charts-cli add-user --first-name "CHARTS_FIRST_NAME" --last-name "CHARTS_LAST_NAME" \
    --email "CHARTS_EMAIL" --password "CHARTS_PASSWORD" \
    --role "CHARTS_ROLE"
