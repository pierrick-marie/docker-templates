Up to date docker environments for developers
=============================================

This repository contains configuration file to create docker environments for developers.

The purpose is providing plug-n-play and fully functional container to develop applications. No package, language or library is required on your host. Every thing you need is provided by the container.

You just need VsCode to [attach your editor to the container](https://code.visualstudio.com/docs/devcontainers/attach-container). It's very easy fully functional !

_I created that containers to isolate my dev environment from my host. By this way my host, an Ubuntu based distribution, "stay clean and stable" while my dev environment stay up to date with an an ArchLinux based distribution._

# Web dev environment

You can find in [web-dev](./web-dev/) folder all the instructions to start a web development environment.

It provides: 

* ssh
* git
* Apache
* MariaDB
* Php
* PhpMyAdmin
* NodeJs
* Electron with a support for X11 window
* pacman from Manjaro
* oh my bash

# Java environment

_Still under development..._