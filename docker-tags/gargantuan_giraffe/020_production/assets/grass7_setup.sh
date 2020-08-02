#!/bin/bash

# Set ups GRASS 7 binaries environment
ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

DEBIAN_FRONTEND=noninteractive

apt-get update

# Install debconf-utils
apt-get install -y debconf-utils

# Copy the keyboard configuration
debconf-set-selections < /keyboard_selections.conf

apt-get install -y \
  apt-utils \
  locales \
  python3 \
  python3-pip \
  ipython3 \
  libjson-c4 \
  libodbc1 \
  odbcinst \
  libnetcdf15 \
  libjpeg8 \
  libtiff5 \
  libpng16-16 \
  libcurl4 \
  less \
  libxml2 \
  curl \
  w3m \
  libgtk-3-0 \
  libsm6 \
  libnotify4 \
  libsdl1.2debian

dpkg-reconfigure --frontend noninteractive tzdata

apt-get -y upgrade

ldconfig

# Clean up
rm -rf /var/lib/apt/lists/*
rm /keyboard_selections.conf

# Install Python packages
pip3 install \
  numpy \
  grass-session \
  psycopg2 \
  geopandas \
  matplotlib \
  scikit-image \
  rasterio \
  sklearn \
  wxpython \
  scipy

# Locales
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# en_US.ISO-8859-15 ISO-8859-15/en_US.ISO-8859-15 ISO-8859-15/' /etc/locale.gen
sed -i -e 's/# en_GB ISO-8859-1/en_GB ISO-8859-1/' /etc/locale.gen
sed -i -e 's/# en_GB.ISO-8859-15 ISO-8859-15/en_GB.ISO-8859-15 ISO-8859-15/' /etc/locale.gen
sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# es_ES ISO-8859-1/es_ES ISO-8859-1/' /etc/locale.gen
sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# es_ES@euro ISO-8859-15/es_ES@euro ISO-8859-15/' /etc/locale.gen
sed -i -e 's/# de_DE ISO-8859-1/de_DE ISO-8859-1/' /etc/locale.gen
sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# de_DE@euro ISO-8859-15/de_DE@euro ISO-8859-15/' /etc/locale.gen
sed -i -e 's/# fr_FR ISO-8859-1/fr_FR ISO-8859-1/' /etc/locale.gen
sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# fr_FR@euro ISO-8859-15/fr_FR@euro ISO-8859-15/' /etc/locale.gen
sed -i -e 's/# it_IT ISO-8859-1/it_IT ISO-8859-1/' /etc/locale.gen
sed -i -e 's/# it_IT.UTF-8 UTF-8/it_IT.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# it_IT@euro ISO-8859-15/it_IT@euro ISO-8859-15/' /etc/locale.gen

locale-gen

# Clean up
rm -Rf /usr/local/src

ldconfig

# Some ln -s
ln -s /usr/bin/pip3 /usr/bin/pip
ln -s /usr/bin/ipython3 /usr/bin/ipython
