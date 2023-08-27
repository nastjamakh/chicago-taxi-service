#!/bin/bash

: "${PROJECT_NAME:=chicago-taxi-service}"

if  docker ps | grep " $PROJECT_NAME$"; then
    docker kill $PROJECT_NAME
fi

if docker ps -a |grep " $PROJECT_NAME$" ; then
    docker rm $PROJECT_NAME
fi

if docker image ls -a | grep "${PROJECT_NAME} " ; then
    docker image rm ${PROJECT_NAME}
fi
