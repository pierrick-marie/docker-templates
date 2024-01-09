#!/bin/sh

# Wait until MariaDB is ready
function waitMariaDB {
	error=$(sudo mariadb-admin ping -u root 2>&1);
	nbTry=0;

	# 5 try before stop waiting
	while [ "mysqld is alive" != "$error" ] && [ $nbTry -le 5 ]; do
		echo "** Waiting MariaDB..."
		((nbTry += 1))
		sleep 1;
		error=$(sudo mariadb-admin ping -u root 2>&1);
	done;

	if [ "mysqld is alive" == "$error" ]; then 
		echo "** MariaDB is ready";
	fi 
}

# This script is run at start up
# WARNING : Do not override the start command !

echo "** Configuring Web Dev container..."

# Start MariaDB at first
sudo /usr/bin/mariadbd-safe --datadir=/var/lib/mysql/ --nowatch &&

# Setup video right access for builder user
sudo chmod 0666 /dev/dri/card0 &&
sudo chgrp video /dev/dri/card0 &&

# Démarrer Apache
sudo apachectl start &&

# Démarrer MariaDB
# --nowatch : run MariaDB in background. The prompt is read after MariaDB is fully start.
# sudo /usr/bin/mariadbd-safe --datadir=/var/lib/mysql/ &

# Wait MariaDB is ready
waitMariaDB

# Configure MariaDB
echo "** Configure MariaDB"
sudo mariadb -u root < /usr/local/bin/secure-mariadb.sql &&

# Restart server
# echo "** Reboot MariaDB"
# sudo /usr/bin/mariadbd-safe --datadir=/var/lib/mysql/ --nowatch &&

echo "** Web Dev container is ready!"

# End of script
# Start bash to keep running
bash

