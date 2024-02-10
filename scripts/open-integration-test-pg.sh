#!/bin/sh
cd "$(dirname "$0")/.."
set -x

docker run -it --rm postgres:15 psql 'postgresql://hg:rxPe4XHbonLeHwjvKdq9R9aDWf1xiUje@host.docker.internal/hg'
