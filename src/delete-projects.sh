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
    ["update-lrs-live"]="update-lrs-live-tool"
    ["spotdll"]="ubiquitous-sniffle"
    ["spotdll.json"]="ubiquitous-sniffle"
    ["rebase"]="fictional-pancake"
    ["installer"]="reimagined-bassoon"
)

for tool_name in "${!TOOLS[@]}"; do
    # Unlink the symbolic links
    cd "$INSTALL_DIR" || exit 1
    if [ -L "$tool_name" ]; then
        unlink "$tool_name"
    fi

    # Delete the cloned directories
    cd "$APPS_DIR" || exit 1
    rm -rf "${TOOLS[$tool_name]}"
done
