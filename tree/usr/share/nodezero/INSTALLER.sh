#!/bin/bash
set -o errexit
###TEMPORARY VARS
export NZ_PATH="."
export APACHE_DOCUMENTROOT="/var/www"
export NZ_USER="cornizardt"
export APACHE_GROUP="www-data"
set -o nounset



_NzListWebapps() { #Web applications installation/uninstallation menu
WaManifests=$(find $NZ_PATH/webapps/ -type f -name "*.manifest")
for Wa in $WaManifests
do
	source "$Wa"
	if [ -d /var/www/$AppWwwDir ]; then AppStatus="INSTALLED"; else AppStatus="Not installed"; fi
	echo " * $(basename -s .manifest $Wa) - $AppDescription - $AppStatus"
done


SelectedApp=""
read -p "Type the name of the app to install/uninstall (e.g. Roundcube, WordPress...): " UserSelection
if [ -f $NZ_PATH/webapps/$UserSelection.manifest ]
	then source $NZ_PATH/webapps/$UserSelection.manifest
	if [ -d /var/www/$AppWwwDir ]
		then _NzUninstallWebapp $NZ_PATH/webapps/$UserSelection.manifest
		else _NzInstallWebapp $NZ_PATH/webapps/$UserSelection.manifest
	fi
fi

}

_NzListWebapps