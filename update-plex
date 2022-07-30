#!/bin/bash

# Ensure the file you require is in the ~/Downloads folder, and only that installer,
# if multiple installers are present, all will be run, which is generally undesireable

echo "Installing Plex update"

cd ~/Downloads

# Move the downloaded update file from either disk 2 or 3 to this directory
# mv /media/disk2/plexmediaserver*.deb ~/Downloads
mv /media/disk3/plexmediaserver*.deb ~/Downloads

sudo dpkg -i plexmediaserver*.deb

echo "Removing downloaded Plex installer"

rm plexmediaserver*.deb

echo "Update complete"