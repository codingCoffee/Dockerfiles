FROM arm32v7/alpine
COPY --from=codingcoffee/qemu-arm-static /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static

LABEL maintainer="Ameya Shenoy <shenoy.ameya@gmail.com> <https://codingcoffee.dev>"

ARG PORT=9091
ENV USERNAME=admin
ENV PASSWORD=admin
ENV PORT=${PORT}

RUN set -ex \
  && apk add transmission-daemon --no-cache \
  && rm -rf /var/cache/apk/*

EXPOSE ${PORT}
EXPOSE 51413
EXPOSE 51413/udp

ENTRYPOINT transmission-daemon --username "$USERNAME" --password "$PASSWORD" --port "$PORT" --config-dir /config --allowed *.*.*.* --incomplete-dir /data/Incomplete --download-dir /data/Completed --foreground --auth

