#!/bin/sh
cd "$(dirname "$0")/.."
set -x

npm run clear
TEST_POSTGRES_PASSWORD='rxPe4XHbonLeHwjvKdq9R9aDWf1xiUje' TEST_SCOPES=integration,hg npm run test:ci -- "$@" 'PgRepositoryIntegration.test.ts'
