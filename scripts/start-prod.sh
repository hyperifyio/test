#!/bin/bash
cd "$(dirname "$0")/.."
set -x

export DOCKER_HOST_IP=172.16.50.54
export BACKEND_JWT_SECRET='secret-code'
export BACKEND_IO_SERVER='https://user:secret@io.nor.fi'

. ./.prod.env

docker-compose -f ./docker-compose.prod.yml up -d
