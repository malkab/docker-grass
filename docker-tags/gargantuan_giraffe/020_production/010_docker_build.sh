#!/bin/bash

# Create the GRASS production image
MATCH_MLKCONTEXT=common





# ---

# Check mlkcontext
if [ ! -z "${MATCH_MLKCONTEXT}" ] ; then

  if [ ! "$(mlkcontext)" = "$MATCH_MLKCONTEXT" ] ; then

    echo Please initialise context $MATCH_MLKCONTEXT

    exit 1

  fi

fi

# Get binaries from the production image
cd ../010_compilation/
./040_docker_get_binaries.sh
cd ../020_production

# Copy binaries from compilation folder and builds production image
cp -R ../010_compilation/binaries assets/

# Build
docker build \
  -t malkab/grass:$MLKC_DOCKER_IMAGE_TAG \
  --build-arg GRASS_VERSION=$MLKC_GRASS_VERSION \
  --build-arg GDAL_VERSION=$MLKC_GDAL_VERSION \
  --build-arg GRASS_INSTALL_FOLDER_SUFFIX=$MLKC_GRASS_INSTALL_FOLDER_SUFFIX \
  .
