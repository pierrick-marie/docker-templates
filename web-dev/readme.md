Web Dev container
=================

# Introduction

That container is based on [Manjaro:latest](https://github.com/manjaro/manjaro-docker). I made it to develop web applications with up to date Php or NodeJs within an isolated environment.
I also configure it to run Electron to develop desktop applications.

The container provides:

* Apache
* Php
* PhpMyAdmin
* MariaDB client
* NodeJs
* Chromium

MariaDB is separated in a dedicated container. _docker-composer.yml_ connects the containers together.

The default user is _builder_. You can use it to edit mounted files from your host.

# How use it?

## Step 1: configure

### Volumes

In _docker-composer.yml_, section `volumes`, you can change which volumes are mounted in the container.
By default the script mounts your host folder `~/Documents/projets/` into `/builder/projects`.
You can edit it or add other mount points.

### Ports

By default the container exports many ports :

```yml
ports:
  # Apache
  - "127.0.0.1:8080:80"
  # Others, many 
  - "127.0.0.1:8000:8000"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:8010:8010"
  - "127.0.0.1:8100:8100"
  - "127.0.0.1:3000:3000"
  - "127.0.0.1:3001:3001"
  - "127.0.0.1:3010:3010"
  - "127.0.0.1:3100:3100"
```

Port 80 on container is available from host with number 8080.

Do not hesitate to edit that section.

## Step 2: build and run the containers

You just have to execute that command:

```sh
docker compose up
```

That command builds a new image with all services and starts MariaDB, the container and a network to connect them together.

## Step 3: code

Once the container is started, I strongly suggest to use VsCode from your host to develop your projects inside the container.  
_Read that [documentation](https://code.visualstudio.com/docs/devcontainers/attach-container) about how attach VsCode to an existing container._

The container exports 

Apache is configured with _user dir_. It supports home user dir.
All source code placed in `/builder/www` is available from `http://localhost:8080/~builder`.
Read the [configuration file](./config/httpd-userdir.conf).

## Database

The database is available directly from your host through the port number _3306_.

From the container, the database is available from _mariadb_ host. MariaDB is started with new database `dev` and a user `dev` with password `p`.  
Password of root user is `root`.

# Technical points

## Configuration files

Many configuration files are placed in folder _config_. They are copied in the container during the build.

You can edit that files. Don't forget to re-build the image after.

`start-up.sh` is the script executed at start up of the container. It runs apache and change right access for `/dev/dri/card0`. This is necessary to execute Electron.  
_I strongly recommend to not edit this file and let the script be executed at start up of the container !_
