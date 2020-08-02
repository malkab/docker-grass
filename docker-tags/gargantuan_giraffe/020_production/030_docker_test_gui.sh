#!/bin/bash

# -----------------------------------------------------------------
#
# Document here the purpose of the script.
#
# -----------------------------------------------------------------
#
# Runs a arbitrary container.
#  
# -----------------------------------------------------------------

# Check mlkcontext to check. If void, no check will be performed
MATCH_MLKCONTEXT=common
# Custom command to execute, leave blank for using the 
# image's built-in option
COMMAND_EXEC=
# The network to connect to. Remember that when attaching to the network
# of an existing container (using container:name) the HOST is
# "localhost"
NETWORK=
# Container name
CONTAINER_NAME=
# Container host name
CONTAINER_HOST_NAME=
# The name of the image to pull, without tag
IMAGE_NAME=malkab/grass
# The tag
IMAGE_TAG=${MLKC_DOCKER_IMAGE_TAG}
# A set of volumes in the form ("source:destination" "source:destination")
VOLUMES=(
  $(pwd)/../:/ext_src
)
# Volatile (-ti --rm or -d)
VOLATILE=true
# Replicas. If VOLATILE is true will fail. Keep in mind
# replicas will share volumes and all other configuration
# set. They'll be named with a -# suffix. Keep blank for
# no replicas
REPLICAS=
# Open ports in the form (external:internal external:internal)
PORTS=()
# Custom entrypoint, leave blank for using the 
# image's built-in option
ENTRYPOINT=/bin/bash
# Custom workdir
WORKDIR=/ext_src
# The following options are mutually exclusive.
# Use display for X11 host server in Mac?
X11_MAC=false
# Use display for X11 host server in Linux?
X11_LINUX=true





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
  -v `pwd`/../:/ext-src/ \
  --workdir /ext-src/ \
  malkab/grass:$MLKC_DOCKER_IMAGE_TAG \
  -c "grass78 -e -c EPSG:25830 /ext-src/grass-db/default"

if [ ! -z "${COMMAND_EXEC}" ] ; then 

  COMMAND_EXEC="-c \"${COMMAND_EXEC}\""
  
fi


if [ ! -z "${NETWORK}" ] ; then 

  NETWORK="--network=${NETWORK}"
  
fi


if [ "${X11_MAC}" = true ] ; then 

  X11="-e DISPLAY=host.docker.internal:0"

  # Prepare XQuartz server
  xhost + 127.0.0.1

else

  X11=

fi


if [ "${X11_LINUX}" = true ] ; then 

  xhost +local:root

  X11="-e DISPLAY=unix$DISPLAY -e NO_AT_BRIDGE=1 -v /tmp/.X11-unix:/tmp/.X11-unix"

else

  X11=

fi


if [ ! -z "${CONTAINER_NAME}" ] ; then 

  CONTAINER_NAME="--name=${CONTAINER_NAME}"
  
fi


if [ ! -z "${CONTAINER_HOST_NAME}" ] ; then

  CONTAINER_HOST_NAME="--hostname=${CONTAINER_HOST_NAME}"
  
fi


if [ ! -z "${ENTRYPOINT}" ] ; then 

  ENTRYPOINT="--entrypoint ${ENTRYPOINT}"
    
fi


if [ ! -z "${WORKDIR}" ] ; then 

  WORKDIR="--workdir ${WORKDIR}"

fi


VOLUMES_F=

if [ ! -z "${VOLUMES}" ] ; then

  for E in "${VOLUMES[@]}" ; do

    VOLUMES_F="${VOLUMES_F} -v ${E} "

  done

fi


PORTS_F=

if [ ! -z "${PORTS}" ] ; then

  for E in "${PORTS[@]}" ; do

    PORTS_F="${PORTS_F} -p ${E} "

  done

fi


if [ "$VOLATILE" = true ] ; then

  COMMAND="docker run -ti --rm"

else

  COMMAND="docker run -d"

fi


# Iterate to produce replicas if VOLATILE is false
if [ ! -z "$REPLICAS" ] ; then

  if [ "$VOLATILE" = true ] ; then

    echo VOLATILE true and REPLICAS not blank are incompatible options

    exit 1

  fi


  for REPLICA in $(seq 1 $REPLICAS) ; do

    eval  $COMMAND \
          $NETWORK \
          ${CONTAINER_NAME}-${REPLICA} \
          ${CONTAINER_HOST_NAME}-${REPLICA} \
          $X11 \
          $VOLUMES_F \
          $PORTS_F \
          $ENTRYPOINT \
          $WORKDIR \
          $IMAGE_NAME:$IMAGE_TAG \
          $COMMAND_EXEC

  done 

else

  eval  $COMMAND \
        $NETWORK \
        ${CONTAINER_NAME} \
        ${CONTAINER_HOST_NAME} \
        $X11 \
        $VOLUMES_F \
        $PORTS_F \
        $ENTRYPOINT \
        $WORKDIR \
        $IMAGE_NAME:$IMAGE_TAG \
        $COMMAND_EXEC

fi
