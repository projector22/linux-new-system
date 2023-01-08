#!/bin/bash

##
# @param $1 Text feed back in uppercase
# @param $2 Directory of tool
##
general_update() {
    echo -n "Updating $1... "
    cd "$APPS_DIR"/"$2" || exit 1
    git pull
    return 0
}

update_up() {
    general_update up up
    return 0
}

update_spotdll() {
    general_update "Spotdll" ubiquitous-sniffle
    echo -n "Updating requirements for Spotdll... "
    pip3 install -U -r "$APPS_DIR"/"$2"ubiquitous-sniffle/requirements.txt &> /dev/null
    echo "Complete"
    return 0
}

update_all() {
    # Clone in any new projects
    bash clone-projects.sh &> /dev/null
    
    # Perform updates
    update_up
    general_update "LAMP Tools" lamp-tools
    general_update "Plex Updater Tool" plex-updater
    general_update "Update LRS Live Tool" update-lrs-live-tool
    update_spotdll
    general_update "Rebase Master" fictional-pancake
    general_update "Installer Tool" reimagined-bassoon
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