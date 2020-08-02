#!/bin/bash

# Just a Docker launch environment to test the compilation process

docker run -ti --rm \
    -v `pwd`/../:/ext-src/ \
    --entrypoint /bin/bash \
    --workdir /ext-src/ \
    malkab/grass_compilation:dangerous_deer
