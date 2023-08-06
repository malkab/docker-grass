# How to Build and Test

Steps to follow:

- [] these images should match the release tags from **G/docker/postgis**. Image **malkab/postgis_compilation_final:XXX** must exists;

- [] check the compilation image for **PostGIS** and configure the **mlkctxt.yaml** here accordingly;

- [] download the desired version of **GRASS** and put it into the **assets/grass** folder. If too big, gitignore it and add it to S3;

- [] download the desired version of **Node** and put it into the **assets/node** folder. If too big, gitignore it and add it to S3;

- [] download the desired version of **Spark** and **Hadoop** and put it into the **assets/hadoop-spark** folder. Check the **G/docker/spark** for reference;

- [] build the base image qith **010**;

- [] create the **compilation container** with **020**;

- [ ] test compilation steps with the scripts at **build_scripts**;







In 22.04, there is an incompatibility between PDAL and MySQL development libraries for building GRASS. Therefore, we opted for MySQL:

- **PDAL:** add to dependencies apt-get libpdal-dev
- **MySQL / MariaDB:** add to apt-get libmariadb-dev and libmariadb-dev-compat

Then, at the GRASS configure, either:

--with-mysql
--without-pdal






El Node hay que bajarlo de aquí: https://nodejs.org/en/download, versión **Linux Binaries (x64)**.





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
