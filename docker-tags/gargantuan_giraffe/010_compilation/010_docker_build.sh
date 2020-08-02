#!/bin/bash

# Builds the malkab/grass_compilation:dangerous_deer image
# Check mlkcontext to check. If void, no check will be performed
MATCH_MLKCONTEXT=common





# ---

# Check mlkcontext
if [ ! -z "${MATCH_MLKCONTEXT}" ] ; then

  if [ ! "$(mlkcontext)" = "$MATCH_MLKCONTEXT" ] ; then

    echo Please initialise context $MATCH_MLKCONTEXT

    exit 1

  fi

fi

docker build \
  -t malkab/grass_compilation:$MLKC_DOCKER_IMAGE_TAG \
  --build-arg GRASS_VERSION=$MLKC_GRASS_VERSION \
  --build-arg GDAL_VERSION=$MLKC_GDAL_VERSION \
  --build-arg GRASS_INSTALL_FOLDER_SUFFIX=$MLKC_GRASS_INSTALL_FOLDER_SUFFIX \
  .
