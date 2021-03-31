FROM python:alpine


LABEL maintainer "Ameya Shenoy <hello@codingcoffee.me>"

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

