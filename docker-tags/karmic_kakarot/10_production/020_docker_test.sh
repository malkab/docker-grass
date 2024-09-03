#!/bin/bash

# Load env variables
. ../env.sh

# -----------------------------------------------------------------
#
# Starts a PG container
#
# -----------------------------------------------------------------
docker run -ti --rm \
    --name grass_production_test \
    --network=host \
    --user 1000:1000 \
    -e DISPLAY=$DISPLAY \
    -v $(pwd):/source \
    malkab/grass:${DOCKER_IMAGE_TAG}
