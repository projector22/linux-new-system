#!/bin/bash

#This script is meant to run before anything else, once the repo is cloned to install all the bits and pieces I've made for myself

sudo apt install git -yy
sudo apt install openssh-server -yy
sudo apt install curl -yy
sudo apt install flatpak -yy
sudo apt install gnome-software-plugin-flatpak -yy
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo




echo "Enter a Git global name"
read name
echo "Enter a Git global email account"
read mail

git config --global user.name "$name"
git config --global user.mail "$mail"

mkdir ~/bin
cd ~/bin
git clone https://github.com/projector22/linux-new-system.git .
