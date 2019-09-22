FROM golang:alpine as builder

RUN set -ex \
  && apk add --no-cache \
    git \
    build-base \
  && cd /go/src/ \
  && git clone --depth 1 https://github.com/go-shiori/shiori \
  && cd shiori \
  && CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -v -ldflags '-s -w -linkmode external -extldflags "-static"' .

# ========== END OF BUILDER ========== #

FROM alpine:latest


MAINTAINER Ameya Shenoy "shenoy.ameya@gmail.com"

COPY --from=builder /go/src/shiori/shiori /usr/local/bin/shiori

ENV SHIORI_DIR /srv/shiori/
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/shiori", "serve"]

