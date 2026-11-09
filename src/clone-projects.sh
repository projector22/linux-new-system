#!/bin/bash

APP_DIR="$HOME/.lns/app"
SRC_DIR="$HOME/.lns/src"
BIN_DIR="$HOME/bin"
mkdir -p "$APP_DIR"

echo_and_cd() {
    echo -n "Setting up $1... "
    cd "$APP_DIR" || exit 1
    return 0
}

echo "Setting up UP"
curl -fsSL https://raw.githubusercontent.com/projector22/up/master/src/install.sh | bash

echo_and_cd "PLEX UPDATER"
git clone --quiet https://github.com/projector22/plex-updater.git
ln -s "$APP_DIR"/plex-updater/update-plex.sh "$BIN_DIR"/update-plex
echo "Done"

echo -n "Setting up MDL... "
"$SRC_DIR"/mdl/install-mdl.sh

echo_and_cd "DOCKER UPDATE"
git clone --quiet https://github.com/projector22/docker-update.git
ln -s "$APP_DIR"/docker-update/docker-update.sh "$BIN_DIR"/docker-update
echo "Done"