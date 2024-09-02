#!/bin/bash

# Update and apt-get basic packages

echo
echo ---------------------------------------
echo Installing packages
echo ---------------------------------------
echo

# For autoinstalling tzdata
ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

DEBIAN_FRONTEND=noninteractive

apt-get install -y \
    ninja-build \
    python3-opengl \
    libopengl0 \
    libopengl-dev \
    fftw-dev \
    fftw2


apt-get install -y \
    libcairo2 \
    libcairo2-dev

    # bzip2 \
    # libzstd-dev \
    # libzstd1 \
    # fftw-dev \
    # fftw2 \
    # liblapack3 \
    # liblapacke-dev \
    # libblas-dev \
    # libblas3

dpkg-reconfigure --frontend noninteractive tzdata

ldconfig
