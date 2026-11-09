#!/bin/bash

export INSTALL_DIR="$HOME/bin"
export APPS_DIR="$INSTALL_DIR/apps"
export SRC_DIR="$INSTALL_DIR/src"

show_help() {
    echo "Usage: $(basename "$0") [OPTION]"
    echo
    echo "Manage locally installed applications."
    echo
    echo "Options:"
    echo "  --init       Clone and initialise projects"
    echo "  --clear      Delete existing projects"
    echo "  --update     Update all projects"
    echo "  --reset      Perform a full refresh of all projects"
    echo "  -h, --help   Display this help message"
    echo
    echo "Examples:"
    echo "  $(basename "$0") --init"
    echo "  $(basename "$0") --update"
    echo "  $(basename "$0") --reset"
}

initialize_app() {
    cd "$SRC_DIR" || exit 1
    bash clone-projects.sh
}

clear_apps() {
    cd "$SRC_DIR" || exit 1
    bash delete-projects.sh
}

update_apps() {
    cd "$SRC_DIR" || exit 1
    bash update-projects.sh
}

reset_apps() {
    cd "$SRC_DIR" || exit 1
    bash full-refresh.sh
}

case "$1" in
    --init)
        initialize_app
        ;;

    --clear)
        clear_apps
        ;;

    --update)
        update_apps
        ;;

    --reset)
        reset_apps
        ;;

    -h|--help)
        show_help
        ;;

    *)
        show_help
        exit 1
        ;;
esac