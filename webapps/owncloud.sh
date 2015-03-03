#!/bin/bash
workdir="$PWD"

_main() {
source read_ini.sh
read_ini nz-webapps.ini

case "$1" in
    "install") _install ;;
    *) echo "Unsupported operation";;
esac
}


_install() {
    #sudo aptitude install libapache2-mod-php5 php5-gd php5-sqlite  php5-mysql php5-curl  php5-intl php5-mcrypt php5-gmp php-apc  php5-imagick #TODO create a metapackage for this
    cd "$workdir"
    #wget "$INI__owncloud_url" -O owncloud-latest.tar.bz2
    #tar -xvf owncloud-latest.tar.bz2
    #TODO check integrity via md5
    #TODO check authenticity via GPG
    if [ -d "$APACHE_DOCUMENTROOT/$INI__owncloud_dir" ]
        then echo 'owncloud is already installed! please uninstall it before continuing.'; return 1
    fi
    mkdir "$APACHE_DOCUMENTROOT/owncloud/data/"
    #prompt to open hostname/owncloud/install
    #sudo chown -R www-data:www-data "$APACHE_DOCUMENTROOT/owncloud/"{config/,data/,apps/}
    #TODO install apps
}


_installapps() {
echo "not implemented"
}

########################

_main "$1"