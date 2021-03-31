FROM golang:alpine as builder

RUN set -ex \
  && apk add --no-cache \
    git \
    build-base \
  && cd /go/src/ \
  && git clone --depth 1 https://github.com/mbrt/gmailctl

RUN set -ex \
  && echo $GOPATH \
  && cd /go/src/gmailctl/cmd/gmailctl/ \
  && CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -v -ldflags '-s -w -linkmode external -extldflags "-static"' .

# ========== END OF BUILDER ========== #

FROM alpine:latest


MAINTAINER Ameya Shenoy "shenoy.ameya@gmail.com"

COPY --from=builder /go/src/gmailctl/cmd/gmailctl/gmailctl /usr/local/bin/gmailctl

# ENTRYPOINT ["/usr/local/bin/gmailctl"]

