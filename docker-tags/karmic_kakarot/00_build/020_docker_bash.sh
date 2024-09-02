#!/bin/bash

# Use this container to test and debug compilation scripts

# Load env variables
. ../env.sh

docker run -ti --rm \
    --name grass_${DOCKER_IMAGE_TAG}_test \
    --hostname grass_${DOCKER_IMAGE_TAG}_test \
    -v $(pwd):/source \
    --workdir /source \
    malkab/grass_build:${DOCKER_IMAGE_TAG}
