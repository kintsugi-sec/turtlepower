#!/bin/bash

# NOTE:
# This script assumes you have Impacket installed and 
# it is in this directory
# /usr/share/doc/python3-impacket/examples/smbserver.py

# This is where it should be by default on Kali

# If you don't have impacket installed, install it.
# git clone https://github.com/SecureAuthCorp/impacket.git 

# If the smbserver.py module is elsewhere, change the impacket_directory variable appropriately

# lhost must be set with export turtlepower_lhost=IP_ADDRESS
[[ -z "$turtlepower_lhost" ]] && { echo -e "LHOST not set do it with export turtlepower_lhost=IP_ADDRESS \n**TRY turtlepower_lhost to output it ** "; exit 1; }

cat /home/kali/scripts/turtlepower/turtlepower_banner.txt

smbserver_ip=$turtlepower_lhost
impacket_directory=/usr/share/doc/python3-impacket/examples/smbserver.py

echo -e 'SMB server is: \n\n\\\\'$smbserver_ip'\SHARE'
echo ""
echo "List file download or execute commands of directory?"
echo "Y for yes, anything else for no"
echo ""
read LS_FILES_SCRIPT
echo ""


if [ "$LS_FILES_SCRIPT" = "Y" ] ; then
	/home/kali/scripts/turtlepower/./turtlepower_smbserver_ls.sh
else
	echo ""
fi


current_directory=$(pwd)

sudo python3 $impacket_directory SHARE $current_directory

