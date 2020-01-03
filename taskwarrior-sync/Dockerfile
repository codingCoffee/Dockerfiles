FROM python:alpine

COPY entrypoint.sh /
RUN set -ex \
  && apk add --no-cache \
    task \
  && pip install bugwarrior "bugwarrior[jira]" \
  && chmod +x entrypoint.sh


ENTRYPOINT ./entrypoint.sh
