#!/bin/bash
# owncloud management script for nodezero
# https://github.com/nodiscc/nodezero
# ░░░░░█▀█
# ░░░░░█░█
# ░▀▀▀░▀▀▀

_main() {
	case "$action" in
		install ) _OwncloudInstall;;
		upgrade ) _OwncloudUpgrade;;
		* ) echo "Unsupported action: $action";;
	esac
}

_OwncloudInstall() {
	echo "Not yet implemented."  #TODO
}

_OwncloudUpgrade() {
	 sudo -u www-data /usr/bin/php /var/www/owncloud/occ upgrade --skip-migration-test
}

action="$1"
_main