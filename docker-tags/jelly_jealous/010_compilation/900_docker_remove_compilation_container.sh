#!/bin/bash

# -----------------------------------------------------------------
#
# Removes the compilation container postgis_compilation_XXX.
# WARNING! Potential loss of information that is very time
# consuming to produce.
#
# -----------------------------------------------------------------
read -p "WARNING! Potential costly data loss. Proceed? (y/N): " -t 10 STR
if [ "$STR" == "y" ] ; then

	docker rm grass_compilation_$(mlkp docker_image_tag)

else

	echo skipping...

fi
