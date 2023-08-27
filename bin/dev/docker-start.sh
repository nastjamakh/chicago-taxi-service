#!/bin/bash
: "${PROJECT_NAME:=chicago-taxi-service}"

if docker ps | grep " $PROJECT_NAME$"; then
  echo "Container already started. Do nothing"
elif docker ps -a | grep " $PROJECT_NAME$"; then
  docker start $PROJECT_NAME
else
  docker run -i -d \
    -v $HOME/.ssh:/home/jumbo/.ssh \
    -v $(pwd):/opt/$PROJECT_NAME \
    -p 8030:8030 \
    -p 1346:1346 \
    --name $PROJECT_NAME \
    -t $PROJECT_NAME:latest \
    /bin/bash
  docker exec -i -t $PROJECT_NAME poetry install
fi
