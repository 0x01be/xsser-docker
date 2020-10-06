FROM alpine as build

RUN apk add --no-cache --virtual xsser-build-dependecies \
    git \
    build-base \
    python3-dev \
    py3-pip \
    py3-wheel \
    pkgconfig \
    curl-dev \
    libffi-dev

RUN pip3 install --prefix=/opt/xsser \
    pycurl \
    bs4 \
    pygeoip \
    gobject \
    cairocffi\
    selenium \
    selenium-firefox \
    setuptools

ENV XSSER_REVISION master
RUN git clone --depth 1 --branch ${XSSER_REVISION} https://github.com/epsylon/xsser.git /xsser

WORKDIR /xsser

RUN python3 ./setup.py install --prefix=/opt/xsser

