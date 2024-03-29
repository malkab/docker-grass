#!/bin/bash

# -----------------------------------------------------------------
#
# Starts and attach to a compiler container.
#
# -----------------------------------------------------------------
# Check mlkctxt to check. If void, no check will be performed. If NOTNULL,
# any activated context will do, but will fail if no context was activated.
MATCH_MLKCTXT=default

# Check mlkctxt
if command -v mlkctxt &> /dev/null ; then

  if [ ! -z "$MATCH_MLKCTXT" ] ; then

    mlkctxtcheck $MATCH_MLKCTXT

    if [ ! $? -eq 0 ] ; then

      echo Invalid context set, required $MATCH_MLKCTXT

      exit 1

    fi

  fi

fi

docker start -ai grass_compilation_$(mlkp docker_image_tag)
