#!/bin/bash
: "${PROJECT_NAME:=chicago-taxi-service}"

CONTAINER_NAME="${PROJECT_NAME}"

if  docker ps | grep "$CONTAINER_NAME$"; then
    docker stop $CONTAINER_NAME
else
    echo "Container not running."
fi
