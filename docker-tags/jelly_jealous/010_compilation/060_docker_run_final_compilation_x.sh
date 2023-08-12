#!/bin/bash

# -----------------------------------------------------------------
#
# Launches the final compilation container with X Server.
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

xhost + 127.0.0.1

docker run -ti --rm \
    --network=host \
    -v $(pwd):$(pwd) \
    -e DISPLAY=:1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --workdir $(pwd) \
    malkab/grass_compilation_final:$(mlkp docker_image_tag)
