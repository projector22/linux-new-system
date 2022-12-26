#!/bin/bash

function echo_and_cd() {
    echo -n "Setting up $1... "
    cd $APPS_DIR
}

echo_and_cd "UP"
git clone --quiet https://github.com/projector22/up.git
ln -s $APPS_DIR/up/up.sh $INSTALL_DIR/up
echo "Done"

echo_and_cd "LAMP"
git clone --quiet https://github.com/projector22/lamp-tools.git
ln -s $APPS_DIR/lamp-tools/lamp-tools.sh $INSTALL_DIR/lamp
echo "Done"