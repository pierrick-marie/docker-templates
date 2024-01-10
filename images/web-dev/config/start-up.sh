#!/bin/sh

echo "** Configuring Web Dev container..."

# Start apache
sudo apachectl start &&

# Setup video right access for builder user
sudo chmod 0666 /dev/dri/card0 &&
sudo chgrp video /dev/dri/card0 &&

echo "** Web Dev container is ready!"

# End of script
# Start bash to keep running
bash

