#!/bin/bash

echo "Installing & setting up LAMP"

sudo apt update

# Check to see if tasksel is installed
if hash tasksel 2>/dev/null; then
  sudo apt install tasksel -yy
fi

# Install the lamp stack
sudo tasksel install lamp-server -yy

echo "Starting MySQL & Apache2 services"

# Start the apache2 and mysql service
if hash systemctl 2>/dev/null; then
  sudo systemctl start apache2.service
  sudo systemctl start mysql.service
else
  sudo service mysql start
  sudo service apache2 start
fi 

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

sudo apt install phpmyadmin -y

# Restart apache2 service
if hash systemctl 2>/dev/null; then
  sudo systemctl restart apache2
else
  sudo service apache2 restart
fi