FROM python:alpine


MAINTAINER Ameya Shenoy "shenoy.ameya@gmail.com"

ENV FUSE_LIBRARY_PATH="/usr/lib/libfuse.so.2"

RUN set -ex \
  && apk add --no-cache \
    fuse \
  && apk add --no-cache --virtual .build-deps \
    gcc \
    git \
    libc-dev \
  && pip install -U --no-cache-dir \
    pip \
    git+https://github.com/tannercollin/standardnotes-fs \
  && apk del .build-deps

