# Author: Jacob Bishop

ARG     BASE_IMAGE_NAME
ARG     BASE_IMAGE_VERSION

# base
FROM    $BASE_IMAGE_NAME:$BASE_IMAGE_VERSION

COPY    ./target target
VOLUME  /data/logs
WORKDIR /data
