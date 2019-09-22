FROM python:alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

RUN apk add --no-cache --virtual .build-deps \
      gcc \
      musl-dev \
      libffi-dev \
      openssl-dev \
    && pip install -U \
      pip \
      ansible \
      ansible-lint \
    && apk del .build-deps

