#!/bin/bash
source ~/.config/nodezero.conf

#Mount the server filesystem through sftp 
_NzClientMountSftp() {
gvfs-mount sftp://${NZ_MAIN_USER}@${NZ_FQDN}:${SFTP_PORT}
#TODO define NZ_MAIN_USER as the user having UID 1000 on the server
#TODO define SFTP_PORT in config
#TODO fetch NZ_FQDN from the server
}

#Show the server filesystem in a file manager
_NzClientOpenSftp() {
_NzClientMountSftp
xdg-open sftp://${NZ_MAIN_USER}@${NZ_FQDN}:${SFTP_PORT}
}

#Open the server's web interface in a browser
_NzClientRunWebInterface() {
xdg-open ${APACHE_PROTO}${NZ_FQDN}
#TODO fetch $APACHE_PROTO from the server config
}
