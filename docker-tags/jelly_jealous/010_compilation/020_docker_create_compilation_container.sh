#!/bin/bash

# -----------------------------------------------------------------
#
# Runs a session inside the compilation image for compiling.
#
# -----------------------------------------------------------------
docker run -ti \
  --name grass_compilation_$(mlkp docker_image_tag) \
  --hostname grass_compilation_$(mlkp docker_image_tag) \
  -v $(pwd):$(pwd) \
  --workdir $(pwd) \
  malkab/grass_compilation:$(mlkp docker_image_tag)
