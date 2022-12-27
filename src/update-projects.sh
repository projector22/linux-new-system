#!/bin/bash

##
# @param $1 Text feed back in uppercase
# @param $2 Directory of tool
##
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

    general_update "LAMP Tools" lamp-tools
    general_update "Plex Updater Tool" plex-updater
    general_update "Update LRS Live Tool" update-lrs-live-tool
    general_update "Update Spotdll" ubiquitous-sniffle

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