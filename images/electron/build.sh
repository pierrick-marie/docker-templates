#!/bin/bash

docker rmi pimarie/electron:latest
docker build -t pimarie/electron .
