#!/bin/bash

set -e

cd "/home/${USER}/actions-runner"

deregister_runner() {
  echo "Caught SIGTERM. Deregistering runner"
  ./config.sh remove --token "${RUNNER_TOKEN}"
  exit
}

_RUNNER_NAME=${RUNNER_NAME:-${RUNNER_NAME_PREFIX:-github-runner}-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')}
_RUNNER_WORKDIR=${RUNNER_WORKDIR:-/_work}
_LABELS=${LABELS:-default}
_RUNNER_GROUP=${RUNNER_GROUP:-Default}

_DISABLE_AUTOMATIC_DEREGISTRATION=${DISABLE_AUTOMATIC_DEREGISTRATION:-false}

echo "Configuring runner..."
./config.sh \
  --url "${REPO_URL}" \
  --token "${RUNNER_TOKEN}" \
  --name "${_RUNNER_NAME}" \
  --work "${_RUNNER_WORKDIR}" \
  --labels "${_LABELS}" \
  --runnergroup "${_RUNNER_GROUP}" \
  --unattended

if [[ ${_DISABLE_AUTOMATIC_DEREGISTRATION} == "false" ]]; then
  trap deregister_runner SIGINT SIGQUIT SIGTERM
fi

echo "Starting runner..."
./run.sh

