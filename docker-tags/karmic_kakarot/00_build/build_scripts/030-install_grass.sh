#!/bin/bash

# Install GRASS

cd /usr/local/src/grass

echo
echo -----------------------------------------------------------------
echo
echo Configure
echo
echo -----------------------------------------------------------------
echo

CFLAGS="-O2 -Wall" ./configure \
    --with-geos=/usr/local/bin/geos-config \
    --with-postgres \
    --with-readline \
    --with-proj-share=/usr/local/share/proj

echo
echo -----------------------------------------------------------------
echo
echo Build
echo
echo -----------------------------------------------------------------
echo

CFLAGS="-O2 -Wall" make

echo
echo -----------------------------------------------------------------
echo
echo Install
echo
echo -----------------------------------------------------------------
echo

make install