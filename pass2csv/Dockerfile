FROM python:alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

RUN set -ex \
  && pip install -U \
    pip \
    python-gnupg \
  && apk add --no-cache \
    gnupg \
  && apk add --no-cache --virtual .build-deps \
    git \
  && git clone --depth 1 https://github.com/reinefjord/pass2csv \
  && apk del .build-deps

