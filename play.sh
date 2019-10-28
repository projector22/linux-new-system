#!/bin/bash
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-user string root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-websever multiselect apache2"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/database-type select mysql"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/setup-password password root" 

sudo apt install phpmyadmin -y

