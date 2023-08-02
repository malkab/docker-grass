# Production Image

Run **005** to extract binaries from the compilation image to **assets**.

Build with **010**.

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
