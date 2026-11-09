#!/bin/bash
set -euo pipefail

REPO=https://github.com/projector22/linux-new-system.git
INSTALL_DIR="$HOME/.lns"
BIN_DIR="$HOME/bin"

mkdir -p "$BIN_DIR"

if [[ -d "$INSTALL_DIR" ]]; then
	rm -rf "$INSTALL_DIR"
fi
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

printf "%s" "Installing..."
git clone "$REPO" . >/dev/null 2>&1

chmod +x "$INSTALL_DIR/src/linux-new-system.sh"

if [[ -L "$BIN_DIR/lns" ]]; then
	unlink "$BIN_DIR/lns"
fi
ln -s "$INSTALL_DIR/src/linux-new-system.sh" "$BIN_DIR/lns"

printf " %s\n%s" "Done" "Configuring..."
bash "$INSTALL_DIR/src/linux-new-system.sh" --init
printf " %s\n" "Done"