#!/bin/bash

# Use this container to test and debug compilation scripts

# Load env variables
. ../env.sh

docker run -ti --rm \
    --name grass_build_test \
    --hostname grass_build_test \
    --network=host \
    -e DISPLAY=$DISPLAY \
    -v $(pwd):/source \
    malkab/grass_build:${DOCKER_IMAGE_TAG}
