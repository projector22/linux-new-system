#!/bin/bash

echo_and_cd() {
    echo -n "Setting up $1... "
    cd "$APPS_DIR" || exit 1
    return 0
}

echo "Setting up UP"
curl -fsSL https://raw.githubusercontent.com/projector22/up/master/src/install.sh | bash

echo_and_cd "PLEX UPDATER"
git clone --quiet https://github.com/projector22/plex-updater.git
ln -s "$APPS_DIR"/plex-updater/update-plex.sh "$INSTALL_DIR"/update-plex
echo "Done"

echo -n "Setting up MDL... "
"$SRC_DIR"/install-mdl.sh

echo_and_cd "DOCKER UPDATE"
git clone --quiet https://github.com/projector22/docker-update.git
ln -s "$APPS_DIR"/docker-update/docker-update.sh "$INSTALL_DIR"/docker-update
echo "Done"