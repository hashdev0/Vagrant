#!/usr/bin/env bash

apt-get update
apt-get install -y apache2

if ! [ -L /var/www ]; then
    rm -rf /var/www
    ln -fs /vagrant /var/www
    sed -i "s#DocumentRoot /var/www/html#DocumentRoot /var/www#g" /etc/apache2/sites-available/000-default.conf
fi
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

# Installing PHP and it's dependencies
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt
sudo apt-get install php5-intl


#Installing Symfony
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony
