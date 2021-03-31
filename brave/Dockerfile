FROM archlinux

LABEL maintainer "Ameya Shenoy <hello@codingcoffee.me>"

ENV PRIVILEGED_USER toor
ENV UNPRIVILEGED_USER brave

RUN set -ex \
  && pacman -Syyu --noconfirm \
    awk \
    binutils \
    fakeroot \
    file \
    gcc \
    gettext \
    git \
    make \
    sudo \
    tar \
  && useradd -mG wheel -s /bin/bash $PRIVILEGED_USER \
  && groupadd -r $UNPRIVILEGED_USER \
  && useradd -r -g $UNPRIVILEGED_USER -G audio,video -m $UNPRIVILEGED_USER \
  && chown -R $UNPRIVILEGED_USER:$UNPRIVILEGED_USER /home/$UNPRIVILEGED_USER \
  && echo "${PRIVILEGED_USER} ALL=(ALL:ALL) NOPASSWD:ALL" | EDITOR='tee -a' visudo \
  && runuser -l $PRIVILEGED_USER -c 'cd ~ && git clone https://aur.archlinux.org/yay.git --depth 1 && cd yay && makepkg -sci --noconfirm && yay -Sy --noconfirm brave-bin' \
  && pacman -Rs --noconfirm \
    binutils \
    fakeroot \
    file \
    gcc \
    gettext \
    git \
    go \
    make \
    sudo \
    yay \
  && userdel -r $PRIVILEGED_USER \
  && pacman -Scc --noconfirm

USER brave
ENTRYPOINT [ "brave" ]
CMD [ "--user-data-dir=/data" ]

