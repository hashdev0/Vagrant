#!/usr/bin/env bash

#echo -e "\n--- Updating packages list ---\n"
#apt-get -qq update
#apt-get install -y apache2 libapache2-mod-fastcgi apache2-mpm-worker
#apt-get install -y apache2 

#echo -e "\n--- Install base packages ---\n"
#apt-get -y install vim curl build-essential python-software-properties git > /dev/null 2>&1

#echo -e "\n--- Add some repos to update our distro ---\n"
#add-apt-repository ppa:ondrej/php5 > /dev/null 2>&1
#add-apt-repository ppa:chris-lea/node.js > /dev/null 2>&1

#echo -e "\n--- Updating packages list ---\n"
#apt-get -qq update


#echo -e "\n--- Setting document root to /var/www directory ---\n"
#if ! [ -L /var/www ]; then
#    rm -rf /var/www
#    ln -fs /vagrant /var/www
#    sed -i "s#DocumentRoot /var/www/html#DocumentRoot /var/www#g" /etc/apache2/sites-available/000-default.conf
#fi

#Add Server Name
#echo "ServerName localhost" > /etc/apache2/httpd.conf

#Add Virtual Host
VHOST=$(cat <<EOF
<VirtualHost *:80>
        DocumentRoot "/vagrant/projects/symfony-test/web"
        ServerName Symfony-test

        <directory "/vagrant/projects/symfony-test/web">
                Options Indexes FollowSymLinks
                AllowOverride All
                Order allow,deny
                Allow from all
                Require all granted
        </directory>
</VirtualHost>
EOF
)

VHOST2=$(cat <<EOF
<VirtualHost *:80>
        DocumentRoot "/vagrant/projects"
        ServerName Vagrant-Projects 

        <directory "/vagrant/projects">
                Options Indexes FollowSymLinks
                AllowOverride All
                Order allow,deny
                Allow from all
                Require all granted
        </directory>
</VirtualHost>
EOF
)
#echo "${VHOST}" > /etc/apache2/sites-enabled/vagrant-hosts.conf
#echo "${VHOST2}" > /etc/apache2/sites-enabled/vagrant-projects.conf


#debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
#debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'
#apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql 

# Installing PHP and it's dependencies
#apt-get -y install php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-gd php5-intl

#Enable Modules
#a2enmod rewrite > /dev/null 2>&1


#echo -e "\n--- We definitly need to see the PHP errors, turning them on ---\n"
#sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
#sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

#Installing Symfony
#curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
#chmod a+x /usr/local/bin/symfony

#Install Composor
echo -e "\n--- Installing Composer for PHP package management ---\n"
curl --silent https://getcomposer.org/installer | php > /dev/null 2>&1
mv composer.phar /usr/local/bin/composer

echo -e "\n--- Installing NodeJS and NPM ---\n"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

curl --silent https://npmjs.org/install.sh | sh > /dev/null 2>&1


echo -e "\n--- Installing javascript components ---\n"
npm install -g bower > /dev/null 2>&1
npm install -g "gulpjs/gulp-cli#4.0"

#echo -e "\n--- Updating project components and pulling latest versions ---\n"
#cd /vagrant
#sudo -u vagrant -H sh -c "composer install" > /dev/null 2>&1
#cd /vagrant/client
#sudo -u vagrant -H sh -c "npm install" > /dev/null 2>&1
#sudo -u vagrant -H sh -c "bower install -s" > /dev/null 2>&1
#sudo -u vagrant -H sh -c "gulp" > /dev/null 2>&1

#Install PHPUnit
apt-get -y install phpunit

