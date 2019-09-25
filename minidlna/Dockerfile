FROM arm32v7/alpine
COPY --from=codingcoffee/qemu-arm-static /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static

MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

COPY entrypoint.sh /entrypoint.sh

RUN set -ex \
  && apk add --no-cache \
    bash \
    minidlna \
  && rm -rf /var/cache/apk/* \
  && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

