#!/bin/sh
cd "$(dirname "$0")/.."
set -e
set -x

docker run -i --rm mysql:8 mysql -uhg -hhost.docker.internal -prxPe4XHbonLeHwjvKdq9R9aDWf1xiUje hg < ./src/io/hyperify/mysql/docker/initial.sql
