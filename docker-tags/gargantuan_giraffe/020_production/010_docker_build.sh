#!/bin/bash

# Version: 2020-11-19

# -----------------------------------------------------------------
#
# Builds the GRASS image.
#
# -----------------------------------------------------------------
#
# Builds a Docker image.
#
# -----------------------------------------------------------------

# Check mlkcontext to check. If void, no check will be performed
MATCH_MLKCONTEXT=common
# The name of the image to push
IMAGE_NAME=malkab/grass
# The tag
IMAGE_TAG=$MLKC_DOCKER_IMAGE_TAG
# Dockerfile
DOCKERFILE=.
# Latest? Tag the image as latest, too
LATEST=true





# ---

echo -------------

# Check mlkcontext is present at the system
if command -v mlkcontext &> /dev/null
then

  echo "WORKING AT:     $(mlkcontext)"

  # Check mlkcontext
  if [ ! -z "${MATCH_MLKCONTEXT}" ] ; then

    if [ ! "$(mlkcontext)" = "$MATCH_MLKCONTEXT" ] ; then

      echo Please initialise context $MATCH_MLKCONTEXT
      exit 1

    fi

  fi

fi

echo "BUILDING IMAGE: ${IMAGE_NAME}:${IMAGE_TAG}"
echo -------------

# Build
docker build \
  --build-arg GRASS_VERSION=$MLKC_GRASS_VERSION \
  --build-arg GDAL_VERSION=$MLKC_GDAL_VERSION \
  --build-arg GRASS_INSTALL_FOLDER_SUFFIX=$MLKC_GRASS_INSTALL_FOLDER_SUFFIX \
  -t $IMAGE_NAME:$IMAGE_TAG $DOCKERFILE

# Tag latest, if asked
if [ "${LATEST}" = true ] ; then

  docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_NAME:latest

fi
