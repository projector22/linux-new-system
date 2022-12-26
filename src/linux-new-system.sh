#!/bin/bash

export INSTALL_DIR=~/bin
export APPS_DIR=$INSTALL_DIR/apps
export SRC_DIR=$INSTALL_DIR/src

function initialize_app() {
    cd $SRC_DIR
    bash clone-projects.sh
    return 0
}

function clear_apps() {
    cd $SRC_DIR
    bash delete-projects.sh
    return 0
}

function update_apps() {
    cd $SRC_DIR
    bash update-projects.sh
    return 0
}

case $1 in
    --init)
    initialize_app
    ;;

    --clear)
    clear_apps
    ;;

    --update)
    update_apps
    ;;

    *)
    echo "Please use one parse one of the appropriate arguments."
    ;;
esac
