#!/bin/bash
#Temporary install script for nodezero
#TODO: rewrite everything, use existing functions in scripts/ if available, separate UI from functions

set -o nounset
set -e errexit

#set main config file path
export NZ_CONF_PATH="/etc/nodezero"
source "${NZ_CONF_PATH}/nodezero.conf"

#load extra config if present
if [ -f "${NZ_CONF_PATH}/conf.d/*.conf" ]
	then source "${NZ_CONF_PATH}/conf.d/*.conf"
fi

source ${NZ_PATH}/functions.sh #todo: delete this once functions.sh is empty

##################### Functions #######
_NzSetupAllowRootAccess() { #Check if system has user UID=1001, if not, allow root ssh access
	if [ "$NZ_USER" = "" ] #in case the system only has root as user
	then
		NZ_USER="root"
		sed -i 's/"^PermitRootLogin no"/"PermitRootLogin yes"/g' /etc/ssh/sshd_config #Allow root SSH  logins #TODO: doesn't work
		echo "WARNING: No unprivilegied user account detected. Allowing root SSH logins..."
	else
		echo "Main system user is $NZ_USER."
	fi
}


###################### Main setup loop
_NzSetupMain() { 
	source ${NZ_PATH}/scripts/NzConfigRoutines
	#Check if we have root
	_NzCheckRoot
	#Detect and update main user name in nodezero.conf
	_NzUserGetName
	#allow root access if system has no user UID=1000
	_NzSetupAllowRootAccess

	#TODO: set NZ_USER to root if no user 1000 detected. better start managing configuration changes with ansible/augeas/puppet/chef
	#sed -i "s/^export NZ_USER=/export NZ_USER=\"$NZ_USER\" #Main user name/g" "${NZ_CONF_PATH}/nodezero.conf"

	#Edit main config file
	echo "
	###################################################
	##### Nodezero setup assistant ####################
	###################################################
	Please edit your configuration file. Press any key to continue."
	read -n 1
	_NzEditConfig

	#Install default packages
	#This is really bad and should be managed with ansible #TODO
	echo "
	Installing required packages..."
	aptitude update
	egrep -v "^#"  "${NZ_PATH}/packages.list" | egrep -v "^$" | tr "\n" " " | xargs aptitude -y install #-y is dangerous

	#Stop services to configure them
	service apache2 stop
	service prosody stop
	service mysql stop
	service transmission-daemon stop

	#Set groups for main user
	echo "
	Setting up default groups..."
	adduser $NZ_USER debian-transmission
	adduser $NZ_USER www-data
	adduser $NZ_USER sudo
	adduser $NZ_USER scanner
	adduser $NZ_USER lpadmin
	adduser $NZ_USER plugdev
	adduser $NZ_USER video
	adduser $NZ_USER audio
	adduser $NZ_USER fuse

    _NzFixPermissions

	#Set random password for transmission
	#TODO: ask for a web interface password at beginning, store it in nodezero.conf, use it instead.
	#it can be reused for other web apps (https://telecom.dmz.se/bugs/nodezero/issues/37 single sign-on)
	#TODO: the password should be exported in user's keyring file
	#tldr TODO use password from nodezero.conf, add a routine to update transmission username/pw to _NzReloadConfig, call it from there
	echo "
	Setting a random username/password for transmission web interface (can be changerd later form the admin interface)"
	NewTransmissionUsername=$(pwgen -s 24)
	NewTransmissionPassword=$(pwgen -s 24)
	sed -i "s/^   \"rpc-username\".*/   \"rpc-username\": \"$NewTransmissionUsername\",/g" /etc/transmission-daemon/settings.json
	sed -i "s/^   \"rpc-password\".*/   \"rpc-password\": \"$NewTransmissionPassword\",/g" /etc/transmission-daemon/settings.json
	echo "Transmission web interface username/password has been changed to $NewTransmissionUsername/$NewTransmissionPassword"
	
	#Generate apache and prosody certs
	source "${NZ_PATH}/scripts/NzMenuTroubleshooting"
	_NzRegenCertificates

	#Generate new ssh key pair
	#TODO: Move text inside the function, move function to nzMenuTroubleshooting
	echo "
	Generating new SSH keys for remote access..."
	_NzSSHKeygen

	#Update prosody configuration
	#TODO: move this to _NzReloadConfig
	echo "
	Updating Prosody configuration..."
	sed -i "s/VirtualHost \"your_fqdn_here\"/VirtualHost \"$NZ_FQDN\"/g" /etc/prosody/prosody.cfg.lua
	sed -i "s|\tkey = \"/etc/prosody/certs/server.key\";|\tkey = \"/etc/prosody/certs/$NZ_FQDN.key\";|g" /etc/prosody/prosody.cfg.lua
	sed -i "s|\tcertificate = \"/etc/prosody/certs/server.cert\";|\tcertificate = \"/etc/prosody/certs/$NZ_FQDN.crt\";|g" /etc/prosody/prosody.cfg.lua

	#Secure Mysql install
	#TODO: move it to NzMenuTroubleshooting, call from there
	service mysql start
	echo "
	Securing mysql installation..."
	mysql_secure_installation

	service apache2 start
	service prosody start
	service transmission-daemon start

echo "
	Generating locales..."
    locale-gen

echo "
	Updating rkhunter databases, running initial scan..." #TODO move this to a common function
    rkhunter --update
    rkhunter --propupd
    rkhunter --skip-keypress --report-warnings-only
    #TODO configure rkhunter in /etc/rkhunter.conf
    #TODO setup and run chkrottkit http://linuxfr.org/news/un-peu-plus-de-securite-sous-linux
    #TODO setup and run lynis https://cisofy.com/documentation/lynis/ --- lynis --check-all --quick
    #TODO setup debsums: debsums --all --silent

	echo "Ready to roll. Run nodezero-admin to administrate your server."
}




_NzSSHKeygen() { #Generate ssh keys, send them to user's home dir
if [ "$NZ_USER" = "root" ]
then
	if [ ! -d /root/.ssh/ ]; then mkdir -p /root/.ssh/; fi
	ssh-keygen -b 521 -t ecdsa -f /root/nodezero-key-ecdsa
	cat /root/nodezero-key-ecdsa.pub >| /root/.ssh/authorized_keys	
	echo "Please copy /root/nodezero-key-ecdsa and /root/nodezero-key-ecdsa.pub to your remote computer and restart the SSH service." #TODO automate it
else
	if [ ! -d /home/${NZ_USER}/.ssh/ ]; then mkdir -p /home/${NZ_USER}/.ssh/; fi
	ssh-keygen -b 521 -t ecdsa -f /home/${NZ_USER}/nodezero-key-ecdsa
	cat /home/${NZ_USER}/nodezero-key-ecdsa.pub >| /home/${NZ_USER}/.ssh/authorized_keys
	echo "Please copy /home/${NZ_USER}/nodezero-key-ecdsa and /home/${NZ_USER}/nodezero-key-ecdsa.pub to your remote computer and restart the SSH service." #TODO automate it
fi
}

_NzSetupMain