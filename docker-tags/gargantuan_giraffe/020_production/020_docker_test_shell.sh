#!/bin/bash

# Just a Docker launch environment to test the compilation process

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

# Create a default DB
docker run -ti --rm \
  -v `pwd`/../:/ext_src/ \
  --workdir /ext_src/ \
  malkab/grass:$MLKC_DOCKER_IMAGE_TAG \
  -c "grass78 -e -c EPSG:25830 /ext_src/grass_db/default"

docker run -ti --rm \
  -v `pwd`/../:/ext_src/ \
  --workdir /ext_src/ \
  malkab/grass:$MLKC_DOCKER_IMAGE_TAG
