!#/bin/bash
echo "Installing Apache"
sudo yum clean all
sudo yum -y install httpd
sudo nano /etc/httpd/conf/httpd.conf
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Installing phpMyAdmin
sudo yum -y install epel-release
sudo yum -y install phpmyadmin
echo "Replace the 127.0.0.1 with 192.168.1.0/24
sudo nano /etc/httpd/conf.d/phpMyAdmin.conf
sudo systemctl restart httpd

sudo yum install mariadb-server

# https://serverfault.com/questions/707763/samba-not-allowing-access-to-var-www-folder
sudo setenforce 0
