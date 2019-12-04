#!/usr/bin/env bash

docker-compose down
docker-compose -f docker-compose.yml -p grafana up -d
