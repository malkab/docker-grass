#!/bin/bash

# Install GRASS

cd /usr/local/src/grass

./configure \
    --with-geos=/usr/local/bin/geos-config \
    --with-postgres \
    --with-readline \
    --with-proj-share=/usr/local/share/proj