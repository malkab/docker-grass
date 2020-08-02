FROM ubuntu:20.04

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

# Build args
ARG GRASS_VERSION
ARG GDAL_VERSION
ARG GRASS_INSTALL_FOLDER_SUFFIX

# Environment
ENV GRASS_VERSION $GRASS_VERSION
ENV GDAL_VERSION $GDAL_VERSION
ENV GRASS_INSTALL_FOLDER_SUFFIX $GRASS_INSTALL_FOLDER_SUFFIX
ENV GUI text
ENV GRASS_PYTHON python3.8
ENV GRASS_HTML_BROWSER w3m
ENV LOCALE es_ES.UTF-8
ENV LANGUAGE es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/grass${GRASS_INSTALL_FOLDER_SUFFIX}/lib

WORKDIR /

ADD assets/dot.grass7 /root/.grass7
ADD assets/grass7_setup.sh /usr/local/bin
ADD assets/binaries/ /
ADD assets/keyboard_selections.conf /

RUN /usr/local/bin/grass7_setup.sh
# RUN rm /usr/local/bin/grass7_setup.sh

ENTRYPOINT [ "/bin/bash" ]
