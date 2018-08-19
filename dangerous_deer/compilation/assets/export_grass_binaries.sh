#!/bin/bash

# Final release of binaries
mkdir -p /ext-out/binaries

cp --parents -a -r /usr/local/bin/ /ext-out/binaries/
cp --parents -a -r /usr/local/lib/ /ext-out/binaries/
cp --parents -a -r /usr/local/share/ /ext-out/binaries/
cp --parents -a -r /usr/local/grass-7.4.1 /ext-out/binaries/

