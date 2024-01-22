#!/bin/sh

echo "** Configuring node container..."

# Setup video right access for builder user
sudo chmod 0666 /dev/dri/card0 &&
sudo chgrp video /dev/dri/card0 &&

echo "** Node container is ready!"

# End of script
# Start bash to keep running
bash

