#!/bin/bash
set -euo pipefail

INSTALL_DIR="$HOME/.lns"
BIN_DIR="$HOME/bin"

printf "%s" "Uninstalling LNS..."

if [[ -L "$BIN_DIR/lns" ]]; then
	unlink "$BIN_DIR/lns"
fi

if [[ -d "$INSTALL_DIR" ]]; then
	rm -rf "$INSTALL_DIR"
fi

printf " %s\n" "Done"
