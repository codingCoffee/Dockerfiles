FROM python:2.7-alpine


ENV LANG C.UTF-8

RUN set -ex \
  && cd ~ \
  && addgroup -g 1001 app \
  && adduser -u 1001 -S -D -G app -s /usr/sbin/nologin app \
  && apk --no-cache update \
  && apk upgrade \
  && apk add --no-cache --virtual .build-deps \
    git \
    libstdc++ \
    libffi-dev \
    openssl-dev \
    g++ \
  && apk add --no-cache \
    dumb-init \
  && git clone https://github.com/mozilla-services/syncserver \
  && cd syncserver \
  && rm -rf .git \
  && pip install --upgrade pip \
  && pip install --upgrade --no-cache-dir -r requirements.txt \
  && pip install --upgrade --no-cache-dir -r dev-requirements.txt \
  && python setup.py develop \
  && apk del .build-deps

# run as non priviledged user
USER app

# run the server by default
ENTRYPOINT ["/usr/bin/dumb-init", "/syncserver/docker-entrypoint.sh"]
CMD ["server"]
