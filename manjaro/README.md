# Docker Base Image for Manjaro Linux

This repository contains all scripts and files needed to create a Docker base image for the Manjaro Linux distribution.

## Purpose

* Provide the Manjaro experience in a Docker MultiArch Docker Image for amd64 and arm64
* Provide the most simple but complete image to base every other upon
* `pacman` needs to work out of the box
* All installed packages have to be kept unmodified

# Repository

https://github.com/manjaro/manjaro-docker.git 

# Construire l'image

## Étape 1 : build

```sh
docker build - < ./build.Dockerfile
```

## Étape 2 : renommer l'image

```sh
docker tag <ID> <domaine>/<name>:<tag>
```

# Démarrer l'image

Utiliser les options "t" et "i"

* t : allocate a pseudo-tty to the process
* i : keep STDIN open 

```sh
docker run -it <domaine>/<name>:<tag>
```

