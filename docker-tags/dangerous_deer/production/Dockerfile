FROM ubuntu:18.04

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

ENV GUI text
ENV GRASS_PYTHON python2.7
ENV GRASS_HTML_BROWSER w3m
ENV LOCALE es_ES.UTF-8
ENV LANGUAGE es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/grass-7.4.1/lib

WORKDIR /

ADD assets/dot.grass7 /root/.grass7
ADD assets/grass7_setup.sh /usr/local/bin
ADD assets/binaries/ /

RUN /usr/local/bin/grass7_setup.sh
RUN rm /usr/local/bin/grass7_setup.sh

ENTRYPOINT [ "/bin/bash" ]