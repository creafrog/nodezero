#!/bin/bash
#Nodezero main console admin interface
set -o nounset
set -e errexit

export NZ_CONF_PATH="/etc/nodezero" #sets main config file path
source "${NZ_CONF_PATH}/nodezero.conf"
if [ -f "${NZ_CONF_PATH}/conf.d/*.conf" ]
	then source "${NZ_CONF_PATH}/conf.d/*.conf"
fi


_NzCheckRoot() {
    if [ $(whoami) != "root" ]
        then echo "You must have root to run this script."
        exit 1
    fi
}

#NZ_PATH is specified in nodezero.conf
source "${NZ_PATH}/scripts/NzMenuMain"


_NzCheckRoot #Check if we have root
_NzMenuMain #Run main menu loop
