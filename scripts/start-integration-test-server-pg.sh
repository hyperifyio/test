#!/bin/sh
cd "$(dirname "$0")/.."
set -x

cd src/fi/hg/pg/docker/
docker-compose up --build
