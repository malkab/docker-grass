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

dpkg-reconfigure --frontend noninteractive tzdata locales

# Install dependencies
apt-get -y install \
    apt-file \
    apt-utils \
    binutils \
    bison \
    build-essential \
    ccache \
    checkinstall \
    cmake \
    curl \
    default-jdk \
    ffmpeg \
    ffmpeg2theora \
    fftw-dev \
    flex \
    freeglut3 \
    freeglut3-dev \
    g++ \
    gcc \
    gettext \
    ghostscript \
    git \
    ipython3 \
    less \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libblas-dev \
    libboost-program-options-dev \
    libboost-thread-dev \
    libbz2-dev \
    libcairo2 \
    libcairo2-dev \
    libffmpegthumbnailer-dev \
    libfftw3-3 \
    libfftw3-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libgcc1 \
    libglew-dev \
    libglm-dev \
    libglu1-mesa-dev \
    libgsl-dev \
    libgstreamer-plugins-base1.0-dev \
    libgtk-3-dev \
    libjpeg-dev \
    liblapack-dev \
    libmariadb-dev \
    libmariadb-dev-compat \
    libncurses5-dev \
    libnetcdf-dev \
    libnetcdf19 \
    libnotify-dev \
    libpng-dev \
    libpnglite-dev \
    libpq-dev \
    libreadline-dev \
    libsdl1.2-dev \
    libsm-dev \
    libsqlite3-dev \
    libswscale-dev \
    libtiff-dev \
    libtiff5-dev \
    libwebkit2gtk-4.0-37 \
    libwebkit2gtk-4.0-dev \
    libwxbase3.0-dev   \
    libwxgtk-media3.0-gtk3-0v5 \
    libwxgtk-media3.0-gtk3-dev \
    libwxgtk-webview3.0-gtk3-0v5 \
    libwxgtk-webview3.0-gtk3-dev \
    libwxgtk3.0-gtk3-0v5 \
    libwxgtk3.0-gtk3-dev \
    libwxgtk3.0-gtk3-dev \
    libxmu-dev \
    libzstd-dev \
    libzstd1 \
    make \
    mesa-common-dev \
    mlocate \
    python3 \
    python3-dateutil \
    python3-dev \
    python3-numpy \
    python3-opengl \
    python3-pip \
    python3-wxgtk4.0 \
    scala \
    sqlite3 \
    subversion \
    unixodbc-dev \
    unzip \
    vim \
    w3m \
    wget \
    wx-common \
    wx3.0-headers \
    x11-apps \
    zlib1g-dev \
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
