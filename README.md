# Docker GRASS GIS

This Docker image is created to provide a complete computing environment for OS GIS. It is not designed to be slim, but to serve as a central hub for all GIS processing.

There is a **mlkdck** script called **mlkdckgrassrun** to interact with this image.

The tag names of these images are aligned with the ones at **docker-postgis**, since they are the base image for this one. They include:

- everything included in **docker-postgis**:
	-	PostGIS
	- Proj
	- GDAL
- Python (with IPython and Jupyter), with several key libraries:
	-	Numpy
	- GeoPandas
	- scikit-image
	- Rasterio
	- sklearn
	- WxPython
	- scipy
	- Jupyter
- Node (also included in Jupyter), with:
	- Mocha
	- Webpack
	- SASS
	- Typedoc
	- Typescript

This image is X enabled for graphical apps running inside the container, for example, Matplotlib graphics or the GRASS UI.

Also the image contains several users to map to local:

- for Linux, UID/GID from 1000/1000 to 1004/1004;
- for MacOS, UID/GID from 500/20 to 504/20.


## Jupyter Notebooks

To run a Jupyter notebook, just run one of the following:

```shell
jupyter-notebook
jupyter-lab --no-browser -y --notebook-dir=$(pwd)
```

Publishing port is 8888 by default, open this port on the container. The **mlkdckgrassrun** has a special option **-j** to set up a local instance of Jupyter Lab running attached to the host network.


## Debugging and Running Code in the Container from VSC

Run the container in a BASH session and tell VSC to attach to the running container. Then the debugging capabilities of VSC can be used.
