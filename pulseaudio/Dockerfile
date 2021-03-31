FROM archlinux

LABEL maintainer "Ameya Shenoy <hello@codingcoffee.me>"

ENV PRIVILEGED_USER toor
ENV UNPRIVILEGED_USER pulseaudio

RUN set -ex \
  && pacman -Syyu --noconfirm \
    pulseaudio \
    pulseaudio-alsa \
  && groupadd -r $UNPRIVILEGED_USER \
  && useradd -r -g $UNPRIVILEGED_USER -G audio -m $UNPRIVILEGED_USER \
  && chown -R $UNPRIVILEGED_USER:$UNPRIVILEGED_USER /home/$UNPRIVILEGED_USER \
  && pacman -Scc --noconfirm

COPY default.pa /etc/pulse/default.pa
COPY client.conf /etc/pulse/client.conf
COPY daemon.conf /etc/pulse/daemon.conf

WORKDIR /home/$UNPRIVILEGED_USER
USER pulseaudio
ENTRYPOINT [ "pulseaudio" ]
CMD [ "--log-level=4", "--log-target=stderr", "-v" ]

# v6zdr4pi@MyMintInbox.com
# %$HTPr6j4*UhM894^%pW


