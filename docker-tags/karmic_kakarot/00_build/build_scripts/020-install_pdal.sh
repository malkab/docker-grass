#!/bin/bash

# Install PDAL

cd /usr/local/src/PDAL-$PDAL_VERSION-src/

echo
echo -----------------------------------------------------------------
echo
echo Configure
echo
echo -----------------------------------------------------------------
echo

rm -Rf build
mkdir build
cd build

cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    ..

echo
echo -----------------------------------------------------------------
echo
echo Build
echo
echo -----------------------------------------------------------------
echo

ninja

echo
echo -----------------------------------------------------------------
echo
echo Install
echo
echo -----------------------------------------------------------------
echo

ninja install