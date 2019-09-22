FROM alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

ENV VERSION 1.3

RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    autoconf \
    automake \
    build-base \
    clang \
    clang-static \
    gettext-dev \
    gettext-static \
    libmaxminddb-dev \
    libressl-dev \
    linux-headers \
    ncurses-dev \
    ncurses-static \
    tzdata \
    libmaxminddb \
    libmaxminddb-dev \
  && cd /opt \
  && wget https://tar.goaccess.io/goaccess-${VERSION}.tar.gz \
  && tar -xzvf goaccess-${VERSION}.tar.gz \
  && rm goaccess-${VERSION}.tar.gz \
  && cd goaccess-${VERSION} \
  && autoreconf -fiv
  && CC="clang" CFLAGS="-O3 -static" LIBS="$(pkg-config --libs openssl)" ./configure --prefix="" --enable-utf8 --with-openssl --enable-geoip=mmdb \
  && make \
  && make install \
  && apk del .build-deps


# test with geoip=legacy
#RUN make && make DESTDIR=/dist install
# Container
#FROM nginx:alpine
#RUN apk add --no-cache libmaxminddb-dev geoip-dev
#COPY --from=builds /dist /
#COPY --from=builds /usr/share/zoneinfo /usr/share/zoneinfo
#VOLUME /var/www/goaccess
EXPOSE 7890
#ENTRYPOINT ["/bin/goaccess"]
#CMD ["--help"]

