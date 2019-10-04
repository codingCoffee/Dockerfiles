FROM python:alpine


RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    git \
  && cd /opt \
  && git clone --depth 1 https://github.com/glowing-bear/glowing-bear \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/* \

EXPOSE 8000
ENTRYPOINT cd /opt/glowing-bear && python -m http.server

