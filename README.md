# ubuntu

# change password policy
sudo gedit /etc/pam.d/common-password


password     [success=1 default=ignore]    pam_unix.so obscure sha512

To set minimum password length, add minlen=N (N is a number) to the end of this line.
To disable complexity check, remove “obscure” from that line.

https://www.server-world.info/en/note?os=Ubuntu_16.04&p=password


# 原生XRDP

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install tightvncserver

#會有錯，接著執行下面指命即可

sudo apt-get install -f

sudo apt-get install xrdp -y

sudo gedit /etc/xrdp/startwm.sh

echo unity>~/.xsession

sudo service xrdp restart


# Reconnect to the same session throug xrdp
sudo gedit /etc/xrdp/xrdp.ini

You might be prompted for a password. if this is the case, provide the password and Press enter.   When the file is open, locate the section [xrdp1] and replace the following line

port=-1
with the line
port=ask-1
