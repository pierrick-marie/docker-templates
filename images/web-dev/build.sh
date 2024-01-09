#!/bin/sh

IMAGE_NAME="electron-from-scratch"

docker rmi -f $IMAGE_NAME 

docker build -t $IMAGE_NAME .

