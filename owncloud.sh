#!/bin/bash
install() {
    sudo aptitude install libapache2-mod-php5 php5-gd php5-sqlite  php5-mysql php5-curl  php5-intl php5-mcrypt php5-gmp php-apc  php5-imagick 
    wget https://download.owncloud.org/community/owncloud-7.0.4.tar.bz2
    tar -xvf owncloud-7.0.4.tar.bz2
    #TODO check integrity via md5
    #TODO check authenticity via GPG
    mv owncloud "$APACHE_DOCUMENTROOT/"
    #open hostname/owncloud/install
    mkdir "$APACHE_DOCUMENTROOT/owncloud/data/"
    sudo chown -R www-data:www-data "$APACHE_DOCUMENTROOT/owncloud/"{config/,data/,apps/}
}