#!/bin/bash

# Load env variables
. ../env.sh

# -----------------------------------------------------------------
#
# Run a container with X server access for graphical GRASS.
#
# -----------------------------------------------------------------
xhost +local:docker

docker run -ti --rm \
    --name grass_production_test \
    --user 1000:1000 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd):/source \
    malkab/grass:${DOCKER_IMAGE_TAG}
