FROM malkab/postgis_compilation:holistic_hornet

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

# Build args
ARG GRASS_VERSION
ARG GDAL_VERSION
ARG NODE_VERSION
ARG GRASS_INSTALL_FOLDER_SUFFIX

# Environment
ENV GRASS_VERSION $GRASS_VERSION
ENV GDAL_VERSION $GDAL_VERSION
ENV GRASS_INSTALL_FOLDER_SUFFIX $GRASS_INSTALL_FOLDER_SUFFIX
ENV LOCALE es_ES.utf8
ENV LANG es_ES.utf8
ENV GDAL_DATA /usr/local/share/gdal

# Load assets
WORKDIR /usr/local
ADD assets/grass-${GRASS_VERSION}/grass-${GRASS_VERSION}.tar.gz /usr/local/src/
ADD assets/grass-${GRASS_VERSION}/ld-config-grass7.conf /etc/ld.so.conf.d/
ADD assets/node-${NODE_VERSION}/node-${NODE_VERSION}.tar.xz /node/
ADD assets/compile_grass.sh /usr/local/bin
ADD assets/export_grass_binaries.sh /usr/local/bin

ADD assets/grass-${GRASS_VERSION}/dot.grass/ /root/.grass7/
ADD assets/dot.bashrc /root/.bashrc
ADD assets/dot.vimrc /root/.vimrc
ADD assets/grass-${GRASS_VERSION}/dot.grass/ /etc/skel/.grass7/
ADD assets/dot.bashrc /etc/skel/.bashrc
ADD assets/dot.vimrc /etc/skel/.vimrc

# Compilation
RUN chmod 777 /usr/local/bin/export_grass_binaries.sh
RUN chmod 777 /usr/local/bin/compile_grass.sh
RUN /usr/local/bin/compile_grass.sh

ENTRYPOINT [ "/usr/local/bin/export_grass_binaries.sh" ]
