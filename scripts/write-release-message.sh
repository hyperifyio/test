#!/bin/bash
TAG="$1"
cd "$(dirname "$0")/.."

if test "x$TAG" = x; then
  TAG=$(git describe --tags --abbrev=0)
fi

./scripts/get-release-message.sh "$TAG" > changes.md
