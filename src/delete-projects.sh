#!/bin/bash

declare -A TOOLS
TOOLS=(
    ["up"]="up"
    ["lamp"]="lamp-tools"
)

for tool_name in "${!TOOLS[@]}"; do
    # Unlink the symbolic links
    cd $INSTALL_DIR
    unlink $tool_name

    # Delete the cloned directories
    cd $APPS_DIR
    rm -rf ${TOOLS[$tool_name]}
done
