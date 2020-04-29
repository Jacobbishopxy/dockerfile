#!/usr/bin/env bash

docker run --publish 2003:5050 \
    --volume=pga4volume:/var/lib/pgadmin \
    --env-file=pgadmin-env.list \
    --name=pga4 \
    --hostname=pga4 \
    --network=prod \
    --detach \
    crunchydata/crunchy-pgadmin4:centos7-10.9-2.4.1
