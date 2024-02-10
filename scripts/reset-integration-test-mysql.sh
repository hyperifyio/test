#!/bin/sh
cd "$(dirname "$0")/.."
set -x

docker run -i --rm mysql:8 mysql -uhg -hhost.docker.internal -prxPe4XHbonLeHwjvKdq9R9aDWf1xiUje hg < ./src/fi/hg/mysql/docker/initial.sql
