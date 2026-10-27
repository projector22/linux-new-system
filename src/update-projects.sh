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

update_mdl() {
    echo "Updating mdl..."
    install-mdl
    echo "Complete"
    return 0
}

update_all() {
    # Clone in any new projects
    bash clone-projects.sh &> /dev/null
    
    # Perform updates
    update_up
    update_mdl
    general_update "Docker Updater" docker-update
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