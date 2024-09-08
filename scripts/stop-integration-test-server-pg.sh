#!/bin/sh
cd "$(dirname "$0")/.."
set -e
set -x

cd src/io/hyperify/pg/docker/
exec docker-compose down
