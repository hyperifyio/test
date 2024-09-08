#!/bin/sh
cd "$(dirname "$0")/.."
set -e
set -x

cd src/io/hyperify/mysql/docker/
exec docker-compose down
