#!/bin/bash

docker run --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v`pwd`/:/app/src --rm -it pimarie/electron:latest bash
