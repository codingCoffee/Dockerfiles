FROM ubuntu


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

ENV MONIT_VERSION=3.7.3

WORKDIR /opt
RUN set -ex \
  && apt update \
  && apt install -y wget \
  && wget https://mmonit.com/dist/mmonit-${MONIT_VERSION}-linux-x64.tar.gz \
  && tar -xvf mmonit-${MONIT_VERSION}-linux-x64.tar.gz

ENTRYPOINT ./mmonit-${MONIT_VERSION}/bin/mmonit

