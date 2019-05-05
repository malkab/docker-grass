#!/bin/bash

# -------------------
# Compiles and installs GRASS 
# -------------------

# Generate locale
locale-gen $LOCALE

# Preliminaries
apt-get update

apt-get -y install \
    build-essential \
    unzip \
    curl \
    apt-file \
    libcairo2-dev \
    less \
    w3m \
    vim \
    flex \
    bison \
    mlocate \
    libsqlite3-dev \
    libtiff5-dev \
    libpng-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    unixodbc-dev \
    freeglut3 \
    freeglut3-dev \
    binutils-gold \
    cmake \
    libglew-dev \
    g++ \
    mesa-common-dev \
    libglew1.5-dev \
    libglm-dev \
    fftw-dev \
    libblas-dev \
    libbz2-dev \
    liblapack-dev \
    liblas-c-dev \
    libreadline-dev \
    libwxgtk3.0-0v5 \
    libwxgtk3.0-dev \
    python2.7 \
    libpython2.7 \
	libpython-dev \
	libpython-all-dev \
    python-pip \
    ipython \
    libgtk-3-dev \
	libjpeg-dev \
    libtiff-dev \
	libsdl1.2-dev \
    libgstreamer-plugins-base1.0-dev \
    libnotify-dev \
    freeglut3 \
    freeglut3-dev \
    libsm-dev \
	libwebkitgtk-3.0-0 \
    libwebkitgtk-3.0-dev

apt-file update


# Compile GRASS
cd src/grass-${GRASS_VERSION}

./configure \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-cxx \
	--enable-shared \
    --with-blas \
    --with-bzlib \
	--with-fftw \
	--with-sqlite \
	--with-regex \
	--with-glw \
	--with-opengl \
	--with-zlib \
	--enable-64bit \
	--with-python=python2.7-config \
    --with-jpeg \
    --with-tiff \
	--with-png \
    --with-geos \
    --with-lapack \
    --with-liblas=/usr/bin/liblas-config \
    --with-netcdf \
    --with-odbc \
    --with-openmp \
    --with-readline \
    --with-postgres
    
make

make install

ldconfig

cd ../..

update-locale LANG=$LOCALE


# Recompilation of GDAL
cd src/gdal/gdal-${GDAL_VERSION}

make clean

./configure \
    --with-grass=/usr/local/grass-${GRASS_VERSION}

make

make install

cd ../../..

/bin/cp -fr src/gdal-patch/data/epsg.wkt /usr/local/share/gdal

/bin/cp -fr src/gdal-patch/data/gcs.csv /usr/local/share/gdal

chmod 644 /usr/local/share/gdal/*

ldconfig
