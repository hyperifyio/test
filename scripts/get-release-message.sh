#!/bin/bash
TAG="$1"
cd "$(dirname "$0")/.."
if test "x$TAG" = x; then
  TAG=$(git describe --tags --abbrev=0)
fi
echo "This release contains the following changes since $TAG:"
git log --oneline --no-merges --format="%s" "$TAG..HEAD"|sed -re 's/^/ * /g'
