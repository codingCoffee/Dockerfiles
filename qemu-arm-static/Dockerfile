FROM archlinux/base as builder

RUN set -ex \
  && pacman -Sy --noconfirm git sudo binutils tar fakeroot file awk \
  && useradd -mG wheel -s /bin/bash cc \
  && echo "cc ALL=(ALL:ALL) NOPASSWD:ALL" | EDITOR='tee -a' visudo

USER cc
RUN set -ex \
  && cd ~ \
  && git clone https://github.com/codingcoffee/PKGBUILDs --depth 1 \
  && cd PKGBUILDs/qemu-user-static-bin \
  && makepkg -sci --noconfirm


FROM alpine
MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"
COPY --from=builder /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static

