#!/bin/bash

################################################################################
###########################      MENUS        ##################################
################################################################################
#menus thanks to http://code.activestate.com/recipes/577437-basic-linux-menu/?in=lang-bash

#### MAIN MENU
_NzMenuMain() { #called from nodezero-admin.sh
selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "========== NODEZERO MAIN MENU =========="
     echo "1 - Tools Menu"
     echo "2 - User Account Menu"
     echo "3 - Backup Menu"
     echo "4 - Troubleshooting Menu"
     echo "5 - Edit main configuration file"
     echo "6 - Prosody Instant Messaging server configuration"
     echo "7 - Other services configuration"
     echo "8 - Power off"
     echo "9 - Reboot"
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) _NzMenuTools;; #OK
         2 ) _NzMenuUserAccount;; #OK
         3 ) _NzMenuBackup;; #OK
         4 ) _NzMenuTroubleshooting;; #OK
         5 ) _NzEditConfig;;
         6 ) _NzMenuProsody;; #OK
         7 ) _NzMenuServices;; #OK
         8 ) _NzPoweroff;; #TODO in common.sh
         9 ) _NzReboot;; #TODO in common.sh
         0 ) return 0;;
         * ) echo "Please enter a valid number"
     esac
done
}

#### TOOLS MENU
_NzMenuTools() { #TODO: lnav
selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "========== TOOLS MENU =========="
     echo "1 - dfc - display disk usage"
     echo "2 - htop - system monitor"
     echo "3 - ncdu - disk usage analyzer"
     echo "4 - last - display user login history"
     echo "5 - lastb - display failed login attempts"
     echo "6 - nethogs - display network usage by programs"
     echo "7 - iftop - display network usgae by connection"
     echo "8 - ranger - explore filesystem"
     echo "9 - Display system information"
     echo "10 - Edit maintenance message"
     echo "11 - lynis - Security Audit"
     echo "12 - Purge old configuration files"
     echo "13 - Clear packages cache"
     echo "14 - aptitude - manage software packages/updates"
     echo "15 - Update installed software now"
     echo "16 - goaccess - ananlyze and display web server logs"
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) _NzRunDfc;;
         2 ) _NzRunHtop;;
         3 ) _NzRunNcdu;;
         4 ) _NzRunLast;;
	 5 ) _NzRunLastb;;
	 6 ) _NzRunNethogs;;
	 6 ) _NzRunIftop;;
	 8 ) _NzRunRanger;;
	 9 ) _NzShowMotd;;
	 10 ) _NzEditMotd;;
	 11 ) _NzRunLynis;;
	 12 ) _NzAptitudePurge;;
	 13 ) _NzAptitudeClean;;
	 14 ) _NzRunAptitude;;
	 15 ) _NzAptUpgrade;;
	 16 ) _NzRunGoAccess;;
         0 ) exit;;
         * ) echo "Please enter 1,2,3,4,5,6,7,8,9,10,11,12,13 or 0"
     esac
done
}

#### USER ACCOUNT MENU
_NzMenuUserAccount() { #TODO: password change mechanism
selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "========== USER ACCOUNT MENU =========="
     _NzUserShowWwwaccess
     _NzUserShowTransmissionaccess
     echo "1 - Change user access to web server files"
     echo "2 - Change user access to transmission downloads"
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) _NzUserToggleWwwaccess;;
         2 ) _NzUserToggleTransmissionaccess;;
         0 ) return 0;;
         * ) echo "Please enter a valid number"
     esac
done
}

#### BACKUP MENU
_NzMenuBackup() {
selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "========== BACKUP MENU =========="
     echo "1 - tree - generate a list of your files"
     echo "2 - backup web server now"
     echo "3 - copy backups to external drive"
     echo "4 - backup important directories"
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) _NzRunTree;;
         2 ) _NzBackupHttpd;;
         3 ) _NzDoPhysicalBackup;;
         4 ) _NzBackupUserFiles;;
         0 ) return 0;;
         * ) echo "Please enter a valid number"
     esac
done
}

#### TROUBLESHOOTING MENU
_NzMenuTroubleshooting() { 
#TODO: add bleachbit
selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "========== CLEANUP AND TROUBLESHOOTING =========="
     echo "1 - Clear dokuwiki cache"
     echo "2 - Restore correct file permissions"
     echo "3 - Clear PHP APC Cache"
     echo "4 - Edit access permissions for the web server files" #TODO: no
     echo "5 - Cleanup stale install files"
     echo "6 - Cleanup APT packages cache and stale config files"
     echo "7 - Disable Owncloud maintenance mode."
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) _NzClearDwCache;;
         2 ) _NzSetWwwPermissions;;
         3 ) _NzClearApcCache;;
         4 ) _NzEditVarwwwSshKeys;;
         0 ) exit;; #TODO: Add entries from the menu
         * ) echo "Invalid entry."
     esac
done
}

#### PROSODY CONFIGURATION MENU
_NzMenuProsody() {
_NzProsodyGetStatus #OK
_NzProsodyGetRegistrationsStatus #OK
until [ "$selection" = "0" ]; do
echo "
### XMPP/JABBER SERVER (PROSODY) #############################
 - [1][$PROSODY_STATUS] SERVER ENABLED
 - [2][$PROSODY_REG_ENABLED] REGISTRATIONS ENABLED
       Allows anyone to create a new account on the server

### OTHER ACTIONS
 - [3] Add a new account
 - [4] Delete an account
 - [5] Change an account password
 - [0] Back to main Menu
"

     case $selection in
         1 ) _NzProsodyToggle;; #OK
         2 ) _NzProsodyToggleResgistartions;; #TODO
         3 ) _NzProsodyAddUser;; #OK
         4 ) _NzProsodyGetUserlist; _NzProsodyDelUser;; #OK
         5 ) _NzProsodyGetUserlist;; _NzProsodyChangeUserPassword;; #OK
         0 ) exit;;
         * ) echo "Please enter a valid number"
    esac
done

}

#### OTHER SERVICES CONFIGURATION MENU
_NzMenuServices() { #TODO
selection=
until [ "$selection" = "0" ]; do
echo "
################################### SERVICES ###
Apache2 Web Server:			
 [1][$APACHE2_ST_LED] $APACHE2_ST
 [2][$UFW_HTTP_INET_LED] Internet access allowed
 [3][$UFW_HTTP_LAN_LED] Only allow LAN access

MYSQL database server
 [4][$MYSQLD_ST_LED] $MYSQLD_ST

Prosody Jabber/XMPP messaging server:
 [5][$XMPP_ST_LED] $XMPP_ST
 [6][$XMPP_INET_LED] Serve over the Internet
 [7][$XMPP_LAN_LED] Serve on LAN only

OpenSSH Server:
 [8][$SSHD_ST_LED] $SSHD_ST

Transmission Bittorrent client:
 [9][$SEEDBOX_ST_LED] $SEEDBOX_ST

Mumble VoIP server:
 [10][$MUMBLE_ST_LED] $MUMBLE_ST

[S] Other services
[B] Back to Main Menu
[R] Reboot
[P] Power Off
[Q] Exit
"
     case $selection in
         1 ) ;;
         2 ) ;;
         3 ) ;;
         4 ) ;;
         5 ) ;;
         6 ) ;;
         7 ) ;;
         8 ) ;;
         9 ) ;;
         10 ) ;;
         0 ) exit;;
         * ) echo "Please enter a valid number"
    esac
done
}




################################################################################
###########################      PROSODY FUNCTIONS #############################
################################################################################
_NzProsodyGetStatus() {
if [[ -f /var/run/prosody/prosody.pid ]]
then PROSODY_STATUS="N"
else PROSODY_STATUS="Y"
fi
}

_NzProsodyToggle() {
if ${PROSODY_STATUS}="N"
then rcconf --on prosody --now
else rcconf --off prosody --now
fi
}

_NzProsodyGetRegistrationsStatus() {
if [ `grep "allow_registration = true" /etc/prosody/prosody.cfg.lua` ]
then $PROSODY_REG_ENABLED="Y"
else $PROSODY_REG_ENABLED"N"
fi
}

_NzProsodyAdduser() {
echo "Please enter the desired username for the new account:"
read PROSODY_NEW_USERNAME
prosodyctl adduser "${PROSODY_NEW_USERNAME}@${NZ_FQDN}"
if [ $? = 0 ]
	then echo "Done. You can now login with an XMPP client. Username: ${PROSODY_NEW_USERNAME} , Domain: ${NZ_FQDN} , Password: you just entered it. Press any key to continue."
read -n 1
fi
}

_NzProsodyGetUserlist() {
PROSODY_FQDN_STRING=`echo $NZ_FQDN | sed 's/\./\%2e/g'`
PROSODY_ACCOUNT_FILES=`find "/var/lib/prosody/${PROSODY_FQDN_STRING}/accounts" -name "*.dat"`
PROSODY_ACCOUNT_LIST=`for i in ${PROSODY_ACCOUNT_FILES}; do basename $i .dat; done`
}

_NzProsodyDeluser() {
_NzProsodyGetUserlist
echo "List of accounts on the server:
$PROSODY_ACCOUNT_LIST
Enter the name of the account you want to delete:"
read PROSODY_DELETE_ACCOUNT
prosodyctl deluser "${PROSODY_DELETE_ACCOUNT}@${FQDN}"
}

_NzProsodyChangeUserPassword() {
_NzProsodyGetUserlist
echo "List of accounts on the server:
$PROSODY_ACCOUNT_LIST
Enter the name of the account you want to change the password for:"
read PROSODY_PASSWD_ACCOUNT
prosodyctl passwd "${PROSODY_PASSWD_ACCOUNT}@${FQDN}"
}








################################################################################
###############################   BACKUP FUNCTIONS #############################
################################################################################

_NzBackupDir() { #Backup the specified directory #PLEASETEST
if [ ! -d "${BACKUP_LOCAL_STORAGE}" ] # Create backup destination if it does not exist
then
	mkdir -p "${BACKUP_LOCAL_STORAGE}"
fi


obnam backup $@ #Actually backup specified files to $BACKUP_LOCAL_STORAGE
}


_NzDoPhysicalBackup() { #Sync local backups to USB drive #PLEASETEST #TODO: colorize
if [ ! -d "${BACKUP_LOCAL_STORAGE}" ] # Create local backup dir if it does not exist
then
	mkdir -p "${BACKUP_LOCAL_STORAGE}"
fi

echo "You have 60 seconds to insert your USB backup drive." #Show prompt and detect newly plugged usb drive
BACKUP_MOUNTPOINT_NAME=`inotifywait --quiet --timeout 60 /var/run/usbmount --format %w%f --event create`
if [ -d "$BACKUP_MOUNTPOINT_NAME" ] #If mountpoint is created by usbmount and is detected

then
	echo "Backup drive detected on $BACKUP_MOUNTPOINT_NAME" 
	echo "Calculating disk space..."
	BACKUP_VOLUME_SIZE=`lsblk -b | grep "$BACKUP_MOUNTPOINT_NAME" |awk -F " " '{print $4}'` 	#Check backup drive capacity
	BACKUP_FILES_SIZE=`du -abc $BACKUP_LOCAL_STORAGE | tail -n 1 | awk -F " " '{print $1}'` 	#Check backup files size 
	if [[ "$BACKUP_FILES_SIZE" -gt "$BACKUP_VOLUME_SIZE" ]] 	#If drive is too small, throw an error.
	then
		echo "Error: Backup drive is too small to contain your backup files\! Aborting."
		exit 1
	else
		rsync -avzP --delete $BACKUP_LOCAL_STORAGE $BACKUP_MOUNTPOINT_NAME/ && 	#Else, if drive is large enough, sync backups to usb drive with rsync
		echo "Your backup has been copied to your USB drive." 
else
	echo "No valid mountpoint found. You may want to format the backup drive." #If no mountpoint was detected, or detection times out, throw an error
	exit 1
fi

#TODO Display Last time local backup was done
#TODO Display Last time backups were synced to the USB drive
}


_NzRunTree() { #Create a list of files in user-specified directories (IMPORTANT_DIRS array in main config file #TODO Check where it is actually) #PLEASETEST
	FILELIST="${BACKUP_LOCAL_STORAGE}/filelist-`date +%Y%m%d-%H\:%M\:%S`.txt" 	#Create destination file

	for IMPORTANT_DIR in ${IMPORTANT_DIRS} 	#List important dirs from config file and output their tree to destination file
	do tree -alxhtC --dirsfirst  ${IMPORTANT_DIR} >> ${FILELIST}
	done

	if [ ${TREE_TO_HTML} = "1" ] 	#Enable HTML output (disabled by default, set TREE_TO_HTML to 1 in nodezero.conf)
	then
		HTML_FILELIST="${BACKUP_LOCAL_STORAGE}/filelist-`date +%Y%m%d-%H\:%M\:%S`.html"
		for IMPORTANT_DIR in ${IMPORTANT_DIRS}
		do tree -alxhtC -H ./ --dirsfirst  ${IMPORTANT_DIR} >> ${HTML_FILELIST}
		done
	fi
}


_NzBackupUserFiles() { # Do a full backup of important files #TODO
}


_NzBackupSqldb() { #Backup an SQL database #TODO
}


_NzRestoreSqldb() { #Restore an sql database #TODO
}


_NzObnamMount() { #Mount an obnam generation on BACKUP_LOCAL_MOUNTPOINT #TODO define it
#TODO: disply generations and allow selecting one to mount
}


#Notes
## from http://blog.steve.org.uk/so_i_want_a_backup_solution.html
#Obnam takes care of most of your requirements, and is written by a Debian dev. Syncing to remote filesystem is implemented via sftp with keys, GPG can be used to encrypt backups and you can ignore directories and mounted filesystem. The only thing that it won't do by itself is run arbitrary shell commands like mysqldump or whatever you need to run to dump/backup your DBs. That can br worked around by calling obnam from a script.
#As for logging, obnam will either log to a file or to syslog, you could always use logwatch to alert you when an obnam backup fails.
#My nightly backups currently look like this :
#obnam backup --repository sftp://me@server.org/~/backups --quiet --keep 90d --compress-with gzip --log syslog --exclude '/home/somedir' /

#From: http://stackoverflow.com/questions/1013852/can-i-restore-a-single-table-from-a-full-mysql-mysqldump-file
#RESTORE A DB TABLE FROM A FULL DUMP: sed -n -e '/CREATE TABLE.*mytable/,/CREATE TABLE/p' mysql.dump > mytable.dump











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

_NzEditConfig() {
$EDITOR ${NZ_CONF_PATH}/nodezero.conf
source "${NZ_CONF_PATH}/nodezero.conf"
echo "$NZ_FQDN" >| /etc/hostname
hostname "$NZ_FQDN"
_NzRegenContactPage
}

_NzRegenContactPage() {
ContactAddresses=""
if -z "$NZ_PUBLIC_MAIL"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Email\" href=\"$NZ_PUBLIC_MAIL\"><i class=\"icon-mail-alt\"></i></a>"; fi
if -z "$NZ_PUBLIC_IM"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"IM\" href=\"$NZ_PUBLIC_IM\"><i class=\"icon-comment\"></i></a>"; fi
if -z "$NZ_PUBLIC_PHONE"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Git\" href=\"$NZ_PUBLIC_PHONE\"><i class=\"icon-phone-squared\"></i></a>"; fi
if -z "$NZ_PUBLIC_TWITTER"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Twitter\" href=\"$Z_PUBLIC_TWITTER\"><i class=\"icon-twitter-squared\"></i></a>"; fi
if -z "$NZ_PUBLIC_GPLUS"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Google+\" href=\"$NZ_PUBLIC_GPLUS\"><i class=\"icon-gplus-squared\"></i></a>"; fi
if -z "$NZ_PUBLIC_FACEBOOK"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Facebook\" href=\"$NZ_PUBLIC_FACEBOOK\"><i class=\"icon-facebook-squared\"></i></a>"; fi
if -z "$NZ_PUBLIC_TUMBLR"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Tumblr\" href=\"$NZ_PUBLIC_TUMBLR\"><i class=\"icon-tumblr-squared\"></i></a>"; fi
if -z "$NZ_PUBLIC_INSTAGRAM"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Instagram\" href=\"$NZ_PUBLIC_INSTAGRAM\"><i class=\"icon-instagramm\"></i></a>"; fi
if -z "$NZ_PUBLIC_YOUTUBE"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Youtube\" href=\"$NZ_PUBLIC_YOUTUBE\"><i class=\"icon-youtube-play\"></i></a>"; fi
if -z "$NZ_PUBLIC_GITHUB"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Github\" href=\"$NZ_PUBLIC_GITHUB\"><i class=\"icon-github-squared\"></i></a>"; fi
if -z "$NZ_PUBLIC_LINKEDIN"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"LinkedIn\" href=\"$NZ_PUBLIC_LINKEDIN\"><i class=\"icon-linkedin-squared\"></i></a>"; fi
if -z "$NZ_PUBLIC_SKYPE"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Skype\" href=\"$NZ_PUBLIC_SKYPE\"><i class=\"icon-skype\"></i></a>"; fi
if -z "$NZ_PUBLIC_BTC"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Bitcoin\" href=\"$NZ_PUBLIC_BTC\"><i class=\"icon-bitcoin\"></i></a>"; fi
if -z "$NZ_PUBLIC_MISC"; then ContactAddresses="$ContactAddresses \n <a data-toggle=\"tooltip\" title=\"Misc\" href=\"$NZ_PUBLIC_MISC\"><i class=\"icon-blank\"></i></a>"; fi
#TODO: create webpage by concatenating HTML header + $ContactAddresses + footer, then write it to contact/index.html
cat $NZ_PATH/contact/header.html "$ContactAddresses" $NZ_PATH/contact/footer.html > $APACHE_DOCUMENTROOT/contact/index.html
_NzSetWwwPermissions
}

#Create symlinks to zenphoto and Dokuwiki data dirs in the main user's (UID 1000) home directory
_NzSymlinkWebappDataDirs() {
echo "Not yet implemented."
#TODO

}


export _NzEditVarwwwSshKeys() {
nano /var/www/.ssh/authorized_keys
}

_NzPoweroff() {

}

_NzReboot() {

}

_NzUserGetName() { #Get main user's username
export NZ_USER=`getent passwd | grep 1000:1000 | awk -F ":" '{print $1}'`
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
_NzUserShowWwwAccess
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


################################################################################
#####################  CLEANUP AND TROUBLESHOOTING FUNCTIONS  ##################
################################################################################
_NzCleanupStaleFiles() { #Detect stale/dangerous files (install.php...) that should be deleted
#TODO: add tt-rss pre-upgrade dirs cleanup
#TODO: more cleanup
}

#Disable Owncloud maintenance mode
_NzDisableOwncloudMaintenanceMode() {
sed -i "/'maintenance'/c\  \'maintenance' => false," ${APACHE_DOCUMENTROOT}/owncloud/config/config.php
}

#Clear Dokuwiki Cache
_NzClearDwCache() {
rm -r $APACHE_DOCUMENTROOT/dokuwiki/data/cache/*
}

_NzSetWwwPermissions() {
chown -R $APACHE_USER:$APACHE_GROUP $APACHE_DOCUMENTROOT
}



_NzClearApcCache() { #Clear PHP APC cache 
service apache2 restart #so subtle
}

_NzCleanupApt() {
aptitude -y purge ~c
aptitude clean
}
