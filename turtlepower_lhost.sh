#!/bin/bash
# This gives you a line to copy and paste your tun0 lhost address as a variable
# I have avoided hardcoding lhost address into the rest of the scripts so they are portable
# So if you use tap0 or eth0 a lot, just change the first line to your network interface
 
lhost_ip=$(ip a l tun0 | awk '/inet / {print $2}' | cut -d/ -f1)
echo -e 'tun0 lhost_ip is: \n'$lhost_ip
echo ""
echo "set it as a variable with:" 
echo "export turtlepower_lhost=$lhost_ip"
echo ""

