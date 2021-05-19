#!/bin/bash

##
# @author       Gareth Palmer
# @description  This script allows the @author to set up a dev environment on an Ubuntu type server.
# @version      1.0
##

## Install some basic tools, mysql-server, git and openssh-server
install_mysql() {
    sudo apt update
    sudo apt install git openssh-server mysql-server apache2 -yy
    sudo service apache2 start
    sudo service mysql start
    echo "Complete\n"
}

## Create a user account for mysql
setup_mysql_user() {
    username=$1
    password=$2
    echo "Creating mysql user with the above credentials..."
    echo "Note: this is for a DEV environment and all privileges are being granted. This is not recomended in a PROD environment\n"
    echo "Creating user..."
    sudo mysql --execute="CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
    echo "Assign privileges..."
    sudo mysql --execute="GRANT ALL PRIVILEGES ON *.* TO '$username'@'localhost';"
    echo "Complete\n"
}

## Install php & phpmyadmin
install_php() {
    sudo apt install phpmyadmin php7.4-ldap -yy
    echo "Complete\n"
}

## Configure apache2.conf and enable .htaccess
configure_apache() {
    apache_conf="/etc/apache2/apache2.conf"
    echo "Backing up $apache_conf -> $apache_conf.bak"
    sudo cp $apache_conf $apache_conf.bak
    echo "Enabling .htaccess"
    sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' $apache_conf
    sudo a2enmod rewrite
    sudo service apache2 restart
    echo "Complete\n"
}

## configure PHP to increase post and file size limits
configure_php() {
    ini_path="/etc/php/7.4/apache2/php.ini"
    size="200M"
    echo "Backing up $ini_path -> $ini_path.bak"
    sudo cp $ini_path $ini_path.bak
    echo "Complete\n"

    echo "Setting post_max_size & upload_max_filesize to $size"
    upload=$(grep -F "post_max_size" $ini_path)
    new_upload="post_max_size=$size"
    sudo sed -i "s/$upload/$new_upload/" $ini_path

    post=$(grep -F "upload_max_filesize" $ini_path)
    new_post="upload_max_filesize=$size"
    sudo sed -i "s/$post/$new_psot/" $ini_path
    echo "Complete\n"
}


echo "Step one - install mysql, git and ssh\n"
install_mysql

echo "Step 2. Set up a mysql user account"
read -p "Username: " mysql_username
read -p "Password: " mysql_password
setup_mysql_user $mysql_username $mysql_password

echo "Step 3. Installing phpmyadmin php7.4-ldap"
install_php

echo "Step 4. Configure Apache2 and PHP"
configure_php
configure_apache

echo "Enter a Git global name"
read name
echo "Enter a Git global email account"
read mail

git config --global user.name "$name"
git config --global user.mail "$mail"

echo -e "\nComplete"