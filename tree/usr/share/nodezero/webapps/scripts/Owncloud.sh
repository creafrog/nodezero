#!/bin/bash
#Ownlcoud install/remove script

if [ "$1" = "install ]
then
	TempDir=$(mktemp -d)
	cd $TempDir
	wget http://download.owncloud.org/community/owncloud-latest.tar.bz2
	aunpack owncloud-latest.tar.bz2
	mv owncloud $APACHE_DOCUMENTROOT/$AppWwwDir
	cd
	rmdir $TempDir
elif [ "$1" = "uninstall" ]
	#TODO: do a backup
	#rm -r $APACHE_DOCUMENTROOT/$AppWwwDir
fi