#!/bin/bash

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
    sudo apt install phpmyadmin php7.4-ldap
}

configure_apache() {
    sudo cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak
    
}



# Step 1 - Apt update and install git, openssh-server mysql-server
# echo "Step one - install mysql, git and ssh\n"
# install_mysql

# Step 2 - Set up mysql.
# echo "Step 2. Set up a mysql user account"
# read -p "Username: " mysql_username
# read -p "Password: " mysql_password

mysql_username='gp_user'
mysql_password='ucoUnVNvqQ4YnRmM'

# setup_mysql_user $mysql_username $mysql_password

# echo "Step 3. Installing phpmyadmin php7.4-ldap"
# install_php








# sudo mysql --execute="SHOW DATABASES;"