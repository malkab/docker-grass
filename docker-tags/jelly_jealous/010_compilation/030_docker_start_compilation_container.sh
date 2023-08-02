#!/bin/bash

# -----------------------------------------------------------------
#
# Starts and attach to a compiler container.
#
# -----------------------------------------------------------------
docker start -ai grass_compilation_$(mlkp docker_image_tag)
