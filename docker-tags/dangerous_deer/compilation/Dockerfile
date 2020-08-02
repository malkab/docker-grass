FROM malkab/postgis_compilation:dangerous_deer

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"


# Environment
ENV GRASS_VERSION 7.4.1
ENV LOCALE es_ES.utf8
ENV LANG es_ES.utf8

# Load assets
WORKDIR /usr/local
ADD assets/grass-${GRASS_VERSION}/grass-${GRASS_VERSION}.tar.gz /usr/local/src/
ADD assets/grass-${GRASS_VERSION}/dot.grass/ /root/.grass7/
ADD assets/grass-${GRASS_VERSION}/ld-config-grass7.conf /etc/ld.so.conf.d/
ADD assets/compile_grass.sh /usr/local/bin
ADD assets/export_grass_binaries.sh /usr/local/bin
ADD assets/dot.vimrc.linux_servers /root/.vimrc

# Compilation
RUN chmod 777 /usr/local/bin/export_grass_binaries.sh
RUN chmod 777 /usr/local/bin/compile_grass.sh
RUN /usr/local/bin/compile_grass.sh 

ENTRYPOINT [ "/usr/local/bin/export_grass_binaries.sh" ]
