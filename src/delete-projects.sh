#!/bin/bash

declare -A TOOLS
##
# $1 = Symbolic link name.
# $2 = containing folder name.
##
TOOLS=(
    ["up"]="up"
    ["lamp"]="lamp-tools"
    ["update-plex"]="plex-updater"
)

for tool_name in "${!TOOLS[@]}"; do
    # Unlink the symbolic links
    cd $INSTALL_DIR
    unlink $tool_name

    # Delete the cloned directories
    cd $APPS_DIR
    rm -rf ${TOOLS[$tool_name]}
done
