#!/bin/bash
# Builds a release with a new version into git
#
# Note! This will not publish nor commit the new release

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
  sed -i.bak -re 's@"version": "'"$BACKEND_VERSION"'"@"version": "'"$BUILD_VERSION"'"@' ./backend/package.json
  rm ./backend/package.json.bak
fi

if test "x$FRONTEND_VERSION" != "x$BUILD_VERSION"; then
  sed -i.bak -re 's@"version": "'"$FRONTEND_VERSION"'"@"version": "'"$BUILD_VERSION"'"@' ./frontend/package.json
  rm ./frontend/package.json.bak
fi

BACKEND_VERSION="$(node -e 'console.log(require("./backend/package.json").version)')"
FRONTEND_VERSION="$(node -e 'console.log(require("./frontend/package.json").version)')"

if test "x$BACKEND_VERSION" != "x$BUILD_VERSION"; then
  echo "ERROR: Backend's version ($BACKEND_VERSION) is not same as build version. See ./backend/package.json." >&2
  exit 1
fi

if test "x$FRONTEND_VERSION" != "x$BUILD_VERSION"; then
  echo "ERROR: Frontend's version ($FRONTEND_VERSION) is not same as build version. See ./frontend/package.json." >&2
  exit 1
fi

set -x

( 
  cd backend
  export BUILD_VERSION="$BACKEND_VERSION" 
  export NODE_ENV=production
  export GENERATE_SOURCEMAP=false
  export BACKEND_LOG_LEVEL=DEBUG
  npm run -s build 
)

( 
  cd frontend
  export BUILD_VERSION="$FRONTEND_VERSION"
  export REACT_APP_BUILD_VERSION="$FRONTEND_VERSION"
  export REACT_APP_REQUEST_CLIENT_MODE=WINDOW
  export REACT_APP_PUBLIC_URL=https://procurenode.app
  export NODE_ENV=production
  export GENERATE_SOURCEMAP=false
  export PUBLIC_URL='https://procurenode.app'
  npm run -s build 
)

git add -f */build */dist */package.json
