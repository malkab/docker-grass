#!/bin/bash

# Compile GRASS
cd /usr/local/src/grass-$GRASS_VERSION

./configure \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-includes=/usr/include/mariadb \
    --with-cxx \
    --enable-shared \
    --enable-largefile \
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
    --with-x \
    --with-mysql \
    --without-pdal

make

make install

ldconfig

# Install of GDAL GRASS plugin
cd /usr/local/src/gdal-grass-${GDAL_GRASS_PLUGIN_VERSION}

./configure \
    --with-gdal=/usr/local/bin/gdal-config \
    --with-grass=/usr/local/grass${GRASS_INSTALL_FOLDER_SUFFIX}

make

make install

ldconfig

# Some ln -s
ln -s /usr/bin/ipython3 /usr/bin/ipython
