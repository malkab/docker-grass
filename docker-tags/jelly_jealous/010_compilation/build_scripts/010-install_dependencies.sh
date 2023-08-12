#!/bin/bash

# -------------------
# Compiles and installs GRASS
# -------------------

# # For autoinstalling tzdata
# ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# DEBIAN_FRONTEND=noninteractive

# # Preliminaries
# apt-get update

# # Install debconf-utils
# apt-get install -y debconf-utils

# apt-get install -y \
#     readline-common \
#     locales \
#     tzdata

# ldconfig

# dpkg-reconfigure --frontend noninteractive tzdata locales

# Install dependencies
apt-get -y install \
    libmariadb-dev \
    libbz2-dev \
    libzstd-dev \
    libpng-dev \
    libpnglite-dev \
    libnetcdf-dev \
    apt-file \
    libnetcdf19 \
    libncurses5-dev \
    libglu1-mesa-dev \
    unixodbc-dev \
    libfftw3-dev \
    libblas-dev \
    liblapack-dev \
    libcairo2-dev \
    python3-pip \
    libmariadb-dev-compat

apt-get -y upgrade

#    libxmu-dev \
#    libsdl1.2-dev \
#    fftw-dev \
#    libzstd1 \
#    libsm-dev \
#    libglew-dev \
#    zlib1g-dev \
#    libgsl-dev \
#    libpq-dev \
#    libsqlite3-dev \
#    sqlite3 \
#    libglm-dev \

#     apt-utils \
#     binutils \
#     bison \
#     build-essential \
#     ccache \
#     checkinstall \
#     cmake \
#     curl \
#     default-jdk \
#     ffmpeg \
#     ffmpeg2theora \
#     flex \
#     freeglut3 \
#     freeglut3-dev \
#     g++ \
#     gcc \
#     gettext \
#     ghostscript \
#     git \
#     ipython3 \
#     less \
#     libavcodec-dev \
#     libavformat-dev \
#     libavutil-dev \
#     libboost-program-options-dev \
#     libboost-thread-dev \
#     libcairo2 \
#     libffmpegthumbnailer-dev \
#     libfftw3-3 \
#     libfontconfig1-dev \
#     libfreetype6-dev \
#     libgcc1 \
#     libgstreamer-plugins-base1.0-dev \
#     libgtk-3-dev \
#     libjpeg-dev \
#     libnotify-dev \
#     libreadline-dev \
#     libswscale-dev \
#     libtiff-dev \
#     libtiff5-dev \
#     libwebkit2gtk-4.0-37 \
#     libwebkit2gtk-4.0-dev \
#     libwxbase3.0-dev   \
#     libwxgtk-media3.0-gtk3-0v5 \
#     libwxgtk-media3.0-gtk3-dev \
#     libwxgtk-webview3.0-gtk3-0v5 \
#     libwxgtk-webview3.0-gtk3-dev \
#     libwxgtk3.0-gtk3-0v5 \
#     libwxgtk3.0-gtk3-dev \
#     libwxgtk3.0-gtk3-dev \
#     make \
#     mesa-common-dev \
#     mlocate \
#     python3 \
#     python3-dateutil \
#     python3-dev \
#     python3-numpy \
#     python3-opengl \
#     python3-wxgtk4.0 \
#     scala \
#     subversion \
#     unzip \
#     vim \
#     w3m \
#     wget \
#     wx-common \
#     wx3.0-headers \
#     x11-apps \
#     zstd

ldconfig

# # Install Python packages
# pip3 install --upgrade pip

# pip3 install \
#     geopandas \
#     ipython \
#     jupyter \
#     jupyterlab \
#     matplotlib \
#     nbconvert \
#     numpy \
#     psycopg[binary] \
#     pygments \
#     pyspark \
#     rasterio \
#     scikit-image \
#     scikit-learn \
#     scipy \
#     wxpython

# # Make Python3 default
# ln -s /usr/bin/python3 /usr/bin/python

# Update apt-file
apt-file update

# # Update locate DB
# updatedb
