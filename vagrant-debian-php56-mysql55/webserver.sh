#!/bin/bash
Sudo -i
apt-get update
apt-get install -y apache2
cd /var/www
sudo chmod 777 -R html
sudo apt-get install -y php5 php5-cli php5-curl php5-gd php5-mysql php5-recode php5-gmp php5-xmlrpc php5-xsl php5-intl php5-mcrypt php5-imagick php5-json libapache2-mod-php5 php5-xdebug
sudo /etc/init.d/apache2 restart
