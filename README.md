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

	- GRASS 7.4, with WX Python;

- **gargantuan_giraffe:** released 2020-08-02. Contains the following software:

	- Ubuntu 2020.04;

	- PostgreSQL 12.3;

	- GEOS 3.8.1;

	- Proj 7.1.0;

	- GDAL 3.1.2;

	- PostGIS 3.1.0alpha2;

	- Python 3.6;

	- GRASS 7.8.3: the wxPython GUI doesn't work yet because the version shipped with the Ubuntu 2020.04 packages (4.1.0) is not compatible with this version of GRASS. Waiting for a fix.

	- ImageMagick, with Python Wand as wrapper;

	- VIM;

	- Numpy;

	- Psycopg2;

	- iPython;

	- GeoPandas;

	- Scikit-Learn;

	- GeoAlchemy;

	- Scikit-Image;

	- Rasterio.
