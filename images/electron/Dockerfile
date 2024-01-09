# use the version that corresponds to your electron version
# FROM pimarie/node:electron-2024-01-08
FROM node:latest

# install electron dependencies or more if your library has other dependencies
# RUN apt-get update && apt-get install \
#     git libx11-xcb1 libxcb-dri3-0 libxtst6 libnss3 libatk-bridge2.0-0 libgtk-3-0 libxss1 libasound2 libdrm2 libgbm1 \
#     -yq --no-install-suggests --no-install-recommends \
#     && apt-get clean && rm -rf /var/lib/apt/lists/*

# install chromium to get all dependancies required
RUN apt-get update && apt-get install chromium \
	-yq --no-install-suggests \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* 

# copy the source into /app
# WORKDIR /app
# COPY . .
# RUN chown -R node /app

# install node modules and perform an electron rebuild
# USER node
# RUN npm install
# RUN npx electron-rebuild

# Electron needs root for sand boxing
# see https://github.com/electron/electron/issues/17972
# USER root
# RUN chown root /app/node_modules/electron/dist/chrome-sandbox
# RUN chmod 4755 /app/node_modules/electron/dist/chrome-sandbox

USER root

RUN echo 'root:root' | chpasswd

# user node have to belong to video group to avoid warnings
RUN usermod -a -G video node

# Electron doesn't like to run as root
USER node
CMD bash

# To run the container :
# docker run -v --privileged /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v`pwd`/src:/app/src --rm -it electron-wrapper bash

# And then start electron :
# npm start