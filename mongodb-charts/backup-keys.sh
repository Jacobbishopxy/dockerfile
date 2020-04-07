#!/usr/bin/env bash

mkdir /tmp/charts-keys-backup
docker run -it \
    --volume mongodb-charts_keys:/volume \
    --volume /tmp/charts-keys-backup:/backup \
    alpine sh -c 'cp /volume/* /backup'
