#!/bin/bash

CONTAINER_NAME=hack-app-1

RUNNING=`docker inspect -f {{.State.Running}} $CONTAINER_NAME 2> /dev/null`
echo $RUNNING

if [ "$RUNNING" = "true" ]; then
  echo "Docker image is already running."
  echo "Stopping docker image..."
  docker stop $CONTAINER_NAME > /dev/null
  ERROR=$?  
  if [ $ERROR -ne 0 ]; then
    exit $ERROR
  fi

  docker rm $CONTAINER_NAME > /dev/null
  exit $?
fi

docker build -t $CONTAINER_NAME .
docker run --name $CONTAINER_NAME -d -p 8080:80 $CONTAINER_NAME

echo "Docker image started."
