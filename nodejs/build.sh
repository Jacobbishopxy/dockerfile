#!/usr/bin/env bash
# confirm docker daemon is running and connected
docker version

# build the image based on the Dockerfile and name it
docker build -t xy/nodejs .

# confirm image is present
docker images

# enter container terminal
docker run -it xy/nodejs bash
