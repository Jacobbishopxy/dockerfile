# Author: Jacob Bishop

ARG     BASE_IMAGE_NAME
ARG     BASE_IMAGE_VERSION

# base
FROM    $BASE_IMAGE_NAME:$BASE_IMAGE_VERSION

# copy source code to workdir
COPY    . /app

# change the active directory
WORKDIR /app

# build app
RUN     yarn build

