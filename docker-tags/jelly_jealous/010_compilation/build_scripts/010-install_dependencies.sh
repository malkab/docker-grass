#!/bin/bash

# -------------------
# Compiles and installs GRASS
# -------------------

# For autoinstalling tzdata
ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

DEBIAN_FRONTEND=noninteractive

# Preliminaries
apt-get update

# Install debconf-utils
apt-get install -y debconf-utils

apt-get install -y \
  readline-common \
  locales \
  tzdata

dpkg-reconfigure --frontend noninteractive tzdata

# Install dependencies
apt-get -y install \
  apt-file \
  apt-utils \
  binutils \
  bison \
  build-essential \
  cmake \
  curl \
  default-jdk \
  fftw-dev \
  flex \
  freeglut3 \
  freeglut3-dev \
  g++ \
  git \
  ipython3 \
  less \
  libblas-dev \
  libbz2-dev \
  libcairo2-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libglew-dev \
  libglm-dev \
  libgstreamer-plugins-base1.0-dev \
  libgtk-3-dev \
  libjpeg-dev \
  liblapack-dev \
  libnetcdf-dev \
  libnetcdf19 \
  libnotify-dev \
  libpng-dev \
  libreadline-dev \
  libsdl1.2-dev \
  libsm-dev \
  libsqlite3-dev \
  libtiff-dev \
  libtiff5-dev \
  libwebkit2gtk-4.0-37 \
  libwebkit2gtk-4.0-dev \
  libwxgtk-media3.0-gtk3-0v5 \
  libwxgtk-media3.0-gtk3-dev \
  libwxgtk-webview3.0-gtk3-0v5 \
  libwxgtk-webview3.0-gtk3-dev \
  libwxgtk3.0-gtk3-0v5 \
  libwxgtk3.0-gtk3-dev \
  libzstd-dev \
  libzstd1 \
  mesa-common-dev \
  mlocate \
  python3-pip \
  scala \
  unixodbc-dev \
  unzip \
  vim \
  w3m \
  x11-apps \
  zstd

ldconfig

# Install Python packages
pip3 install --upgrade pip

pip3 install \
  geopandas \
  jupyter \
  jupyterlab \
  matplotlib \
  nbconvert \
  numpy \
  psycopg[binary] \
  pygments \
  pyspark \
  rasterio \
  scikit-image \
  scipy \
  scikit-learn \
  wxpython

# Make Python3 default
ln -s /usr/bin/python3 /usr/bin/python

# Update apt-file
apt-file update

# Update locate DB
updatedb
