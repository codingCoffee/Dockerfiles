FROM golang:alpine as builder

RUN set -ex \
  && apk add --no-cache \
    git \
    build-base \
  && cd /go/src/ \
  && git clone --depth 1 https://github.com/librespeed/speedtest-cli

RUN set -ex \
  && apk add bash \
  && echo $GOPATH \
  && cd /go/src/speedtest-cli/ \
  && CGO_ENABLED=1 GOOS=linux GOARCH=amd64 ./build.sh

# ========== END OF BUILDER ========== #

FROM alpine:latest


MAINTAINER Ameya Shenoy "shenoy.ameya@gmail.com"

COPY --from=builder /go/src/speedtest-cli/out/* /go/bin/librespeed-cli

# ENTRYPOINT ["/usr/local/bin/librespeed-cli"]

