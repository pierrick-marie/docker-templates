FROM manjarolinux/base:latest

# install basic packages
RUN pacman -Syy --noconfirm --needed \
    base-devel \
    shadow \
    git \
    git-lfs \
    cmake \
    libseccomp \
    libtool \
    python-pip

# install apache, mariadb, php, and PhpMyAdmin
# doc : https://www.armandphilippot.com/article/installer-lamp-manjaro-linux
# or : https://forum.manjaro.org/t/howto-install-apache-mariadb-mysql-php-lamp/13000
RUN pacman -Syy --noconfirm --needed apache mariadb php php-apache phpmyadmin

# Configure MariaDB
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Configure PHP
COPY ./config/php.ini /etc/php/php.ini

# Configure Apache
COPY ./config/httpd.conf /etc/httpd/conf/httpd.conf
COPY ./config/httpd-userdir.conf /etc/httpd/conf/extra/httpd-userdir.conf
COPY ./config/httpd-phpmyadmin.conf /etc/httpd/conf/extra/httpd-phpmyadmin.conf

# Configure PhpMyAdmin
COPY ./config/httpd-phpmyadmin.conf /usr/share/webapps/phpMyAdmin/config.inc.php

# install node
RUN pacman -Syy --noconfirm --needed nodejs

# install chromium to get all needed for electron
RUN pacman -Syy --noconfirm --needed chromium

# install emacs-nox, just because I like him :) 
RUN pacman -Syy --noconfirm --needed emacs-nox

# clean install dir
RUN rm -f /var/cache/pacman/pkg/*

# Script de demarrage
COPY ./config/start-up.sh /usr/local/bin/start-up.sh
# Rendre le script exécutable
RUN chmod +x /usr/local/bin/start-up.sh

# Script pour configurer MariaDB
COPY ./config/secure-mariadb.sql /usr/local/bin/secure-mariadb.sql

# Changing root password to... "root" !
# Be carefull with that !
RUN echo "root:root" | chpasswd
# Setup bashrc
RUN echo "cd ;" > ~/.bashrc
# Setup emacs
RUN echo "(setq make-backup-files nil)" > ~/.emacs
# Add color in pacman
RUN sed -i "s/^#Color/Color/" /etc/pacman.conf

# user 'builder' can be used as the running user for applications prohibiting root usage (pacman)
# Default build from https://github.com/manjaro/manjaro-docker
RUN id -u builder &>/dev/null || (useradd -d /builder -m builder && \
	echo "builder ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers) 
# Setup bash
RUN echo "cd ;" > ~/.bashrc
# Add builder to video group, needed by electron ;)
RUN usermod -a -G video builder

# Start up script to finish configuration and run services
# Do not edit this line !
CMD ["/usr/local/bin/start-up.sh"]

# Use builder user
USER builder

# Setup emacs
RUN echo "(setq make-backup-files nil)" > ~/.emacs
# Create directory to develop
RUN mkdir ~/projects
# Create www directory for apache user dir 
RUN mkdir ~/www
# Setup read access for apache
RUN chmod -R 755 ~
RUN echo "<2>Hello Manjaro</h2>" > ~/www/index.php && \
	echo "<?php phpinfo(); ?>" >> ~/www/index.php