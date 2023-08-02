#!/bin/bash

# Set ups GRASS 7 binaries environment
ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

DEBIAN_FRONTEND=noninteractive

apt-get update

# Install debconf-utils
apt-get install -y debconf-utils

apt-get install -y \
  libreadline5 \
  locales \
  tzdata

dpkg-reconfigure --frontend noninteractive tzdata

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

# Copy the keyboard configuration
debconf-set-selections < /keyboard_selections.conf

apt-get install -y \
  apt-utils \
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
  libsdl1.2debian \
  libspatialindex6 \
  python3-gi-cairo \
  vim \
  x11-apps \
  mlocate \
  imagemagick

apt-get -y upgrade

ldconfig

# Clean up
rm -rf /var/lib/apt/lists/*
rm /keyboard_selections.conf

update-locale LANG=$LOCALE

locale-gen

# Clean up
rm -Rf /usr/local/src

ldconfig

# Some ln -s
ln -s /usr/bin/pip3 /usr/bin/pip
ln -s /usr/local/bin/grass78 /usr/local/bin/grass
ln -s /usr/bin/ipython3 /usr/bin/ipython
ln -s /usr/bin/python3 /usr/bin/python

# Install Python packages
pip install \
  numpy \
  virtualenv \
  readline \
  ipython \
  grass-session \
  pyreadline \
  psycopg2 \
  geopandas \
  matplotlib \
  scikit-image \
  rasterio \
  sklearn \
  wxpython \
  scipy \
  psycopg2-binary \
  ipython \
  GeoAlchemy2 \
  wand \
  ipympl \
  pygments==2.4.1 \
  jupyter \
  jupyterlab \
  nbconvert

# Add Node modules
# Install global packages
ENV NPM_REGISTRY "https://registry.npmjs.org"
ENV NODE_PATH "/usr/local/lib/node_modules/:/usr/local/share/.config/yarn/global/node_modules"

npm i -g yarn

yarn global add --registry $NPM_REGISTRY \
  mocha \
  webpack \
  sass \
  webpack-cli \
  typedoc \
  @angular/cli \
  typescript \
  webpack-dev-server \
  http-server \
  json-minify \
  lodash \
  tslab

# Prepare TSLab
tslab install

# Don't know why, but this is needed for Jupyter to work
pip3 install --upgrade nbconvert

# --------
#
# Create users
#
# --------
# Linux
groupadd -g 1000 user1000
useradd -u 1000 -m -d '/home/user1000' -g user1000 user1000
chown -R 1000:1000 /home/user1000

groupadd -g 1001 user1001
useradd -u 1001 -m -d '/home/user1001' -g user1001 user1001
chown -R 1001:1001 /home/user1001

groupadd -g 1002 user1002
useradd -u 1002 -m -d '/home/user1002' -g user1002 user1002
chown -R 1002:1002 /home/user1002

groupadd -g 1003 user1003
useradd -u 1003 -m -d '/home/user1003' -g user1003 user1003
chown -R 1003:1003 /home/user1003

groupadd -g 1004 user1004
useradd -u 1004 -m -d '/home/user1004' -g user1004 user1004
chown -R 1004:1004 /home/user1004

# Mac
useradd -u 500 -m -d '/home/user500' -g 20 user500
chown -R 500:20 /home/user500

useradd -u 501 -m -d '/home/user501' -g 20 user501
chown -R 501:20 /home/user501

useradd -u 502 -m -d '/home/user502' -g 20 user502
chown -R 502:20 /home/user502

useradd -u 503 -m -d '/home/user503' -g 20 user503
chown -R 503:20 /home/user503

useradd -u 504 -m -d '/home/user504' -g 20 user504
chown -R 504:20 /home/user504
