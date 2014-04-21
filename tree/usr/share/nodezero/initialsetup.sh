#!/bin/bash
set -o nounset
set -e errexit

export NZ_CONF_PATH="/etc/nodezero" #sets main config file path
source "${NZ_CONF_PATH}/nodezero.conf"
source "${NZ_CONF_PATH}/conf.d/*.conf"

source "${NZ_PATH}/functions.sh", #NZ_PATH is specified in nodezero.conf

_NzEditConfig
_NzSecureMysql