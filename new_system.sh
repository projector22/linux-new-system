#!/bin/bash

sudo apt install apt-transport-https curl -yy

wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

up

sudo apt install signal-desktop git neofetch htop ffmpeg youtube-dl brave-browser -yy

sudo dpkg -i -R ~/Installers/FirstRun/

sudo snap install spotify
sudo snap install chromium
sudo snap install joplin-desktop

~/bin/setup-dev-env.sh

bash <(curl -s -S -L https://git.io/install-gam)
