FROM ubuntu

RUN set -ex \
  && apt update \
  && apt upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt install -y \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    fonts-font-awesome

