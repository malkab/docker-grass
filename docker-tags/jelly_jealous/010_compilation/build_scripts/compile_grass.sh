# # Install the Python GDAL scripts
# cd /usr/local/src/gdal-${GDAL_VERSION}/swig/python
# python setup.py install

# Compile GRASS
cd /usr/local/src/grass-$GRASS_VERSION

# In 22.04, there is
# ./configure \
#     --with-freetype-includes=/usr/include/freetype2 \
#     --with-includes=/usr/include/mariadb \
#     --with-cxx \
#     --enable-shared \
#     --enable-largefile \
#     --with-gdal \
#     --with-blas \
#     --with-bzlib \
#     --with-fftw \
#     --with-sqlite \
#     --with-regex \
#     --with-glw \
#     --with-opengl \
#     --with-zlib \
#     --enable-64bit \
#     --with-python \
#     --with-jpeg \
#     --with-tiff \
#     --with-png \
#     --with-geos \
#     --with-lapack \
#     --with-netcdf \
#     --with-odbc \
#     --with-openmp \
#     --with-readline \
#     --with-postgres \
#     --with-wxwidgets \
#     --with-cairo \
#     --with-x \
#     --with-mysql \
#     --without-pdal

make

# make install

# ldconfig

# cd ../..

# update-locale LANG=$LOCALE

# # Recompilation of GDAL
# cd src/gdal/gdal-${GDAL_VERSION}

# make clean

# ./configure \
#   --with-grass=/usr/local/grass${GRASS_INSTALL_FOLDER_SUFFIX}

# make

# make install

# ldconfig

# # Install the Python GDAL scripts
# cd /usr/local/src/gdal/gdal-${GDAL_VERSION}/swig/python
# python setup.py install

# # Some ln -s
# ln -s /usr/bin/pip3 /usr/bin/pip
# ln -s /usr/local/bin/grass78 /usr/local/bin/grass
# ln -s /usr/bin/ipython3 /usr/bin/ipython

# # Add Node resources
# cp -r /node/node-v${NODE_VERSION}-linux-x64/bin /usr/local
# cp -r /node/node-v${NODE_VERSION}-linux-x64/include /usr/local
# cp -r /node/node-v${NODE_VERSION}-linux-x64/lib /usr/local
# cp -r /node/node-v${NODE_VERSION}-linux-x64/share /usr/local

# # Add Node modules
# # Install global packages
# ENV NPM_REGISTRY "https://registry.npmjs.org"
# ENV NODE_PATH "/usr/local/lib/node_modules/:/usr/local/share/.config/yarn/global/node_modules"

# npm i -g yarn

# yarn global add --registry $NPM_REGISTRY \
#   mocha \
#   webpack \
#   sass \
#   webpack-cli \
#   typedoc \
#   typescript \
#   webpack-dev-server \
#   http-server \
#   json-minify \
#   lodash \
#   tslab

# # Prepare TSLab
# tslab install

# # Don't know why, but this is needed for Jupyter to work
# pip3 install --upgrade nbconvert

# # --------
# #
# # Create users
# #
# # --------
# # Linux
# groupadd -g 1000 user1000
# useradd -u 1000 -m -d '/home/user1000' -g user1000 user1000
# chown -R 1000:1000 /home/user1000

# groupadd -g 1001 user1001
# useradd -u 1001 -m -d '/home/user1001' -g user1001 user1001
# chown -R 1001:1001 /home/user1001

# groupadd -g 1002 user1002
# useradd -u 1002 -m -d '/home/user1002' -g user1002 user1002
# chown -R 1002:1002 /home/user1002

# groupadd -g 1003 user1003
# useradd -u 1003 -m -d '/home/user1003' -g user1003 user1003
# chown -R 1003:1003 /home/user1003

# groupadd -g 1004 user1004
# useradd -u 1004 -m -d '/home/user1004' -g user1004 user1004
# chown -R 1004:1004 /home/user1004

# # Mac
# useradd -u 500 -m -d '/home/user500' -g 20 user500
# chown -R 500:20 /home/user500

# useradd -u 501 -m -d '/home/user501' -g 20 user501
# chown -R 501:20 /home/user501

# useradd -u 502 -m -d '/home/user502' -g 20 user502
# chown -R 502:20 /home/user502

# useradd -u 503 -m -d '/home/user503' -g 20 user503
# chown -R 503:20 /home/user503

# useradd -u 504 -m -d '/home/user504' -g 20 user504
# chown -R 504:20 /home/user504

# # Update apt-file
# apt-file update

# # Update locate DB
# updatedb
