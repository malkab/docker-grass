#!/bin/bash

# Set ups GRASS 7 binaries environment

apt-get update

apt-get install -y \
    python \
    curl \
    python-pip \
    locales \
    w3m \
    libjson-c3 \
    libfreexl1 \
    libqhull7 \
    libwebp6 \
    libodbc1 \
    libodbcinstq4-1 \
    libkmlbase1 \
    libkmldom1 \
    libkmlengine1 \
    libxerces-c3.2 \
    libopenjp2-7 \
    libnetcdf13 \
    libhdf4-0-alt \
    libogdi3.2 \
    libgif7 \
    libgeotiff2 \
    python-wxgtk3.0

locale-gen $LOCALE

pip install numpy
