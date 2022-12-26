#!/bin/bash

# Unlink the symbolic links
cd $INSTALL_DIR
unlink up

# Delete the cloned directories
cd $APPS_DIR
rm -rf up