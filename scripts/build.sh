#!/bin/bash

# Vars
VERSION=0.0.1
WEBSERVER_PATH=./webserver
WEBSERVER_DOCKERFILE=prod.Dockerfile
WEBSERVER_IMAGE=docker.pkg.github.com/oosswwaalldd/docker-registry-poc/docker-poc-webserver
REVERSE_PATH=./reverse
REVERSE_DOCKERFILE=prod.Dockerfile
REVERSE_IMAGE=docker.pkg.github.com/oosswwaalldd/docker-registry-poc/docker-poc-reverse

# Reverse
docker build --file $REVERSE_PATH/$REVERSE_DOCKERFILE --tag $REVERSE_IMAGE:$VERSION $REVERSE_PATH

# Webserver
docker build --file $WEBSERVER_PATH/$WEBSERVER_DOCKERFILE --tag $WEBSERVER_IMAGE:$VERSION $WEBSERVER_PATH