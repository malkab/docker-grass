#!/bin/bash

# -----------------------------------------------------------------
#
# Hace el build de una imagen con todos los assets para
# testear y hacer la compilación.
#
# -----------------------------------------------------------------
docker build \
  -t malkab/grass_compilation:$(mlkp docker_image_tag) \
  .


  # --build-arg GRASS_MAJOR_VERSION=$(mlkp grass_major_version) \
  # --build-arg GRASS_VERSION=$(mlkp grass_version) \
  # --build-arg GDAL_VERSION=$(mlkp gdal_version) \
  # --build-arg NODE_VERSION=$(mlkp node_version) \
  # --build-arg GRASS_INSTALL_FOLDER_SUFFIX=$(mlkp grass_install_folder_suffix) \
