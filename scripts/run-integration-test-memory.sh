#!/bin/sh
cd "$(dirname "$0")/.."
set -x

npm run clear
TEST_SCOPES=integration,hg npm run test:ci -- 'MemoryRepositoryIntegration.test.ts' "$@"
