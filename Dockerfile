FROM ubuntu:xenial
MAINTAINER Lucas <lg@wb7.eu>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && apt-get install -qy \
    texlive-full \
    python-pygments gnuplot \
    make git \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts \
    && texlua ./install-getnonfreefonts \
    && getnonfreefonts -a --sys

WORKDIR /data
VOLUME ["/data"]
