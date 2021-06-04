# How to Build and Test

Check the compilation image for **PostGIS** and check the **GDAL** version used.

Download latest version of **GRASS** and put it into the **assets** folder, renaming the folder.

Download the binary version of **Node**, put it into the **assets/node-XX.XX.XX** folder, renaming the folder, and renaming the xz file to **node-XX.XX.XX**. This package has the usual bin, include, share, lib folders that will be added to the image.

Change the base **PostGIS** Docker image at the **Dockerfile**.

Edit the **common** **mlkctxt** context.

Build the image with **010_docker_build.sh**.

Test with the **test** scripts, both GUI and shell-based:

```shell
vim

python -V

node --version

ipython

node

yarn -v

jupyter kernelspec list

jupyter notebook --ip 0.0.0.0 --allow-root

jupyter lab --ip 0.0.0.0 --allow-root

grass -c EPSG:25830 /ext_src/location/mapset

grass -text /ext_src/location/mapset/PERMANENT
```
