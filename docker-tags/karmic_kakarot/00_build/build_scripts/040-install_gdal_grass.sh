#!/bin/bash

# Compilation of GDAL GRASS plugin

cd /usr/local/src/gdal-grass-$GDAL_GRASS_VERSION

echo
echo -----------------------------------------------------------------
echo
echo Configure
echo
echo -----------------------------------------------------------------
echo

./configure --with-grass=/usr/local/grass84

echo
echo -----------------------------------------------------------------
echo
echo Build
echo
echo -----------------------------------------------------------------
echo

make

echo
echo -----------------------------------------------------------------
echo
echo Install
echo
echo -----------------------------------------------------------------
echo

make install

ldconfig
