FROM python:alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

RUN set -ex \
  && apk add --no-cache \
    libstdc++ \
  && apk add --no-cache --virtual .build-deps \
    g++ \
  && pip install --no-cache-dir -U \
    pip \
    pandas \
  && apk del .build-deps

