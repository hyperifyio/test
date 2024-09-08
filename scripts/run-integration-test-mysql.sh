#!/bin/sh
cd "$(dirname "$0")/.."
set -e

if ./scripts/is-docker-container-running.sh io-hyperify-mysql-server; then
  echo 'Test server was already running' >&2
  exit 2
fi

set -x
npm run clear
./scripts/start-integration-test-server-mysql.sh

cleanup() {
  if ./scripts/is-docker-container-running.sh io-hyperify-mysql-server; then
    ./scripts/stop-integration-test-server-mysql.sh
  fi
}
trap cleanup EXIT

./scripts/reset-integration-test-mysql.sh
TEST_MYSQL_PASSWORD='rxPe4XHbonLeHwjvKdq9R9aDWf1xiUje' TEST_SCOPES=integration,unit npm run test:ci -- "$@" MySqlRepositoryIntegration.test.ts
if ./scripts/is-docker-container-running.sh io-hyperify-mysql-server; then
  ./scripts/stop-integration-test-server-mysql.sh
fi
