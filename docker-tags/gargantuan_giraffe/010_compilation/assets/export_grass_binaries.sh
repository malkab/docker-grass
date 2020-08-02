#!/bin/bash

# Final release of binaries
mkdir -p /ext_out/binaries

cp --parents -a -r /usr/local/bin/ /ext_out/binaries/
cp --parents -a -r /usr/local/lib/ /ext_out/binaries/
cp --parents -a -r /usr/local/share/ /ext_out/binaries/
cp --parents -a -r /usr/local/grass${GRASS_INSTALL_FOLDER_SUFFIX} /ext_out/binaries/
