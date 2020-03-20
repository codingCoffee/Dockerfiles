FROM python:alpine

RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
  && pip install -U \
    instabot-py \
    pip \
    python-telegram-bot \
  && apk del .build-deps

WORKDIR /config
COPY docker-entrypoint.sh /
ENTRYPOINT /docker-entrypoint.sh


