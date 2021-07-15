FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=ubuntu

ARG ACTIONS_RUNNER_VERSION=2.278.0

RUN set -ex \
  && apt update \
  && apt install -y \
    curl \
    jq \
    sudo \
  && useradd -mG sudo -s /bin/bash ${USER} \
  && echo "${USER} ALL=(ALL:ALL) NOPASSWD:ALL" | EDITOR='tee -a' visudo

USER ubuntu
WORKDIR /home/${USER}

RUN set -ex \
  && mkdir actions-runner \
  && cd actions-runner \
  && curl -o actions-runner-linux-x64-${ACTIONS_RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${ACTIONS_RUNNER_VERSION}/actions-runner-linux-x64-${ACTIONS_RUNNER_VERSION}.tar.gz \
  && tar xzf ./actions-runner-linux-x64-2.278.0.tar.gz \
  && sudo ./bin/installdependencies.sh

COPY entrypoint.sh /home/${USER}/entrypoint.sh
RUN set -ex \
  && sudo chown -R "${USER}:${USER}" "/home/${USER}" \
  && chmod +x entrypoint.sh

CMD ./entrypoint.sh

