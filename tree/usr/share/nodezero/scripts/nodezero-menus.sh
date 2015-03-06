#!/bin/bash
# nodezero-admin menus
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

###################### Main menu
############################################

_NzMenuMain() {
    selection=
    until [ "$selection" = "0" ]; do
         echo ""
         echo "========== NODEZERO MAIN MENU =========="
         echo "1 - Tools Menu"
         echo "2 - User account and permissions menu"
         echo "3 - Backup menu"
         echo "4 - System maintenance and troubleshooting Menu"
         echo "5 - Edit main configuration file"
         echo "6 - Services configuration"
         echo "7 - Power off"
         echo "8 - Reboot"
         echo ""
         echo "0 - Exit program"
         echo ""
         echo -n "Enter Selection: "

         read selection
         echo ""
         case $selection in
             1 ) _NzMenuTools;; #OK
             2 ) _NzMenuUserAccount;; #OK
             3 ) source ${NZ_PATH}/scripts/NzMenuBackup; _NzMenuBackup;; #OK
             4 ) _NzMenuTroubleshooting;; #OK
             5 ) _NzEditMainConfig;;
             6 ) source ${NZ_PATH}/scripts/NzMenuServices; _NzMenuServices;;
             7 ) source ${NZ_PATH}/scripts/NzMenuTroubleshooting; _NzPoweroff;;
             8 ) source ${NZ_PATH}/scripts/NzMenuTroubleshooting; _NzReboot;;
             0 ) return 0;;
             * ) echo "Please enter a valid number"
         esac
    done
}


###################### Tools menu
############################################

_NzMenuTools() {
    selection=
    until [ "$selection" = "0" ]; do
         echo ""
         echo "========== TOOLS MENU =========="
         echo "1 - glances - general system statistics"
         echo "2 - dfc - display disk usage"
         echo "3 - htop - system monitor"
         echo "4 - ncdu - disk usage analyzer"
         echo "5 - last - display user login history"
         echo "6 - lastb - display failed login attempts"
         echo "7 - nethogs - display network usage by programs"
         echo "8 - iftop - display network usgae by connection"
         echo "9 - ranger - explore filesystem"
         echo "10 - Display system message of the day"
         echo "11 - Edit message of te day"
         echo "12 - lynis - Security Audit"
         #echo "12 - Purge old configuration files"
         #echo "13 - Clear packages cache"
         #echo "14 - aptitude - manage software packages/updates"
         #echo "15 - Update installed software now"
         echo "13 - goaccess - analyze and display web server logs"
         echo "14 - lnav - view system log files"
         echo "15 - iotop - monitor disk IO"
         echo ""
         echo "0 - Exit program"
         echo ""
         echo -n "Enter Selection:"
         read selection
         echo ""
         case $selection in
             1 ) _NzRunGlances;;
             2 ) _NzRunDfc;;
             3 ) _NzRunHtop;;
             4 ) _NzRunNcdu;;
             5 ) _NzRunLast;;
    	     6 ) _NzRunLastb;;
    	     7 ) _NzRunNethogs;;
    	     8 ) _NzRunIftop;;
        	 9 ) _NzRunRanger;;
        	 10 ) _NzShowMotd;;
        	 11 ) _NzEditMotd;;
        	 12 ) _NzRunLynis;;
        	 #12 ) _NzAptitudePurge;; #TODO: move to NzAptFunctions menu,rename aptfunctions to menuapt
        	 #13 ) _NzAptitudeClean;;
        	 #14 ) _NzRunAptitude;;
        	 #15 ) _NzAptUpgrade;;
        	 13 ) _NzRunGoAccess;;
             14 ) lnav;;
             15 ) _NzRunIotop;;
             0 ) exit;;
             * ) echo "Please enter a valid number"
         esac
    done
}


###################### Services menu
############################################

_NzMenuServices() {
    source ${NZ_PATH}/scripts/NzMenuApache2; _NzServiceApacheCheck
    source ${NZ_PATH}/scripts/NzMenuMysql; _NzServiceMysqlCheck
    source ${NZ_PATH}/scripts/NzMenuProsody; _NzServiceProsodyCheck
    source ${NZ_PATH}/scripts/NzMenuSSH; _NzServiceSSHCheck
    source ${NZ_PATH}/scripts/NzMenuTransmission; _NzServiceTransmissionCheck
    source ${NZ_PATH}/scripts/NzMenuMumble; _NzServiceMumbleCheck
    source ${NZ_PATH}/scripts/NzMenuSamba; _NzServiceSambaCheck

    selection=
    until [ "$selection" = "0" ]; do
        echo ""
        echo "################################### SERVICES #############"
        echo "#EDIT #NAME           #STATUS     #ACCESS"
        echo "$nz_menu_apache2_line"
        echo "$nz_menu_mysql_line"
        echo "$nz_menu_prosody_line"
        echo "$nz_menu_ssh_line"
        echo "$nz_menu_transmission_line"
        echo "$nz_menu_mumble_line"
        echo "$nz_menu_samba_line"
        echo ""
        echo "[Q] Exit ---- [0] Back to Main Menu"
        echo ""
        echo -n "Enter Selection: "

        read selection
        case $selection in
         1 ) _NzMenuApache2;;
         2 ) _NzMenuMysql;;
         3 ) _NzMenuProsody;;
         4 ) _NzMenuSSH;;
         5 ) _NzMenuTransmission;;
         6 ) _NzMenuMumble;;
         7 ) _NzMenuSamba;;
         Q ) exit 0;;
         0 ) return 0;;
         * ) echo "Please enter a valid number"
        esac
    done
}


###################### Maintenance menu
############################################

_NzMenuTroubleshooting() {
    selection=
    until [ "$selection" = "0" ]; do
         echo ""
         echo "========== CLEANUP AND TROUBLESHOOTING =========="
         echo "1 - Clear caches (PHP, dokuwiki)"
         echo "2 - Restore correct file permissions"
         echo "3 - Edit access permissions for the web server files" #TODO: no
         echo "5 - Cleanup stale install files"
         echo "6 - Cleanup APT packages cache and stale config files"
         echo "7 - Disable Owncloud maintenance mode."
         echo "8 - Regenerate web/xmpp servers security certificates"
         echo "9 - Change Mysql root password"
         echo "10 - Reboot machine"
         echo "11 - Power off machine"
         echo "12 - Test network connectivity to debian.org"
         echo "13 - Edit maintenance message"
         echo ""
         echo "0 - Exit program"
         echo ""
         echo -n "Enter Selection:"
         read selection
         echo ""
         case $selection in
             1 ) _NzClearCaches;; #OK
             2 ) source "${NZ_PATH}/scripts/NzConfigRoutines"; _NzFixPermissions;; #OK
             3 ) _NzClearApcCache;;
             4 ) _NzEditVarwwwSshKeys;;
             5 ) _NzCleanupStaleFiles;;
             6 ) source "${NZ_PATH}/scripts/NzAptFunctions"; _NzAptCleanup;;
             7 ) _NzDisableOwncloudMaintenanceMode;;
             8 ) _NzRegenCertificates;;
             9 ) source "${NZ_PATH}/scripts/NzSqlFunctions"; _NzMysqlRootPwReset;;
             10 ) _NzReboot;;
             11 ) _NzPowerOff;;
             12 ) _NzTestInetConnection;;
             13 ) _NzEditMotd;;
             0 ) exit;; #TODO: Add entries from the menu
             * ) echo "Invalid entry.";;
         esac
    done
}



################ Package Managament menu
################################################## 

_NzMenuApt() {
    selection=
    until [ "$selection" = "0" ]; do
         echo ""
         echo "========== PACKAGE MANAGEMENT =========="
         echo "1 - Clear caches (PHP, dokuwiki)"
         echo "2 - Restore correct file permissions"
         echo "3 - Edit access permissions for the web server files" #TODO: no
         echo "5 - Cleanup stale install files"
         echo "6 - Cleanup APT packages cache and stale config files"
         echo "7 - Disable Owncloud maintenance mode."
         echo "8 - Regenerate web/xmpp servers security certificates"
         echo ""
         echo "0 - Exit program"
         echo ""
         echo -n "Enter Selection:"
         read selection
         echo ""
         case $selection in
             1 ) _NzClearCaches;; #OK
             2 ) source "${NZ_PATH}/scripts/NzConfigRoutines"; _NzFixPermissions;; #OK
             3 ) _NzClearApcCache;;
             4 ) _NzEditVarwwwSshKeys;;
             5 ) _NzCleanupStaleFiles;;
             6 ) source ${libdir}/scripts/NzAptFunctions; _NzAptCleanup;;
             7 ) _NzDisableOwncloudMaintenanceMode;;
             8 ) _NzRegenCertificates;;
             0 ) exit;; #TODO: Add entries from the menu
             * ) echo "Invalid entry.";;
         esac
    done
}

############## User Account menu
############## TODO: Move this to security/permissions menu

selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "========== USER ACCOUNT MENU =========="
     _NzUserShowWwwaccess
     _NzUserShowTransmissionaccess
     echo "1 - Change user access to web server files"
     echo "2 - Change user access to transmission downloads"
     echo "3 - Change transmission web interface username/password"
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) _NzUserToggleWwwaccess;;
         2 ) _NzUserToggleTransmissionaccess;;
         3 ) _NzUserTransmissionPassword;;
         0 ) return 0;;
         * ) echo "Please enter a valid number"
     esac
done



############## Apache2 Menu
##########################################

_NzMenuApache2() {
    _NzServiceApacheCheck

        if $nz_apache2_installed="no" #If apache2 is not installed, show this menu
        then
            selection=
            until [ "$selection" = "0" ]; do
                echo ""
                echo "## Selected service:"
                echo "Apache web server [Not installed]"
                echo " [I] Install service"
                echo " [0] Back to main menu"
                echo ""
                echo -n "Enter Selection: "

                read selection
                case $selection in
                    I ) false;; #TODO
                    0 ) return 0;;
                    * ) echo "Please enter a valid number"
                esac
            done

        #Else if apache2 is installed, show this menu
        else
            selection=
            until [ "$selection" = "0" ]; do
                echo ""
                echo "## Selected service:"
                echo "Apache web server [$nz_apache2_status] [$nz_apache2_firewall]"
                echo " [1] $nz_service_toggle_action"
                echo " [2] Firewall: Allow access from Internet"
                echo " [3] Firewall: Allow access from LAN only"
                echo " [4] Firewall: Disallow all access"
                echo " [5] Edit password protected directories"
                echo " [6] List available web applications"
                echo " [7] List installed web applications"
                echo " [8] Install Web application"
                echo " [9] Remove Web application"
                echo " [10] Regenerate homepage"
                echo ""
                echo " [U] Uninstall service"
                echo " [0] Back to main Menu"
                echo ""
                echo -n "Enter Selection: "

                read selection
                case $selection in
                    1 ) _NzServiceToggle apache2;;
                    2 ) _NzFirewallAllow 80,443 tcp;; #TODO use ufw application rulesets
                    3 ) _NzFirewallDeny 80,443 tcp;_NzAllowFromLAN 80,443 tcp;;
                    4 ) _NzFirewallDeny 80,443 tcp;;
                    5 ) false ;; #TODO
                    6 ) false ;; #TODO
                    7 ) false ;; #TODO
                    8 ) _NzInstallWebappPrompt;;
                    9 ) source "$NZ_PATH/scripts/NzConfigRoutines"; _NzRegenHomepage;;
                    10 ) source "$NZ_PATH/scripts/NzConfigRoutines"; _NzRegenHomepage;;
                    U ) false ;; #TODO
                    0 ) return 0;;
                    * ) echo "Please enter a valid number"
                esac
            done
        fi
    done

}

################# Prosody XMPP server management
####################################################################

_NzMenuProsody() {
    selection=
    until [ "$selection" = "0" ]; do
    _NzProsodyGetStatus
    _NzProsodyGetRegistrationsStatus
    echo "
    ### XMPP/JABBER SERVER (PROSODY) #############################
     - [1] Status: [$PROSODY_STATUS]
     - [2] New account registration: [$PROSODY_REG_ENABLED]
     - [3] Add a new account
     - [4] Delete an account
     - [5] Change an account password
     - [6] List accounts
     - [0] Back to main Menu
    "
         read selection
         case $selection in
             1 ) _NzProsodyToggle;;
             2 ) _NzProsodyToggleResgistrations;; #TODO
             3 ) _NzProsodyAddUser;;
             4 ) _NzProsodyDelUser;;
             5 ) _NzProsodyChangeUserPassword;;
             6 ) _NzProsodyGetUserlist; echo $PROSODY_ACCOUNT_LIST;;
             0 ) exit;;
             * ) echo "Please enter a valid number"
        esac
    done
}

_NzMenuProsody