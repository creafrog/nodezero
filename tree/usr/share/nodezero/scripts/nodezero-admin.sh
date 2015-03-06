#!/bin/bash
#Nodezero main console admin interface
set -o nounset
set -o errexit

#░░░░░░░░░░░░░░░░░░░░░
#░░░░ Hardcoded vars

export NZ_CONF_PATH="/etc/nodezero" #sets main config file path

#TODO: move colors and sensitive options here

#░░░░░░░░░░░░░░░░░░░░░

source "${NZ_CONF_PATH}/nodezero.conf"
if [ -f "${NZ_CONF_PATH}/conf.d/*.conf" ]
	then source "${NZ_CONF_PATH}/conf.d/*.conf"
fi

#NZ_PATH is specified in nodezero.conf
source "${NZ_PATH}/scripts/nodezero-menus.sh"
source "${NZ_PATH}/scripts/nodezero-functions.sh"

_NzCheckRoot && #Check if we have root
_NzMenuMain #Run main menu loop
