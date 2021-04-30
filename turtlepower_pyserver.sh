#!/bin/bash

# lhost must be set with export turtlepower_lhost=IP_ADDRESS
[[ -z "$turtlepower_lhost" ]] && { echo -e "LHOST not set do it with export turtlepower_lhost=IP_ADDRESS \n**TRY turtlepower_lhost to output it ** "; exit 1; }

cat /home/kali/scripts/turtlepower/turtlepower_banner.txt

pyserver_ip=$turtlepower_lhost

echo -e 'python http server is: \n\nhttp://'$pyserver_ip'/'
echo ""
echo "List file download commands of directory?"
echo "Y for yes, anything else for no"
echo ""
read LS_FILES_SCRIPT
echo ""


if [ "$LS_FILES_SCRIPT" = "Y" ] ; then
	/home/kali/scripts/turtlepower/./turtlepower_pyserver_ls.sh 80
else
	echo ""
fi

sudo python -m SimpleHTTPServer 80
