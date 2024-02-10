#!/bin/sh
cd "$(dirname "$0")/.."
set -x

cd src/fi/hg/mysql/docker/
docker-compose up --build
