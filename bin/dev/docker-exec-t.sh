#!/bin/bash

: "${PROJECT_NAME:=chicago-taxi-service}"

docker exec -t $PROJECT_NAME `echo "${@:1}"`
