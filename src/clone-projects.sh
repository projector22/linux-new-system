#!/bin/bash

echo -n "Setting up UP..."
cd $APPS_DIR
git clone --quiet https://github.com/projector22/up.git 2>&0
ln -s $APPS_DIR/up/up.sh $INSTALL_DIR/up 2>&0
echo " Done"