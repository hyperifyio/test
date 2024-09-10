#!/bin/bash
cd "$(dirname "$0")/.."
set -e
set -x

npm run test:ci
./scripts/run-integration-test-pg.sh
./scripts/run-integration-test-mysql.sh

echo 'OK'
