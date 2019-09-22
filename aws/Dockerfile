FROM python:alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
  && pip install -U --no-cache-dir \
    pip \
    ipython \
    flake8 \
    pylint \
    jinja2 \
    boto3 \
    awscli \
  && apk del .build-deps

