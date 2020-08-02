#!/bin/bash

docker run -ti --rm \
    -v `pwd`/:/ext-out/ \
    malkab/grass_compilation:dangerous_deer