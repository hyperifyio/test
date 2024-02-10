#!/bin/bash
set -e
BUILD_VERSION_BASE="$1"

if test "x$BUILD_VERSION_BASE" = x; then
  echo "USAGE: build-production.sh 0.1" >&2
  exit 1
fi

cd "$(dirname "$0")/.."

LATEST_VERSION="$(git tag -l|grep -E '^v'|grep -F 'v'"$BUILD_VERSION_BASE"|sort|tail -n 1)"
LATEST_VERSION_PATCH="$(git tag -l|grep -E '^v'|grep -F 'v'"$BUILD_VERSION_BASE"|sort|tail -n 1|sed -re 's/^v[0-9]\.[0-9]\.//')"

BUILD_VERSION="$BUILD_VERSION_BASE.$((LATEST_VERSION_PATCH + 1))"
BACKEND_VERSION="$(node -e 'console.log(require("./backend/package.json").version)')"
FRONTEND_VERSION="$(node -e 'console.log(require("./frontend/package.json").version)')"

echo 'BUILD_VERSION: '"$BUILD_VERSION"

if test "x$BACKEND_VERSION" != "x$BUILD_VERSION"; then
  echo "ERROR: Backend's version ($BACKEND_VERSION) is not same as build version. See ./backend/package.json." >&2
  exit 1
fi

if test "x$FRONTEND_VERSION" != "x$BUILD_VERSION"; then
  echo "ERROR: Frontend's version ($FRONTEND_VERSION) is not same as build version. See ./frontend/package.json." >&2
  exit 1
fi

set -x
git tag -a "v$BUILD_VERSION" -m "Version $BUILD_VERSION"
git push origin "v$BUILD_VERSION"
