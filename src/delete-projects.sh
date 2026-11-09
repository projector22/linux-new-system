#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/projector22/up/master/src/uninstall.sh | bash

APP_DIR="$HOME/.lns/app"
SRC_DIR="$HOME/.lns/src"
BIN_DIR="$HOME/bin"

declare -A TOOLS
##
# $1 = Symbolic link name.
# $2 = containing folder name.
##
TOOLS=(
    ["lamp"]="lamp-tools"
    ["update-plex"]="plex-updater"
    ["update-lrs-live"]="update-lrs-live-tool"
    ["spotdll"]="ubiquitous-sniffle"
    ["spotdll.json"]="ubiquitous-sniffle"
    ["rebase"]="fictional-pancake"
    ["installer"]="reimagined-bassoon"
    ["docker-update"]="docker-update"
)

for tool_name in "${!TOOLS[@]}"; do
    # Unlink the symbolic links
    cd "$BIN_DIR" || exit 1
    if [ -L "$tool_name" ]; then
        unlink "$tool_name"
    fi

    # Delete the cloned directories
    cd "$APP_DIR" || exit 1
    rm -rf "${TOOLS[$tool_name]}"
done

"$SRC_DIR"/mdl/uninstall-mdl.sh