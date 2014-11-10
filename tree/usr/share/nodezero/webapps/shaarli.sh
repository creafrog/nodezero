#!/bin/bash
#Shaarli install script for nodezero

if [ "$1" == "install" ]
	then
		source "$NZ_PATH/webapps/shaarli.manifest" #get vars
		git clone --branch "$AppGitTag" $AppGitUrl" "$APACHE_DOCUMENTROOT/$AppWWDir" #install via git
		rsync -aP "$NZ_PATH/webapps/shaarli" "$APACHE_DOCUMENTROOT/$AppWWDir" #copy extra files over
	else
		echo "BREAK BREAK You're trying to do something I don't like."; read -n1
fi	