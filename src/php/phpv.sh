#!/bin/bash

set -e

# Check dependencies
for cmd in update-alternatives; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd is not installed or not in PATH." >&2
        exit 1
    fi
done

# Display current PHP version
if [[ $# -eq 0 ]]; then
    php -v | head -n 1
    exit 0
fi

# Help
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    cat <<EOF
Usage: phpv [VERSION | -c]

Arguments:
  VERSION   Switch to a specific PHP version (e.g. 8.5)
  -c        Detect PHP requirements from composer.lock
  -h        Display this help message

Examples:
  phpv
  phpv 8.5
  phpv 8.2
  phpv -c
EOF
    exit 0
fi

# Get available PHP alternatives
get_php_alternatives() {
    update-alternatives --list php 2>/dev/null || true
}

# Switch PHP version
switch_php() {
    local version="$1"
    local binary

    binary=$(get_php_alternatives | grep -E "/php${version//./\\.}$" | head -n 1)

    if [[ -z "$binary" ]]; then
        echo "Error: PHP $version is not available through update-alternatives." >&2
        echo
        echo "Available versions:"
        get_php_alternatives
        exit 1
    fi

    echo "Switching to PHP $version..."
    sudo update-alternatives --set php "$binary"

    echo
    php -v | head -n 1
}

# Detect suitable PHP version using Composer
if [[ "$1" == "-c" ]]; then
    if [[ ! -f composer.json ]]; then
        echo "Error: No composer.json found in the current directory." >&2
        exit 1
    fi

    if [[ ! -f composer.lock ]]; then
        echo "Error: No composer.lock found. Cannot reliably determine platform requirements." >&2
        exit 1
    fi

    COMPOSER=$(command -v composer || true)

    if [[ -z "$COMPOSER" ]]; then
        echo "Error: Composer is not installed or not in PATH." >&2
        exit 1
    fi

    echo "Detecting compatible PHP version from Composer dependencies..."

    # Test installed PHP alternatives, preferring the newest.
    mapfile -t versions < <(
        get_php_alternatives |
        sed -nE 's|.*/php([0-9]+\.[0-9]+)$|\1|p' |
        sort -Vr
    )

    if [[ ${#versions[@]} -eq 0 ]]; then
        echo "Error: No PHP alternatives found." >&2
        exit 1
    fi

    for version in "${versions[@]}"; do
        binary=$(get_php_alternatives | grep -E "/php${version//./\\.}$" | head -n 1)

        echo "Checking PHP $version..."

        if "$binary" "$COMPOSER" check-platform-reqs --lock --no-dev >/dev/null 2>&1; then
            echo
            echo "Found compatible PHP version: $version"
            switch_php "$version"
            exit 0
        fi
    done

    echo
    echo "Unable to find a suitable PHP version for this project." >&2
    echo "Check your composer.json requirements and installed PHP extensions." >&2
    exit 1
fi

# Validate version argument
if [[ ! "$1" =~ ^[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Invalid PHP version '$1'." >&2
    echo "Expected format: MAJOR.MINOR (e.g. 8.5)" >&2
    exit 1
fi

switch_php "$1"

