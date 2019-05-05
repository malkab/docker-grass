#!/bin/bash

# Just a Docker launch environment to test the compilation process
# Includes GUI DISPLAY, change as needed

GUI_DISPLAY=192.168.1.186:0

docker run -ti --rm \
    -v `pwd`/../:/ext-src/ \
    -e DISPLAY=$GUI_DISPLAY \
    --entrypoint /bin/bash \
    --workdir /ext-src/ \
    malkab/grass:dangerous_deer
