#!/bin/bash

function general_update() {
    echo -n "Updating $1... "
    cd $APPS_DIR/$2
    git pull
    return 0
}

function update_up() {
    general_update up up
    return 0
}

function update_all() {
    update_up

    general_update lamp-tools lamp-tools

    return 0
}

case $1 in
    --only-up)
    update_up
    ;;

    *)
    update_all
    ;;
esac