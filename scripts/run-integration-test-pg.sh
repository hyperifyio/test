#!/bin/sh
cd "$(dirname "$0")/.."
set -e

if ./is-docker-container-running.sh io-hyperify-pg-server; then
  echo 'Test server was already running' >&2
  exit 2
fi

set -x
npm run clear
./scripts/start-integration-test-server-pg.sh
./scripts/reset-integration-test-pg.sh
TEST_POSTGRES_PASSWORD='rxPe4XHbonLeHwjvKdq9R9aDWf1xiUje' TEST_SCOPES=integration,unit npm run test:ci -- "$@" 'PgRepositoryIntegration.test.ts'
./scripts/stop-integration-test-server-pg.sh
