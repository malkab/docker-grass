#!/bin/bash

# Just a Docker launch environment to test the compilation process

docker run -ti --rm \
    -v `pwd`/../:/ext-src/ \
    --entrypoint /bin/bash \
    --workdir /ext-src/ \
    malkab/grass:dangerous_deer
