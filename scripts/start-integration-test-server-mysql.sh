#!/bin/sh
cd "$(dirname "$0")/.."
set -e
set -x

cd src/io/hyperify/mysql/docker/
docker-compose up -d --build
sleep 10
