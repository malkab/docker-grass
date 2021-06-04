# Docker GRASS GIS

This Docker image is created to provide a complete computing environment for OS GIS. It is not designed to be slim, but to serve as a central hub for all GIS processing.

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
