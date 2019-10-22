#!/bin/bash

sudo apt update

sudo apt install apache2 -yy
sudo apt install mysql-server -yy
sudo apt install php7.2 libapache2-mod-php7.2 php-mysql -yy
sudo apt install php-curl php-json php-cgi -yy

sudo ufw allow in "Apache Full"

sudo a2dismod mpm_event
sudo a2enmod mpm_prefork

sudo systemctl restart apache2