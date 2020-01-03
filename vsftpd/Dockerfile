FROM arm32v7/python:alpine
COPY --from=codingcoffee/qemu-arm-static /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static


LABEL maintainer="Ameya Shenoy <shenoy.ameya@gmail.com>"

RUN mkdir -p /data \
  && pip install -U --no-cache-dir \
    pip \
    pyftpdlib

ARG PORT=21
ARG HOST=0.0.0.0
ARG FTP_USER=admin
ARG FTP_PASS=admin
ARG PASSIVE_PORT=30000-30009

ENV PORT ${PORT}
ENV HOST ${HOST}
ENV FTP_USER ${FTP_USER}
ENV FTP_PASS ${FTP_PASS}
ENV PASSIVE_PORT ${PASSIVE_PORT}

EXPOSE $PORT $PASSIVE_PORT

ENTRYPOINT python -m pyftpdlib --port=$PORT --nat-address=$HOST --range=$PASSIVE_PORT --username=$FTP_USER --password=$FTP_PASS --write --directory=/data

