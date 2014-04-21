#!/bin/bash
set -o errexit

echo "
########################################################
#################### Nodezero installer ################
########################################################
"
cp -ra tree/* /
cp -ra wwwroot/* /var/www/
/usr/share/nodezero/initialsetup.sh