#!/bin/bash

function update_up() {
    echo "UPDATING up"
    cd $APPS_DIR/up
    git pull
    return 0
}

function update_all() {
    update_up
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