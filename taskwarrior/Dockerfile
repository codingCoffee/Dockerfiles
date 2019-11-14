FROM alpine

COPY entrypoint.sh /
RUN set -ex \
  && apk add task \
  && chmod +x entrypoint.sh


ENTRYPOINT ./entrypoint.sh
