#!/bin/bash

echo "Installing & setting up LAMP"

sudo apt update

# Check to see if tasksel is installed
sudo apt install tasksel -yy

# Install the lamp stack
sudo tasksel install lamp-server

echo "Starting MySQL & Apache2 services"

# Start the apache2 and mysql service
sudo systemctl start apache2.service || sudo service mysql start
sudo systemctl start mysql.service || sudo service apache2 start

echo "Allow Apache2 through the firewall"

# Allow apache2 through the firewall
sudo ufw allow in "Apache Full"

printf "\n\nSetting up MySQL\n\n"
pass=0
printf "Enter the desired username\n"
read username
while [ $pass -ne 1 ]; do
  printf "\nEnter desired password\n"
  read password
  printf "\nAgain\n"
  read testpassword
  if [ $password == $testpassword ]; then
    printf "\nPasswords match\n\n"
    pass=1
  else
    printf "\nPasswords do not match\n"
  fi
done

echo "Creating MySQL user $username"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$username'@'localhost' IDENTIFIED BY '$password';"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "Setting up phpMyAdmin"
# WIP
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-user string root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-websever multiselect apache2"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/database-type select mysql"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/setup-password password root"

sudo apt install phpmyadmin -y

# Restart apache2 service
sudo systemctl restart apache2 || sudo service apache2 restart