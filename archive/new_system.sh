#!/bin/bash

function install_signal() {
    wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
    cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
    sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

    sudo apt install signal-desktop -yy
}


function install_brave() {
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
}


function install_flatpak() {
    sudo apt install flatpak -yy
    sudo apt install gnome-software-plugin-flatpak -yy
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

# @todo - See if we can wget these apps.
sudo dpkg -i -R ~/Installers/FirstRun/

sudo apt install apt-transport-https curl -yy

install_signal
install_brave

up

sudo apt install git neofetch htop ffmpeg youtube-dlp brave-browser -yy

sudo snap install spotify
sudo snap install chromium
sudo snap install joplin-desktop
sudo snap install plex-desktop

install_flatpak

# flatpak install flathub com.plexamp.Plexamp

# ~/bin/setup-dev-env.sh

# bash <(curl -s -S -L https://git.io/install-gam)

# sudo reboot now

echo "All complete"
