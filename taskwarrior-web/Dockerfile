FROM alpine:3.7 as builder

RUN set -ex \
  && apk add --no-cache \
    task \
    ruby \
    python \
  && apk add --no-cache --virtual .build-dependencies \
    git \
    ruby-dev \
    make \
    g++ \
  && cd /root \
  && git clone --depth 1 https://github.com/theunraveler/taskwarrior-web \
  && cd taskwarrior-web \
  && GEM=$(gem build taskwarrior-web.gemspec | awk '/File: .*/{ print $2 }') \
  && gem install ${GEM} --no-document \
  && apk del --no-cache .build-dependencies


EXPOSE 5678
WORKDIR /root/taskwarrior-web

ENTRYPOINT task-web -F -L

