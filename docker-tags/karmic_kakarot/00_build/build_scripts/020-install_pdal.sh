#!/bin/bash

# Install PDAL

cd /usr/local/src/PDAL-$PDAL_VERSION-src/

mkdir build
cd build
cmake -G Ninja ..
ninja
ninja install