#!/bin/bash

# Vars
VERSION=0.0.1
WEBSERVER_ENV_FILE=$(pwd)/../webserver/.prod.env
WEBSERVER_CONTAINER_NAME=docker-poc-webserver
WEBSERVER_IMAGE=docker.pkg.github.com/oosswwaalldd/docker-registry-poc/docker-poc-webserver:$VERSION
REVERSE_CONTAINER_NAME=docker-poc-reverse
REVERSE_ENV_FILE=$(pwd)/../reverse/.prod.env
REVERSE_IMAGE=docker.pkg.github.com/oosswwaalldd/docker-registry-poc/docker-poc-reverse:$VERSION
NETWORK_NAME=docker-registry-poc
LOG_DRIVER=json-file
LOG_FILES=5
LOG_SIZE=10m

# Stop & Clean
docker stop $WEBSERVER_CONTAINER_NAME && docker rm $WEBSERVER_CONTAINER_NAME
docker stop $REVERSE_CONTAINER_NAME && docker rm $REVERSE_CONTAINER_NAME
docker network remove $NETWORK_NAME

# Pull
# ...

# Network
docker network create $NETWORK_NAME --driver bridge

# Run Webserver
docker run \
--env-file=$WEBSERVER_ENV_FILE \
--detach \
--network="$NETWORK_NAME" \
--name $WEBSERVER_CONTAINER_NAME \
--log-driver $LOG_DRIVER \
--log-opt max-file=$LOG_FILES \
--log-opt max-size=$LOG_SIZE \
$WEBSERVER_IMAGE

# Run Reverse
docker run \
--env-file=$REVERSE_ENV_FILE \
--detach \
--publish 80:80 \
--publish 443:443 \
--network="$NETWORK_NAME" \
--name $REVERSE_CONTAINER_NAME \
--log-driver $LOG_DRIVER \
--log-opt max-file=$LOG_FILES \
--log-opt max-size=$LOG_SIZE \
$REVERSE_IMAGE