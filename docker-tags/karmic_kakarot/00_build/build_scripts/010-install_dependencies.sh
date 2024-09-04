#!/bin/bash

# Update and apt-get basic packages

echo
echo ---------------------------------------
echo
echo Installing packages
echo
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
    fftw2 \
    python3-wxgtk4.0 \
    libcairo2 \
    libcairo2-dev

dpkg-reconfigure --frontend noninteractive tzdata

ldconfig
