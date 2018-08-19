#!/bin/bash

# Just a Docker launch environment to test the compilation
# Includes GUI DISPLAY, change as needed

GUI_DISPLAY=192.168.1.186:0

docker run -ti --rm \
    -v `pwd`/:/ext-src/ \
    --entrypoint /bin/bash \
    -e DISPLAY=$GUI_DISPLAY \
    malkab/grass_compilation:dangerous_deer

