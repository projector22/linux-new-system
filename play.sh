#!/bin/bash
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-user string root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-websever multiselect apache2"
debconf-set-selections <<< "phpmyadmin phpmyadmin/database-type select mysql"
debconf-set-selections <<< "phpmyadmin phpmyadmin/setup-password password root" 

sudo apt install phpmyadmin -y
