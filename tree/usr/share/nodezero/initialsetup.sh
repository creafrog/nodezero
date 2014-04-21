#!/bin/bash
set -o nounset
set -e errexit

export NZ_CONF_PATH="/etc/nodezero" #sets main config file path
source "${NZ_CONF_PATH}/nodezero.conf"
if [ -f "${NZ_CONF_PATH}/conf.d/*.conf" ]
	then source "${NZ_CONF_PATH}/conf.d/*.conf"
fi

_NzSetupMain() {
_NzUserGetName
sed -i "s/^export NZ_USER=/export NZ_USER=\"$NZ_USER\" #Main user name/g" "${NZ_CONF_PATH}/nodezero.conf"

echo "
###################################################
##### Nodezero setup assistant ####################
###################################################

Please edit your configuration file. Press any key to continue."
read -n 1
_NzEditConfig


echo "
Installing required packages..."
aptitude update
egrep -v "^#"  "${NZ_PATH}/packages.list" | egrep -v "^$" | tr "\n" " " | xargs aptitude -y install

service apache2 stop
service prosody stop
service mysql stop

echo "
Generating SSL keys and certificates..."
make-ssl-cert generate-default-snakeoil --force-overwrite
#prosodyctl cert generate #This only works on 0.9+
openssl req -new -x509 -days 365 -nodes -out "/var/lib/prosody/$NZ_FQDN.crt" -newkey rsa:2048 -keyout "/var/lib/prosody/$NZ_FQDN.key" -batch

echo "
Generating SSH keys for remote access..."
_NzSSHKeygen

echo "
Updating Prosody configuration..."
sed -i "s/VirtualHost \"your_fqdn_here\"/VirtualHost \"$NZ_FQDN\"/g" /etc/prosody/prosody.cfg.lua
sed -i "s/\tkey = \"/etc/prosody/certs/server.key\";/\tkey = \"/etc/prosody/certs/$FQDN.key\";/g" /etc/prosody/prosody.cfg.lua
sed -i "s/\tcertificate = \"/etc/prosody/certs/server.cert\";/\tcertificate = \"/etc/prosody/certs/$FQDN.crt\";/g" /etc/prosody/prosody.cfg.lua

echo "
Securing mysql installation..."
_NzSecureMysql

service apache2 start
service prosody start
service mysql start

echo "Ready to roll. Run nodezero-admin to administrate your server."
}


_NzCheckRoot() { #Check if we are root, copied frum functions.sh
if [[ "$(/usr/bin/whoami)" != "root" ]]; then
    echo "This script must be run as root\! Script aborted."
    exit 1
fi
}

_NzUserGetName() { #Get system's main user name (assume it was the first user created)
NZ_USER=$(getent passwd|grep 1001|awk -F":" '{print $1}')
if [ "$NZ_USER" = "" ] #in case the system only has root as user
	then NZ_USER="root"
	sed -i 's/"^PermitRootLogin no"/"PermitRootLogin yes"/g' /etc/ssh/sshd_config #Allow root SSH logins
	echo "No unprivilegied user account detected. Allowing root SSH logins..."
fi
}


_NzEditConfig() { #Edit main config file, copied from functions.sh
$EDITOR ${NZ_CONF_PATH}/nodezero.conf
source "${NZ_CONF_PATH}/nodezero.conf"
echo "Updating hostname...."
echo "$NZ_FQDN" >| /etc/hostname
hostname "$NZ_FQDN"
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