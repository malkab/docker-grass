#!/bin/bash

# Add Node resources
cp -r /node-v${NODE_VERSION}-linux-x64/bin /usr/local
cp -r /node-v${NODE_VERSION}-linux-x64/include /usr/local
cp -r /node-v${NODE_VERSION}-linux-x64/lib /usr/local
cp -r /node-v${NODE_VERSION}-linux-x64/share /usr/local

# Add Node modules
npm i -g yarn

yarn global add --registry $NPM_REGISTRY \
    mocha \
    webpack \
    sass \
    webpack-cli \
    typedoc \
    typescript \
    webpack-dev-server \
    http-server \
    json-minify \
    lodash \
    tslab

# Prepare TSLab
tslab install

# Don't know why, but this is needed for Jupyter to work
pip3 install --upgrade nbconvert
