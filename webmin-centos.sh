#!/bin/bash

sudo yum -y update
sudo yum -y install git

sudo (echo "[Webmin]
name=Webmin Distribution Neutral
baseurl=http://download.webmin.com/download/yum
enabled=1
gpgcheck=1
gpgkey=http://www.webmin.com/jcameron-key.asc" >/etc/yum.repos.d/webmin.repo;
yum -y install webmin)

sudo firewall-cmd --zone=public --add-port=10000/tcp --permanent
sudo firewall-cmd --reload
