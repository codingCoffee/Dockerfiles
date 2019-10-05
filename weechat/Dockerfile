FROM alpine

ENV TERM=screen-256color
ENV LANG=C.UTF-8
ENV UID=1000
ENV GID=1000

ADD run.sh /

RUN set -ex \
  && chmod +x run.sh \
  && apk add --no-cache --virtual .build-deps \
    build-base \
    cmake \
    curl-dev \
    gnutls-dev \
    jq \
    libgcrypt-dev \
    ncurses-dev \
    python3-dev \
    zlib-dev \
    ca-certificates \
    libcurl \
    libintl \
    perl-dev \
  && apk add --no-cache \
    gnutls \
    ncurses \
    libgcrypt \
    python3 \
    su-exec \
    perl \
    shadow \
    curl \
    su-exec \
  && update-ca-certificates \
  && export WEECHAT_TARBALL_URL="$(curl -sS https://api.github.com/repos/weechat/weechat/releases/latest | jq .tarball_url -r)" \
  && cd /tmp \
  && curl -sSL $WEECHAT_TARBALL_URL -o weechat.tar.gz \
  && mkdir -p weechat/build \
  && tar xzf weechat.tar.gz --strip 1 -C weechat \
  && cd weechat/build \
  && cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
  && make \
  && make install \
  && mkdir /weechat \
  && addgroup -g $GID -S weechat \
  && adduser -u $UID -D -S -h /weechat -s /sbin/nologin -G weechat weechat \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/*


WORKDIR /weechat
EXPOSE 9001

ENTRYPOINT ["/run.sh"]

