FROM archlinux/base as builder

RUN set -ex \
  && pacman -Sy --noconfirm \
    awk \
    binutils \
    fakeroot \
    file \
    gcc \
    git \
    make \
    reflector \
    sudo \
    tar \
  && useradd -mG wheel -s /bin/bash cc \
  && echo "cc ALL=(ALL:ALL) NOPASSWD:ALL" | EDITOR='tee -a' visudo

USER cc
RUN set -ex \
  && cd ~ \
  && git clone https://aur.archlinux.org/yay.git --depth 1 \
  && cd yay \
  && sudo reflector -p http --sort rate --verbose --latest 5 --save /etc/pacman.d/mirrorlist \
  && makepkg -sci --noconfirm \
  && yay -Sy --noconfirm qemu-user-static-bin


FROM alpine
MAINTAINER "Ameya Shenoy <shenoy.ameya@gmail.com>"
COPY --from=builder /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static

