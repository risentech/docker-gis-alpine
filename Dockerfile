FROM python:3.6-alpine3.7
ENV PYTHONUNBUFFERED 1

RUN apk update
RUN apk add --upgrade --repository http://dl-cdn.alpinelinux.org/alpine/edge/main apk-tools
RUN apk update && \
     apk add --no-cache --virtual .build-deps \
     gcc \
     libc-dev \
     build-base \
     linux-headers \
     postgresql-dev \
     libxml2-dev \
     libxslt-dev \
     python3-dev \
     jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .crypto-rundeps \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    libressl2.7-libcrypto
RUN apk add --no-cache --virtual .geo-spatial-rundeps \
     --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
     gdal-dev \
     geos-dev \
     proj4-dev \
     json-c-dev \
     gdal \
     geos \
     proj4 \
     json-c
