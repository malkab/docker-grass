#!/bin/bash

# Compilation of Proj

# UNINSTALL 9.4.1, temporal until final decision
cd /usr/local/src/proj-9.4.1/build
cmake --build . --target uninstall

# INSTALL 9.1.1, temporal until final decision

cd /usr/local/src/proj-9.1.1

mkdir build
cd build

cmake ..
cmake --build .
cmake --build . --target install
projsync --system-directory --all

proj -v

ldconfig
