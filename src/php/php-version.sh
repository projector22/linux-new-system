#!/bin/bash

##
# This tool lets you easily switch installed php versions.
#
# @author Gareth Palmer <bravdthepally@gmail.com>
##

if ! command -v update-alternatives >/dev/null 2>&1; then
    echo "Error: update-alternatives is not installed or not in PATH." >&2
    exit 1
fi

sudo update-alternatives --config php
