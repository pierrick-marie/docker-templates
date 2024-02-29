Docker containers environments for web development
==================================================

This repository is a docker compose and Dockerfiles to create ready to use containers for web development.

The purpose is providing fully functional containers to develop web applications. No package, language nor library is required on your host. Every thing you need is provided by the containers.

You just need VsCode to [attach your editor to the container](https://code.visualstudio.com/docs/devcontainers/attach-container). It's very easy fully functional !

_I created that containers to isolate development environment from my host. By this way, my host, an Ubuntu based distribution, "stay clean and stable" while my development environment stay up to date with an an ArchLinux based distribution._

# Containers available

This project provides the following containers:

* [MariaDB latest](https://hub.docker.com/_/mariadb)
* [PhpMyAdmin latest](https://hub.docker.com/_/phpmyadmin)
* [Wordpress latest](https://hub.docker.com/_/wordpress)
* [PHP](https://www.php.net/) environment based on [Manjaro](https://hub.docker.com/r/manjarolinux/base) with [composer](https://getcomposer.org/) and [mariadb-client](https://software.manjaro.org/package/mariadb-clients). The container is also based on [Manjaro](https://hub.docker.com/r/manjarolinux/base).
* [Node.js](https://nodejs.org/) and [Electron environment](https://www.electronjs.org/). The container is also based on [Manjaro](https://hub.docker.com/r/manjarolinux/base).

# Repositories

```
 - README.md
 - LICENCE
 - php-Dockerfile
 - node-Dockerfile
 - docker-compose.yml
 - config/
   | - apache-start.sh
   | - httpd.conf
   | - httpd-userdir.conf
   | - php.ini
   | - node-start.sh
   | - bashrc
   \ - databases/
       | - 01-wordpress.sql
	 \ - 02-dev.sql
```

* `php-Dockerfile` is the Dockerfile to create the PHP container
* `node-Dockerfile` is the Dockerfile to create a node and electron container
* `config/` contains all configuration files required for the containers
* `docker-compose.yml` creates all containers : MariaDB, PhpMyAdmin, Wordpress, PHP and NodeJS with Electron

# Build and run the containers

You just have to execute the following command:

```sh
docker compose up
```

That command builds images with all services, volumes and network.

Once the container are started, I strongly suggest to use VsCode from your host to develop your projects inside the container.  
_Read that [documentation](https://code.visualstudio.com/docs/devcontainers/attach-container) about how attach VsCode to an existing container._

# Networks

All containers use the docker network named `my-dev-network`.

# Volumes

The docker compose creates two docker volumes. The first is `db` for MariaDB. The second is `wordpress` for wordpress.

# MariaDB

The database is MariaDB. It is available from localhost on port number `3307`.  
The database is also available from the docker network `my-dev-network` on the host `mariadb` with the default port `3306`.

Root password is `root` :D  
All data are stored in the docker volume `db`.

One database is configured for Wordpress. There is a user `wordpress` with password `p` to access to the database.  
I suggest to use PhpMyAdmin to create new databases for other projects in the same MariaDB container. (@see PhpMyAdmin bellow.)
I know it's not a "docker proof" approach, but my purpose is providing a complete and ready to use environment to develop.
It's not a production environment ready to deploy on the web. As a consequence I choose the simplicity with one container and many databases instead of many containers for one database each.

### Wordpress

The name of the database is _wordpress_.  
The user name for that database is _wordpress_ and it's password is _p_.

That database is used by the wordpress container.

### Dev

The name of the database is _dev_DB.  
The user name for that database is _wordpress_ and it's password is _p_.

That database is free to use for any web application.

# PhpMyAdmin

PhpMyAdmin is configured with MariaDB. You can access to its interface here:  [http://localhost:8001](http://localhost:8001).

# Wordpress

Wordpress is configured to use MariaDB and the database _wordpress_. You can access to the web site here: [http://localhost:8002](http://localhost:8002).

# PHP

Once the container is started, I strongly suggest to use VsCode from your host to develop your projects inside the container.  
_Read that [documentation](https://code.visualstudio.com/docs/devcontainers/attach-container) about how attach VsCode to an existing container._

The container exports many ports:

 - localhost:8080 -> 80
 - localhost:8081 -> 8081
 - localhost:8082 -> 8082
 - localhost:8083 -> 8083
 - localhost:8084 -> 8084
 - localhost:8085 -> 8085

### Apache

Apache is configured with _user dir_. It supports home user dir.
You can place your web site in `/builder/www`. It will be is available at [http://localhost:8080/~builder](http://localhost:8080/~builder).
For more information you can read the [configuration file](./config/httpd-userdir.conf).

### PHP server

You can use one of the exported port number with PHP server.  
For example, to export your web site on localhost, you can use the following command:

```sh
php -S 0.0.0.0:8081 -t <your-web-site>
```

You have to use the IP address `0.0.0.0` and one of the following port number exported by the container.

# NodeJs and Electron

Once the container is started, I strongly suggest to use VsCode from your host to develop your projects inside the container.  
_Read that [documentation](https://code.visualstudio.com/docs/devcontainers/attach-container) about how attach VsCode to an existing container._

The container exports many ports:

 - localhost:3000 -> 3000
 - localhost:3001 -> 3001
 - localhost:3002 -> 3002
 - localhost:3003 -> 3003
 - localhost:3004 -> 3004
 - localhost:3005 -> 3005

You can use one of that port number to export your web application on localhost.

### Electron

Electron is ready to use out the box from the container. You just have to install Electron with npm and start the project.

# Java environment

_Still under development..._