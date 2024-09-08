#!/bin/bash
cd "$(dirname "$0")/.."
set -e

CONTAINER_NAME_OR_ID="$1"
if test "x$CONTAINER_NAME_OR_ID" = x; then
  echo 'USAGE: ./scripts/is-docker-container-running.sh NAME' >&2
  exit 2
fi

# Check if the container is running
if [ "$(docker ps -q -f name="$CONTAINER_NAME_OR_ID")" ]; then
    exit 0
else
    exit 1
fi
