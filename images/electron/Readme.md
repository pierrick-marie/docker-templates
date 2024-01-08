Démarrer Electron dans un container docker
==========================================

Source : https://trigodev.com/blog/develop-electron-in-docker

# Structure du projet

Bien respecter la structure suivante :

```
 <root>
  - package.json
  - package-lock.json
  - Dockerfile
  - src∕
     | - main.js
     \ - index.html
```

# Build image

L'option `-t` (target ?) permet de spécifier le nom de l'image qui va être créée.

```sh
docker build -t electron-wrapper .
```

# Run

La commande crée un container, monte le dossier du répertoire courant et ouvre une invite de commande bash :

```sh
docker run -v --privileged /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v`pwd`/src:/app/src --rm -it electron-wrapper bash
```

Depuis l'invite de commande dans le container, exécuter la commande suivante pour lancer electron :

```sh
npm start
```

# Hello world Electro

Source : https://www.electronjs.org/fr/docs/latest/tutorial/quick-start

