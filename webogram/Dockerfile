FROM node:alpine

RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    git \
  && cd /opt \
  && git clone --depth 1 https://github.com/zhukov/webogram \
  && npm install -g gulp \
  && cd webogram \
  && npm install

WORKDIR /opt/webogram
EXPOSE 8000

CMD ["gulp", "watch"]

