#!/bin/bash

echo_and_cd() {
    echo -n "Setting up $1... "
    cd "$APPS_DIR" || exit 1
    return 0
}

echo_and_cd "UP"
git clone --quiet https://github.com/projector22/up.git
ln -s "$APPS_DIR"/up/up.sh "$INSTALL_DIR"/up
echo "Done"

echo_and_cd "PLEX UPDATER"
git clone --quiet https://github.com/projector22/plex-updater.git
ln -s "$APPS_DIR"/plex-updater/update-plex.sh "$INSTALL_DIR"/update-plex
echo "Done"

echo_and_cd "SPOTDLL"
git clone --quiet https://github.com/projector22/ubiquitous-sniffle.git
ln -s "$APPS_DIR"/ubiquitous-sniffle/spotdll.py "$INSTALL_DIR"/spotdll
pip3 install -r "$APPS_DIR"/ubiquitous-sniffle/requirements.txt &> /dev/null
echo "Done"

echo_and_cd "DOCKER UPDATE"
git clone --quiet https://github.com/projector22/docker-update.git
ln -s "$APP_DIR"/docker-update/docker-update.sh "$INSTALL_DIR"/docker-update
echo "Done"