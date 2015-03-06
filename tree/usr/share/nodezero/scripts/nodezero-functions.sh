#!/bin/bash
# nodezero-admin functions
# https://github.com/nodiscc/nodezero
# ░░░░░█▀█
# ░░░░░█░█
# ░▀▀▀░▀▀▀

# Copyright (c) 2014-2015 nodiscc

# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Single commands/monitoring tools            ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzRunGlances() {
    glances --disable-process-extended
}

_NzRunLynis () {
lynis -c -q
}

_NZRunDfc() {
dfc -p -udev,tmpfs
}

_NzRunHtop() {
htop
}

_NzRunNcdu() {
ncdu /
}

_NzRunLast() {
last -wdai |less -P "$LESSPROMPT"
}

_NzRunLastb() { #Check last failed login attempts
lastb -wdai |less +F -P "$LESSPROMPT"
}

_NzRunRanger() {
ranger
}



_NzShowMotd() { #TODO: uptime, hostname, OS/kernel, disk/ram/cpu usage graph over time, IP addresses, Internet traffic over time, disk I/O, top 5 processes, load average, 
echo "NOT YET IMPLEMENTED"
}


_NzRunIftop() { #TODO set default interface
iftop
}

_NzRunGoAccess() {
    zcat -f /var/log/apache2/access* | goaccess
    GoAccess_Outfile=/home/$NZ_USER/goaccess.html
    zcat -f /var/log/apache2/access* | goaccess -a >| $GoAccess_Outfile
    echo "Latest statistics saved to $GoAccess_Outfile"
}

_NzRunIotop() {
    iotop
}

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Package management                          ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzAptCleanup() {
    aptitude clean
    aptitude purge -y ~c
}

_NzAptUpgrade() {
aptitude -q5 update
aptitude -q5 -y upgrade
}

_NzRunAptitude() {
aptitude
}


#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Maintenance routines                        ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzEditMotd() { #Edit maintenance message
    nano /etc/motd
}

_NzEditMainConfig() { #Edit and reload main nodezero config file
    #Note: See also https://packages.debian.org/sid/augeas-tools to edit config files
    $EDITOR ${NZ_CONF_PATH}/nodezero.conf
    source "${NZ_CONF_PATH}/nodezero.conf"
    echo "$NZ_FQDN" >| /etc/hostname
    hostname "$NZ_FQDN"
    _NzReloadConfig #TODO: (check if paths/values in nodezero.conf are valid) update config files accordingly
}

_NzClearCaches() { #Clear dokuwiki and php-apc caches
	rm -r "$APACHE_DOCUMENTROOT/dokuwiki/data/cache/*"
	service apache2 restart #clear php-apc cache, so subtle
	#TODO: remove more caches (minigal, shaarli, owncloud deleted files...)
}





_NzDisableOwncloudMaintenanceMode() { #Disable Owncloud maintenance mode
sed -i "/'maintenance'/c\  \'maintenance' => false," ${APACHE_DOCUMENTROOT}/owncloud/config/config.php
}


_NzRegenCertificates() { #Regenerate TLS certificates for apache and prosody
    #TODO: Move text inside the function move this to NzMenuTroubleshooting, call it from there
    echo "
    Generating SSL keys and certificates..."
    make-ssl-cert generate-default-snakeoil --force-overwrite
    #prosodyctl cert generate #This only works on 0.9+
    openssl req -new -x509 -days 365 -nodes -out "/var/lib/prosody/$NZ_FQDN.crt" -newkey rsa:2048 -keyout "/var/lib/prosody/$NZ_FQDN.key" -batch
}



_NzReloadConfig() { #Main config reload routine
	_NzConfigUpdateFqdn
	_NzRegenContactPage
	_NzRegenHomePage
	_NzFixPermissions
}

_NzConfigUpdateFqdn() {
	echo "$NZ_FQDN" >| /etc/hostname
	hostname "$NZ_FQDN"
}



#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Power management                            ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzReboot() { #Reboot
    read -p "Are you sure? This will reboot the machine [y/N]: " confirmation
    if [ "$confirmation" != "y" ]
        then echo "Reboot cancelled."
        else reboot
    fi
}

_NzPoweroff() { #Power off the machine
    read -p "Are you sure? This will turn the machine off (you will have to manually turn it on) [y/N]: " confirmation
    if [ "$confirmation" != "y" ]
        then echo "Power off cancelled."
        else poweroff
    fi
}

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Network management                          ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzTestInetConnection() { #Test connectivity to debian.org #TODO move to NzMenuTroubleshooting
    ping -q -c3 debian.org
}

_NzUserGetName() { #Get system's main user name (assume it was the first user created)
	NZ_USER=$(getent passwd|grep 1000:1000|awk -F":" '{print $1}')
}

_NzGetLANSubnet() { #Get the current LAN IP and subnet
	ip addr show ${nz_net_iface} | egrep "inet " | awk -F" " '{print $2}'
}


#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Services management                         ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzServiceToggle() { #Start or stop a service, depending on it's status
	if [ "$nz_service_toggle_action" = "Disable service" ]
		then service $1 stop
		else service $1 start
	fi
}

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Apache admin                                ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzServiceApacheCheck() { #Checks for apache2 status and network access
	if [ ! -f /etc.init.d/apache2 ]
	#If apache is not installed	
	then
		nz_apache2_installed="no",
		nz_menu_apache2_line=" [1]	Apache web server	[not installed]"

	#If apache is installed
	else
		#Get service status
		service apache2 status >/dev/null
		case "$?" in
		0) nz_apache2_status="running"; nz_service_toggle_action="Disable service";;
		*) nz_apache2_status="stopped"; nz_service_toggle_action="Enable service";;
		esac

		#Check firewall status for service
		#TODO: move this to NzMenuFirewall as a function: _NzFirewallCheck 443
		#TODO: use LAN and VPN netmasks instead of hardcoding 192.168 (_NzGetLANSubnet)
		if [[ $(sudo ufw status numbered | grep "443/tcp                    ALLOW IN    Anywhere") ]]
			then nz_apache2_firewall="Internet access"
		elif [[ $(sudo ufw status numbered | grep "443/tcp                    ALLOW IN    192.168") ]]
			then nz_apache2_firewall="LAN access only"
		else
			nz_apache2_firewall="Blocked"
		fi

		#Build variables for menus
		nz_menu_apache2_line=" [1]	Apache web server	[$nz_apache2_status]	[$nz_apache2_firewall]"
		nz_apache2_installed="yes"
	fi
}



_NzInstallWebappPrompt() { #Prompt user for app name to install
	read -p "Install what app? " apptoinstall
	_NzInstallWebApp "$apptoinstall"
}

_NzInstallWebapp() { #Install a web application
	AppToInstall="$1"
	"$NZ_PATH/webapps/$AppToInstall.sh" install

	_NzRegenHomepage
	#_NzFixPermissions TODO re-enable when it's verified
}


#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Prosody XMPP server admin                   ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzProsodyGetStatus() { #Get IM server enabled/disabled status
if [[ -f /var/run/prosody/prosody.pid ]]
then PROSODY_STATUS="Enabled"
else PROSODY_STATUS="Disabled"
fi
}

_NzProsodyToggle() { #Enable/disable IM server
if [ ${PROSODY_STATUS} = "Disabled" ]
then rcconf --on prosody --now
else rcconf --off prosody --now #Todo: get rid of rcconf
fi
}

_NzProsodyGetRegistrationsStatus() { #Get new IM accounts registrations allowed/denied status
if [ `grep "allow_registration = true" /etc/prosody/prosody.cfg.lua` ]
then PROSODY_REG_ENABLED="Allowed"
else PROSODY_REG_ENABLED="Not allowed"
fi
}

_NzProsodyAddUser() { #Create new IM account
echo "Please enter the desired username for the new account:"
read PROSODY_NEW_USERNAME
prosodyctl adduser "${PROSODY_NEW_USERNAME}@${NZ_FQDN}"
if [ $? = 0 ]
    then echo "Done. You can now login with an XMPP client. Username: ${PROSODY_NEW_USERNAME} , Domain: ${NZ_FQDN}. Press any key to continue."
read -n 1
fi
}

_NzProsodyGetUserlist() { #Get list of IM accounts on the server
PROSODY_FQDN_STRING=`echo $NZ_FQDN | sed 's/\./\%2e/g'`
PROSODY_ACCOUNT_FILES=`find "/var/lib/prosody/${PROSODY_FQDN_STRING}/accounts" -name "*.dat"`
PROSODY_ACCOUNT_LIST=`for i in ${PROSODY_ACCOUNT_FILES}; do basename $i .dat; done`
}

_NzProsodyDelUser() { #Delete an existing IM account
_NzProsodyGetUserlist
echo "List of accounts on the server:
$PROSODY_ACCOUNT_LIST
Enter the name of the account you want to delete:"
read PROSODY_DELETE_ACCOUNT
prosodyctl deluser "${PROSODY_DELETE_ACCOUNT}@${FQDN}"
}

_NzProsodyChangeUserPassword() { #Change password for an IM account
_NzProsodyGetUserlist
echo "List of accounts on the server:
$PROSODY_ACCOUNT_LIST
Enter the name of the account you want to change the password for:"
read PROSODY_PASSWD_ACCOUNT
prosodyctl passwd "${PROSODY_PASSWD_ACCOUNT}@${FQDN}"
}

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Firewall admin                              ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzAllowFromLAN() { #Allow a port to be accessed from the LAN. Usage: _NzAllowFromLAN 135,139,445 tcp
	source "${NZ_PATH}/scripts/NzConfigRoutines"
	ufw allow from $(_NzGetLANSubnet) to any port "$1" proto "$2"
}

_NzFirewallDeny() { #Deny access to a port. Usage: _NzFirewallDeny 80,443 tcp
	ufw deny log $1/$2
}

_NzFirewallAllow() { #Allow all access to a port. Usage: _NzFirewallAllow 80,443 tcp
	ufw allow $1/$2
}



#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   MySQL admin                                 ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_NzDeleteDB() {
	QUERY="DROP DATABASE $1; DROP USER $1@localhost;"
	mysql -u root -p -e "$QUERY"
}

_NzCreateDB() {
	QUERY="create database $1; create user $1@localhost identified by \"$2\"; grant all on $1.* to $1@localhost;"
	mysql -u root -p -e "$QUERY"
}

_NzSecureMysql() {
	mysql_secure_installation
}

_NzMysqlRootPwReset() {
	echo -n "Please enter your new MySQL root password: "
	read NEWMYSQLPASSWORD
	echo -n "Please enter your new password again: "
	read NEWMYSQLCONFIRMATION
	if [ "$NEWMYSQLPASSWORD" != "$NEWMYSQLCONFIRMATION" ]
		then echo "Passwords do not match\!"; return 1
	fi

	QUERY="UPDATE user SET Password=PASSWORD(\'"$NEWMYSQLPASSWORD"\') WHERE User='root'; FLUSH PRIVILEGES;"
	service mysql stop
	mysqld_safe --skip-grant-tables&
	sleep 5
	mysql -u root mysql -e "$QUERY"
	echo "Password changed to: $NEWMYSQLPASSWORD"
}

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Permissions management                      ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


_NzUserShowWwwaccess() { #Show main user's permissions on web served content
    groups $NZ_USER | grep -q "$APACHE_GROUP"
    if [ ?$ != 0 ]
        then echo "$NZ_USER is not allowed to edit the web server files"
        export NZ_USERWWWACCESS=0
        else  echo "$NZ_USER is allowed to edit the web server files"
        export NZ_USERWWWACCESS=1
    fi
}

_NzUserToggleWwwAccess() { #Show main user's permissions on web served content
    _NzUserShowWwwAccess >/dev/null
    if [ $NZ_USERWWWACCESS = 0 ]
        then adduser $NZ_USER www-data; _NzUserShowWwwAccess
        else deluser $NZ_USER www-data; _NzUserShowWwwAccess
    fi
}

_NzUserShowTransmissionAccess() { #Show main user's permissions on transmission downloaded files
    groups $NZ_USER | grep -q debian-transmission
    if [ ?$ != 0 ]
        then echo "$NZ_USER is not allowed to edit transmission downloaded files"
        export NZ_USERTRANSMISSIONACCESS=0
        else  echo "$NZ_USER is allowed to edit the transmission downloaded files"
        export NZ_USERTRANSMISSIONACCESS=1
    fi
}

_NzUserToggleTransmissionAccess() { #Toggle main user's permissions on transmission downloaded files
    _NzUserShowTransmissionAccess
    if [ $NZ_USERTRANSMISSIONACCESS = 0 ]
        then adduser $NZ_USER debian-transmission; _NzUserShowTransmissionAccess
        else deluser $NZ_USER debian-transmission; _NzUserShowTransmissionAccess
    fi
}

_NzUserTransmissionPassword() {
    service transmission-daemon stop
    #Todo: Test required files availability
    CurrentTransmissionUsername=$(grep rpc-username /etc/transmission-daemon/settings.json |awk -F "\"" '{print $4}')
    CurrentTransmissionPassword=$(grep rpc-password /etc/transmission-daemon/settings.json |awk -F "\"" '{print $4}')
    read -p "Please enter the username required to access Transmission web interface (current: $CurrentTransmissionUsername): " NewTransmissionUsername
    read -p "Please enter the password required to access Transmission web interface (current: $CurrentTransmissionPassword): " NewTransmissionPassword
    sed -i "s/^    \"rpc-username\".*/    \"rpc-username\": \"$NewTransmissionUsername\",/g" /etc/transmission-daemon/settings.json
    sed -i "s/^    \"rpc-password\".*/    \"rpc-password\": \"$NewTransmissionPassword\",/g" /etc/transmission-daemon/settings.json
    echo "Transmission web interface username/password has been changed to $NewTransmissionUsername/$NewTransmissionPassword"
    service transmission-daemon start
}



_NzFixPermissions() { #Fix permissions for transmission/apache files
    chown debian-transmission:debian-transmission /var/log/debian-transmission.log
    chown -R debian-transmission:debian-transmission ${transmission_download_dir}
    chown daemon:daemon /var/log/debsecan
    chown -R "$NZ_USER":"$APACHE_GROUP" "$APACHE_DOCUMENTROOT"
    find "$APACHE_DOCUMENTROOT" -type d -print0 | xargs -0 chmod 750
    find "$APACHE_DOCUMENTROOT" -type f -print0 | xargs -0 chmod 640
    chmod -R g+w /var/www/links/{data,pagecache,cache,tmp}/ \
    	/var/www/bugs/{.htaccess,database} \
    	/var/www/tt-rss/{cache/export/,cache/images/,feed-icons/,lock/,cache/upload/,cache/js/}
    chmod 600 /etc/ssl/private/ssl-cert-snakeoil.key
}




#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░                                               ░░░
#░░░   Wrappers                                    ░░░
#░░░                                               ░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

_ArrayContainsElement () { #thanks https://stackoverflow.com/questions/3685970/
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

_NzListFunctions() { #List all available Nodezero shell scripts
grep -roh "^_.*()" $NZ_PATH/scripts/
}


_NzCheckRoot() { #Check if we are root
if [[ "$(/usr/bin/whoami)" != "root" ]]; then
    echo "This script must be run as root\! Script aborted."
    return 1
fi
}

