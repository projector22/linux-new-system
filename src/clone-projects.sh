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

echo_and_cd "LAMP"
git clone --quiet https://github.com/projector22/lamp-tools.git
ln -s "$APPS_DIR"/lamp-tools/lamp-tools.sh "$INSTALL_DIR"/lamp
echo "Done"

echo_and_cd "PLEX UPDATER"
git clone --quiet https://github.com/projector22/plex-updater.git
ln -s "$APPS_DIR"/plex-updater/update-plex.sh "$INSTALL_DIR"/update-plex
echo "Done"

echo_and_cd "LRS LIVE UPDATER"
git clone --quiet https://gitlab.com/projector22/update-lrs-live-tool.git
ln -s "$APPS_DIR"/update-lrs-live-tool/update-lrs-live.sh "$INSTALL_DIR"/update-lrs-live
echo "Done"

echo_and_cd "SPOTDLL"
git clone --quiet https://github.com/projector22/ubiquitous-sniffle.git
ln -s "$APPS_DIR"/ubiquitous-sniffle/spotdll.py "$INSTALL_DIR"/spotdll
ln -s "$APPS_DIR"/ubiquitous-sniffle/spotdll.json "$INSTALL_DIR"/spotdll.json
echo "Done"