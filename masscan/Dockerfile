FROM alpine:3.12.2 as builder


RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    musl-dev \
    linux-headers \
    gcc \
    git \
    make \
    libpcap-dev \
  && apk add --no-cache \
    libpcap \
  && cd ~ \
  && git clone https://github.com/robertdavidgraham/masscan --depth 1 \
  && cd masscan \
  && make -j$(nproc) \
  && apk del .build-deps

# ========== END OF BUILDER ========== #

FROM alpine:3.12.2
MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"
COPY --from=builder /root/masscan/bin/masscan /usr/local/bin/masscan
RUN set -ex \
  && apk add --no-cache \
    libpcap \
    libpcap-dev

