# --------------------------------------
#
# Build
#
# This stage needs that the malkab/postgis_build:karmic_kakarot
# image has been built and is accessible at the host.
#
# --------------------------------------
FROM malkab/postgis_build:latest

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

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

# Add GRASS source
ADD packages/grass-${GRASS_VERSION}.tar.gz /usr/local/src/
ADD packages/PDAL-${PDAL_VERSION}-src.tar.bz2 /usr/local/src/
ADD packages/gdal-grass-${GDAL_GRASS_VERSION}.tar.gz /usr/local/src/

# Add build scripts
ADD build_scripts /build_scripts_grass

# Install basic dependencies to help the building process
RUN apt-get update && \
    apt-file update && \
    updatedb

# Compile
WORKDIR /build_scripts_grass
RUN ./010-install_dependencies.sh | tee 010-install_dependencies.log
RUN ./020-install_pdal.sh | tee 020-install_pdal.log
RUN ./030-install_grass.sh | tee 030-install_grass.log
RUN ./040-install_gdal_grass.sh | tee 040-install_gdal_grass.log