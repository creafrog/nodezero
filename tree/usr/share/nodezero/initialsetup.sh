#!/bin/bash
set -o nounset
set -e errexit

export NZ_CONF_PATH="/etc/nodezero" #sets main config file path
source "${NZ_CONF_PATH}/nodezero.conf"
source "${NZ_CONF_PATH}/conf.d/*.conf"

_NzSetupMain() {
_NzUserGetName
sed -i "s/^export NZ_USER=/export NZ_USER=\"$NZ_USER\" #Main user name" "${NZ_CONF_PATH}/nodezero.conf"

echo "
###################################################
##### Nodezero setup assistant ####################
###################################################

Please edit your configuration file. Press any key to continue."
read -n 1
_NzEditConfig


echo "
Installing required packages..."
egrep -v "^#"  "${NZ_PATH}/packages.list" | egrep -v "^$" | tr "\n" " " | xargs aptitude -y install

service apache2 stop
service prosody stop
service mysql stop

echo "
Generating SSL keys and certificates..."
make-ssl-cert generate-default-snakeoil --force-overwrite
prosodyctl cert generate


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

_NzUserGetName() {
NZ_USER=$(getent passwd|grep 1001|awk -F":" '{print $1}')
}


_NzEditConfig() {
$EDITOR ${NZ_CONF_PATH}/nodezero.conf
source "${NZ_CONF_PATH}/nodezero.conf"
echo "$NZ_FQDN" >| /etc/hostname
hostname "$NZ_FQDN"
}

_NzSSHKeygen() {
ssh-keygen -b 2048 -t ecdsa -f ~/nodezero-key-ecdsa
if [ ! -d ~/.ssh/ ]; then mkdir -p ~/.ssh/; fi
cat ~/nodezero-key-ecdsa.pub >| ~/.ssh/authorized_keys
echo "Please copy ~/nodezero-key-ecdsa and ~/nodezero-key-ecdsa.pub to your remote computer and restart the SSH service. #TODO automate it"
}


_NzSetupMain