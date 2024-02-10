#!/bin/sh
cd "$(dirname "$0")/.."
set -x

docker run -it --rm mysql:8 mysql -uhg -hhost.docker.internal -prxPe4XHbonLeHwjvKdq9R9aDWf1xiUje hg
