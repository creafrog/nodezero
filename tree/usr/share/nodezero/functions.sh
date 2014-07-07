#!/bin/bash

################################################################################
###############################   TOOLS FUNCTIONS  #############################
################################################################################
_NzRunLynis () {
lynis -c -q
}

_NZRunDfc() {

}

_NzRunHtop() {

}

_NzRunNcdu() {

}

#Check last logins
_NzRunLast() {
last -wdai |less -P "$LESSPROMPT"
}

#Check last failed login attempts
_NzRunLastb() {
lastb -wdai |less +F -P "$LESSPROMPT"
}

_NzRunRanger() {

}

_NzShowMotd() {
#TODO: uptime, hostname, OS/kernel, disk/ram/cpu usage graph over time, IP addresses, Internet traffic over time, disk I/O, top 5 processes, load average, 
}

_NzEditMotd() {

}

_NzAptUpgrade() {
aptitude -q5 update
aptitude -q5 -y upgrade
}


_NzAptitudePurge() {
aptitude purge ~c
}

_NzAptitudeClean() {
aptitude clean
}

_NzRunAptitude() {
aptitude
}

_NzRunNethogs() {
nethogs $NZ_IFACE
}


_NzRunIftop() {
iftop
}

_NzRunGoAccess() {
zcat -f /var/log/apache2/access* | goaccess
GoAccess_Outfile=/home/$NZ_USER/goaccess.html
zcat -f /var/log/apache2/access* | goaccess -a >| $GoAccess_Outfile
echo "Latest statistics saved to $GoAccess_Outfile"
}



################################################################################
#####################  MYSQL MANAGEMENT FUNCTIONS  #############################
################################################################################
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

_NzMysqlChangeRootPw() {
echo -n "Enter your new MySQL root password:"
read NEWMYSQLPASSWORD
QUERY="USE mysql; UPDATE user SET Password=PASSWORD(\'$NEWMYSQLPASSWORD\') WHERE user='root'; FLUSH PRIVILEGES;"
mysql -u root -p -e "$QUERY"

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





################################################################################
#####################  COMMON FUNCTIONS  #######################################
################################################################################
_NzCheckRoot() { #Check if we are root
if [[ "$(/usr/bin/whoami)" != "root" ]]; then
    echo "This script must be run as root\! Script aborted."
    exit 1
fi
}

#List all available Nodezero shell scripts
_NzListFunctions() {
grep -roh "^_.*()" $NODEZERO_PATH/
}





#Create symlinks to zenphoto and Dokuwiki data dirs in the main user's (UID 1000) home directory
_NzSymlinkWebappDataDirs() {
echo "Not yet implemented."
#TODO

}



_NzPoweroff() {

}

_NzReboot() {

}

_NzUserGetName() { #Get main user's username
export NZ_USER=`getent passwd | grep 1000:1000 | awk -F ":" '{print $1}'`
}

_NzUserGetName() { #Get system's main user name (assume it was the first user created)
	NZ_USER=$(getent passwd|grep 1000:1000|awk -F":" '{print $1}')
}


_NzTestInetConnection() { #Test connectivity to debian.org
ping -q -c3 debian.org
}

_NzEditMotd() { #Edit maintenance message
nano /etc/motd
}

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
CurrentTransmissionUsername=$(grep rpc-username /etc/transmission-daemon/settings.json |awk -F "\"" '{print $4}')
CurrentTransmissionPassword=$(grep rpc-password /etc/transmission-daemon/settings.json |awk -F "\"" '{print $4}')
read -p "Please enter the username required to access Transmission web interface (current: $CurrentTransmissionUsername): " NewTransmissionUsername
read -p "Please enter the password required to access Transmission web interface (current: $CurrentTransmissionPassword): " NewTransmissionPassword
sed -i "s/^    \"rpc-username\".*/    \"rpc-username\": \"$NewTransmissionUsername\",/g" /etc/transmission-daemon/settings.json
sed -i "s/^    \"rpc-password\".*/    \"rpc-password\": \"$NewTransmissionPassword\",/g" /etc/transmission-daemon/settings.json
echo "Transmission web interface username/password has been changed to $NewTransmissionUsername/$NewTransmissionPassword"
service transmission-daemon start
}

################################################################################
#####################  CLEANUP AND TROUBLESHOOTING FUNCTIONS  ##################
################################################################################




_NzCleanupApt() {
aptitude -y purge ~c
aptitude clean
}
