FROM golang:alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

WORKDIR /

RUN set -ex \
  && apk add --no-cache \
    imagemagick \
  && apk add --no-cache --virtual .build-deps \
    git \
  && go get -u github.com/fogleman/primitive \
  && apk del .build-deps

