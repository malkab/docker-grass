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


## Docker Usage Examples

Run a Jupyter Lab server:

```shell
docker run -ti --rm \
  --user 1000:1000 \
  --network host \
  --name XXX \
  --hostname XXX \
  -v $(pwd):$(pwd) \
  --workdir $(pwd) \
  malkab/grass:latest -c "jupyter-lab --no-browser -y --notebook-dir=$(pwd)"
```

An interactive session:

```shell
docker run -ti --rm \
  --name sunnsaas_data_helpers_ipython \
  --hostname sunnsaas_data_helpers_ipython \
  --user 1000:1000 \
  --workdir $(pwd) \
  -v $(pwd):$(pwd) \
  malkab/grass:latest
```
