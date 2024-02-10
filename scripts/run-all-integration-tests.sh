#!/bin/bash
set -e
set -x

npm run test:ci
./scripts/run-integration-test-pg.sh
./scripts/run-integration-test-mysql.sh
