#!/bin/sh
cd "$(dirname "$0")/.."
set -x

docker run -i --rm postgres:15 psql 'postgresql://hg:rxPe4XHbonLeHwjvKdq9R9aDWf1xiUje@host.docker.internal/hg' < ./src/fi/hg/pg/docker/initial.sql
