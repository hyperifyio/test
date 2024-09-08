#!/bin/sh
cd "$(dirname "$0")/.."
set -e
set -x

npm run clear
TEST_SCOPES=integration,unit npm run test:ci -- 'MemoryRepositoryIntegration.test.ts' "$@"
