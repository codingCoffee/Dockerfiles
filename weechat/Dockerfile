FROM alpine:3.12.0

# Too much complication ... using thelounge instead

LABEL maintainer="hello@codingcoffee.me"

ENV WEECHAT_USER weechat

RUN set -ex \
  && apk add --no-cache \
    aspell-en \
    ca-certificates \
    perl \
    python3 \
    weechat \
    weechat-aspell \
    weechat-perl \
    weechat-python \
  && adduser -D -h /home/$WEECHAT_USER weechat \
  && mkdir -p /home/$WEECHAT_USER/.weechat \
  && chown -R $WEECHAT_USER:$WEECHAT_USER /home/$WEECHAT_USER

# USER $WEECHAT_USER
# WORKDIR /home/$WEECHAT_USER
WORKDIR /root/.weechat

ENTRYPOINT weechat-headless


