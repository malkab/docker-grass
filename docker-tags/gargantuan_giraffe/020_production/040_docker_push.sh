#!/bin/bash

# Pushes production image to DockerHub
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

docker push malkab/grass:$MLKC_DOCKER_IMAGE_TAG
