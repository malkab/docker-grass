#!/bin/bash

# Copy binaries from compilation folder and builds production image

cp -R ../compilation/binaries assets/

docker build -t malkab/grass:dangerous_deer .
