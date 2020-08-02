#!/bin/bash

# -------------------
# Compiles and installs GRASS 
# -------------------

# Generate locale
locale-gen $LOCALE

# Preliminaries
apt-get update

apt-get -y install \
  apt-utils \
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
  binutils \
  cmake \
  libglew-dev \
  g++ \
  mesa-common-dev \
  libglm-dev \
  fftw-dev \
  libblas-dev \
  libbz2-dev \
  liblapack-dev \
  libblas-dev \
  libreadline-dev \
  libwxgtk-media3.0-gtk3-0v5 \
  libwxgtk-media3.0-gtk3-dev \
  libwxgtk-webview3.0-gtk3-0v5 \
  libwxgtk-webview3.0-gtk3-dev \
  libwxgtk3.0-gtk3-0v5 \
  libwxgtk3.0-gtk3-dev \
  libgtk-3-dev \
  libjpeg-dev \
  libtiff-dev \
  libsdl1.2-dev \
  libgstreamer-plugins-base1.0-dev \
  libnotify-dev \
  freeglut3 \
  freeglut3-dev \
  libsm-dev \
  libwebkit2gtk-4.0-37 \
  libwebkit2gtk-4.0-dev \
  python3-pip \
  ipython3 \
  zstd \
  libzstd1 \
  libzstd-dev \
  libnetcdf-dev \
  libnetcdf15
  
# Install Python packages
pip3 install \
  numpy \
  psycopg2 \
  geopandas \
  matplotlib \
  scikit-image \
  rasterio \
  sklearn \
  wxpython \
  scipy


# Install the Python GDAL scripts
cd /usr/local/src/gdal/gdal-${GDAL_VERSION}/swig/python
python setup.py install

apt-file update


# Compile GRASS
cd /usr/local/src/grass-${GRASS_VERSION}

./configure \
  --with-freetype-includes=/usr/include/freetype2 \
  --with-cxx \
  --enable-shared \
  --with-gdal \
  --with-blas \
  --with-bzlib \
  --with-fftw \
  --with-sqlite \
  --with-regex \
  --with-glw \
  --with-opengl \
  --with-zlib \
  --enable-64bit \
  --with-python \
  --with-jpeg \
  --with-tiff \
  --with-png \
  --with-geos \
  --with-lapack \
  --with-netcdf \
  --with-odbc \
  --with-openmp \
  --with-readline \
  --with-postgres \
  --with-wxwidgets \
  --with-cairo \
  --with-x
    
make

make install

ldconfig

cd ../..

update-locale LANG=$LOCALE


# Recompilation of GDAL
cd src/gdal/gdal-${GDAL_VERSION}

make clean

./configure \
  --with-grass=/usr/local/grass${GRASS_INSTALL_FOLDER_SUFFIX}

make

make install

ldconfig

# Install the Python GDAL scripts
cd /usr/local/src/gdal/gdal-${GDAL_VERSION}/swig/python
python setup.py install

# Some ln -s
ln -s /usr/bin/pip3 /usr/bin/pip
ln -s /usr/local/bin/grass78 /usr/local/bin/grass
ln -s /usr/bin/ipython3 /usr/bin/ipython
