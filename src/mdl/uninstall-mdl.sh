#!/bin/bash

##
# Remove mdl installed by install-mdl.sh from ~/.local/bin/mdl
##

set -euo pipefail

BIN="$HOME/.local/bin/mdl"

echo -n "Uninstalling mdl... "
if [ -e "$BIN" ]; then
    rm "$BIN"
    echo "Done"
else
    echo "Not installed"
fi
