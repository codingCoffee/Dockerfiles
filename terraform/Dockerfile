FROM alpine


MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"

ARG VERSION=0.12.9

RUN set -ex \
  && wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip \
  && unzip terraform_${VERSION}_linux_amd64.zip \
  && mv terraform /usr/bin/terraform \
  && rm terraform_${VERSION}_linux_amd64.zip \
  && apk add --no-cache \
    ca-certificates \
  && rm -rf /var/cache/apk/*

