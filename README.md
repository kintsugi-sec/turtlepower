# turtlepower
Turtlepower is a collection of scripts I use to make boring repetive tasks I do in pentesting happen quick and easy so I can focus my energy on pwning.

When doing the OSCP I realised some other students may be interested in this so I put it on github.

How turtlepower works, is you download the scripts then put them in your .bashrc.

Simple, repetive tasks we do in pentesting like setting up webserver and downloading a file to the box we are attacking, or setting up a reverse shell are then reduced to a few keystrokes.

I have also made the scripts easy to adapt to add file transfer methods or shells you wish to add.

DISCLAIMER:
I made these scripts for me, the code is hacky. It doesn't really need to be that optimised does it though, not a whole lot of computing power going on here

# turtlepower scripts

## turtlepower_lhost
## turtlepower_server_pyserver & turtlepower_server_pyserver_ls

## turtlepower_reverse_shell


# Setup
Make a scripts folder in your kali home directory and put turtlepower in

```mkdir /home/kali/scripts
cd /home/kali/scripts
git clone https://github.com/kintsugi-sec/turtlepower
cd turtlepower
chmod a+x *
```


Add the following lines to your .bashrc
```## Turtlepower ## 

# shows us the IP of tun0 and sets it to $lhost_ip
alias turtlepower_lhost='/home/kali/scripts/turtlepower/./turtlepower_lhost.sh'

# server setup scripts
alias turtlepower_server_pyserver='/home/kali/scripts/turtlepower/./turtlepower_pyserver.sh'
alias turtlepower_server_pyserver_ls='/home/kali/scripts/turtlepower/./turtlepower_pyserver_ls.sh'

# reverse shell scripts
alias turtlepower_reverse_shell='/home/kali/scripts/turtlepower/./turtlepower_reverse_shell.sh'
```

Save, close and reload your .bashrc

```source .bashrc
```
