FROM nginx:alpine

COPY entrypoint.sh .

RUN set -ex \
  && chmod +x entrypoint.sh \
  && apk add --no-cache --virtual .build-deps \
    git \
  && cd /usr/share/nginx/html \
  && rm -rf * \
  && git clone --depth 1 https://github.com/glowing-bear/glowing-bear . \
  && rm -rf .git \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/*

EXPOSE 80
ENTRYPOINT ./entrypoint.sh

