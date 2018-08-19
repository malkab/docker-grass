# Docker GRASS GIS

This repository contains code to create GRASS GIS Docker images. The codes of the images contained in this repo are aligned with the ones at **docker-postgis**, because they serve as base images for the GRASS ones.

Images created:

- **dangerous_deer:** released 2018-08. Contains the following software:

	- PostgreSQL 10.4;

	- GEOS 3.6.3;

	- PROJ4 4.9.3;
	
	- GDAL 2.3.1;

	- PostGIS 2.4.4, with Python 2 as PL/Python language;

	- Python 2 (this GRASS release can't be built against Python 3);

	- GRASS 7.4, with WX Python.

