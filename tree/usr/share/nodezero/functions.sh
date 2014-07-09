#!/bin/bash

################################################################################
#####################  COMMON FUNCTIONS  #######################################
################################################################################
_NzCheckRoot() { #Check if we are root
if [[ "$(/usr/bin/whoami)" != "root" ]]; then
    echo "This script must be run as root\! Script aborted."
    exit 1
fi
}


_NzListFunctions() { #List all available Nodezero shell scripts
grep -roh "^_.*()" $NZ_PATH/scripts/
}


_NzEditConfig() {
	$EDITOR ${NZ_CONF_PATH}/nodezero.conf
	source "${NZ_CONF_PATH}/nodezero.conf"
	echo "Updating hostname...." #TODO:move these lines to _NzReloadConfig
	echo "$NZ_FQDN" >| /etc/hostname
	hostname "$NZ_FQDN"
}



_NzSymlinkWebappDataDirs() { #Create symlinks to zenphoto and Dokuwiki data dirs in the main user's (UID 1000) home directory
	echo "Not yet implemented."
}

