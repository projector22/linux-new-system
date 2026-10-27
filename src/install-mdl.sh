#!/bin/bash

##
# Install the latest stable mdl release for linux into ~/.local/bin/mdl
##

set -euo pipefail

REPO="projector22/ubiquitous-sniffle"
BIN_DIR="$HOME/.local/bin"

case "$(uname -m)" in
    x86_64 | amd64)
        ARCH=amd64
    ;;

    aarch64 | arm64)
        ARCH=arm64
    ;;

    *)
        echo "Unsupported architecture: $(uname -m)" >&2
        exit 1
    ;;
esac

# releases/latest redirects to the newest non-prerelease tag
TAG=$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest")
TAG=${TAG##*/}
if [[ ! $TAG =~ ^v[0-9] ]]; then
    echo "Could not determine latest mdl release" >&2
    exit 1
fi

ASSET="mdl_${TAG}_linux_${ARCH}"
BASE_URL="https://github.com/$REPO/releases/download/$TAG"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo -n "Installing mdl $TAG... "
curl -fsSL -o "$TMP_DIR/$ASSET.tar.gz" "$BASE_URL/$ASSET.tar.gz"
curl -fsSL -o "$TMP_DIR/checksums.txt" "$BASE_URL/checksums.txt"

(cd "$TMP_DIR" && grep " $ASSET.tar.gz\$" checksums.txt | sha256sum --check --quiet)

tar -xzf "$TMP_DIR/$ASSET.tar.gz" -C "$TMP_DIR"
mkdir -p "$BIN_DIR"
install -m 755 "$TMP_DIR/$ASSET/mdl" "$BIN_DIR/mdl"
echo "Done"
