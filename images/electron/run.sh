#!/bin/bash

docker run --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v`pwd`/src:/app/src --rm -it electron-wrapper bash
