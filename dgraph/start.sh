#!/usr/bin/env bash

source .env
#WARNING: if using the latest version on ratel, it would require zero and alpha are also latest versions
#currently manually set the version of alpha and zero to latest:v21.03.0, but if Dgraph releases
#new version in the future there may be a problem using ratel
docker-compose down --remove-orphans
docker-compose up -d
