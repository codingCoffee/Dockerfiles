FROM python:alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
  && apk add --no-cache \
    sshpass \
    openssh \
  && pip install -U \
    ansible \
    ansible-lint \
    pip \
    selinux \
  && apk del .build-deps

