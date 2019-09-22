FROM alpine


MAINTAINER Ameya Shenoy "shenoy.ameya@gmail.com"

ARG PLATFORM=linux
ARG ARCHITECTURE=x86_64
ARG VERSION=2.0.27

ADD dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml

RUN set -ex \
  && apk add --no-cache \
    bind-tools \
  && wget https://github.com/jedisct1/dnscrypt-proxy/releases/download/$VERSION/dnscrypt-proxy-${PLATFORM}_${ARCHITECTURE}-${VERSION}.tar.gz \
  && tar -xzf dnscrypt-proxy-${PLATFORM}_${ARCHITECTURE}-${VERSION}.tar.gz \
  && mv linux-x86_64/dnscrypt-proxy /bin/dnscrypt-proxy \
  && rm -rf linux-x86_64 dnscrypt-proxy-${PLATFORM}_${ARCHITECTURE}-${VERSION}.tar.gz

ENTRYPOINT ["/bin/dnscrypt-proxy", "-config", "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"]
HEALTHCHECK CMD dig one.one.one.one || exit 1

