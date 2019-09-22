FROM python:2-alpine

MAINTAINER Ameya Shenoy <shenoy.ameya@gmail.com>


RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    git \
  && cd /opt \
  && git clone https://github.com/hellerbarde/stapler --depth 1 \
  && cd stapler \
  && pip install --no-cache-dir -U \
    pip \
    . \
  && apk del .build-deps \
  && rm -rf /opt/staple

