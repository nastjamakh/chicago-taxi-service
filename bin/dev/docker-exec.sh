#!/bin/bash

: "${PROJECT_NAME:=chicago-taxi-service}"

docker exec -i -t $PROJECT_NAME `echo "${@:1}"`
