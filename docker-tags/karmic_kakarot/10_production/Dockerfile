# --------------------------------------
#
# Production
#
# Comment from here on to test build scripts.
#
# --------------------------------------
FROM debian:bookworm AS production

# Environment
ARG DOCKER_IMAGE_TAG
ENV DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG}
ARG GDAL_VERSION
ENV GDAL_VERSION=${GDAL_VERSION}
ARG GEOS_VERSION
ENV GEOS_VERSION=${GEOS_VERSION}
ARG POSTGIS_VERSION
ENV POSTGIS_VERSION=${POSTGIS_VERSION}
ARG PG_VERSION
ENV PG_VERSION=${PG_VERSION}
ARG PROJ_VERSION
ENV PROJ_VERSION=${PROJ_VERSION}
ARG GRASS_VERSION
ENV GRASS_VERSION=${GRASS_VERSION}
ARG PDAL_VERSION
ENV PDAL_VERSION=${PDAL_VERSION}
ARG GDAL_GRASS_VERSION
ENV GDAL_GRASS_VERSION=${GDAL_GRASS_VERSION}

# Load assets
WORKDIR /usr/local

ADD packages/run_psql.sh bin/
ADD packages/psqlrc /root/.psqlrc
ADD packages/dot.bashrc /root/.bashrc
ADD packages/psqlrc /etc/skel/.psqlrc
ADD packages/dot.bashrc /etc/skel/.bashrc
ADD packages/dot.vimrc /root/.vimrc
ADD packages/dot.vimrc /etc/skel/.vimrc
ADD packages/sudoers /
ADD packages/fzf /usr/local/bin/

# Copy default configs
WORKDIR /

COPY packages/keyboard_selections.conf /

# Setup the container
RUN ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y debconf-utils && \
    apt-get install -y \
        readline-common \
        locales \
        tzdata

# Locales
RUN \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# en_US.ISO-8859-15 ISO-8859-15/en_US.ISO-8859-15 ISO-8859-15/' /etc/locale.gen && \
    sed -i -e 's/# en_GB ISO-8859-1/en_GB ISO-8859-1/' /etc/locale.gen && \
    sed -i -e 's/# en_GB.ISO-8859-15 ISO-8859-15/en_GB.ISO-8859-15 ISO-8859-15/' /etc/locale.gen && \
    sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# es_ES ISO-8859-1/es_ES ISO-8859-1/' /etc/locale.gen && \
    sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# es_ES@euro ISO-8859-15/es_ES@euro ISO-8859-15/' /etc/locale.gen && \
    sed -i -e 's/# de_DE ISO-8859-1/de_DE ISO-8859-1/' /etc/locale.gen && \
    sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_DE@euro ISO-8859-15/de_DE@euro ISO-8859-15/' /etc/locale.gen && \
    sed -i -e 's/# fr_FR ISO-8859-1/fr_FR ISO-8859-1/' /etc/locale.gen && \
    sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# fr_FR@euro ISO-8859-15/fr_FR@euro ISO-8859-15/' /etc/locale.gen && \
    sed -i -e 's/# it_IT ISO-8859-1/it_IT ISO-8859-1/' /etc/locale.gen && \
    sed -i -e 's/# it_IT.UTF-8 UTF-8/it_IT.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# it_IT@euro ISO-8859-15/it_IT@euro ISO-8859-15/' /etc/locale.gen

RUN locale-gen

RUN dpkg-reconfigure --frontend noninteractive tzdata

# Copy the keyboard configuration
RUN debconf-set-selections < /keyboard_selections.conf
RUN rm /keyboard_selections.conf

# Packages
RUN apt-get install -y \
    curl \
    fftw2 \
    libcairo2 \
    libgeotiff5 \
    libopengl0 \
    libpcre3 \
    python3 \
    python3-opengl \
    python3-wxgtk4.0 \
    sudo \
    osm2pgsql \
    git

RUN apt-get -y upgrade && \
    ldconfig

# Make Python3 default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Add user
RUN groupadd -g 1000 user1000 && \
    useradd -u 1000 -m -d '/home/user1000' -g user1000 user1000 && \
    chown -R 1000:1000 /home/user1000 && \
    usermod -a -G sudo user1000

# Replace sudoers, add user1000 to sudo
RUN mv /sudoers /etc/sudoers && \
    chmod 0440 /etc/sudoers

# Copy assets from GRASS build build image
COPY --from=malkab/grass_build:latest /usr/local/bin/grass /usr/local/bin/grass
COPY --from=malkab/grass_build:latest /usr/local/grass84 /usr/local/grass84
COPY --from=malkab/grass_build:latest /usr/local/lib/libgeos_c* /usr/local/lib
COPY --from=malkab/grass_build:latest /usr/local/lib/libgeos* /usr/local/lib
COPY --from=malkab/grass_build:latest /usr/local/lib/libgdal* /usr/local/lib
COPY --from=malkab/grass_build:latest /usr/local/lib/libpq* /usr/local/lib
COPY --from=malkab/grass_build:latest /usr/local/bin/ogr2ogr /usr/local/bin
COPY --from=malkab/grass_build:latest /usr/local/share/gdal/ /usr/local/share/gdal/

# From PostGIS build image
COPY --from=malkab/postgis_build:latest /usr/local/bin/psql /usr/local/bin/

RUN ldconfig

# Metadata
RUN echo ${DOCKER_IMAGE_TAG} > /docker_image_tag

ENTRYPOINT [ "/bin/bash" ]


# # --------------------------------------
# #
# # Final
# #
# # --------------------------------------
# FROM scratch

# # Environment
# ARG DOCKER_IMAGE_TAG
# ENV DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG}
# ARG GDAL_VERSION
# ENV GDAL_VERSION=${GDAL_VERSION}
# ARG GEOS_VERSION
# ENV GEOS_VERSION=${GEOS_VERSION}
# ARG POSTGIS_VERSION
# ENV POSTGIS_VERSION=${POSTGIS_VERSION}
# ARG PG_VERSION
# ENV PG_VERSION=${PG_VERSION}
# ARG PROJ_VERSION
# ENV PROJ_VERSION=${PROJ_VERSION}

# COPY --from=production / /

# ENTRYPOINT [ "/bin/bash" ]
