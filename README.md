# ubuntu

# change password policy
```
sudo gedit /etc/pam.d/common-password
```

password     [success=1 default=ignore]    pam_unix.so obscure sha512

To set minimum password length, add minlen=N (N is a number) to the end of this line.
To disable complexity check, remove “obscure” from that line.

https://www.server-world.info/en/note?os=Ubuntu_16.04&p=password



# XRDP for xfce4
```
sudo apt-get install xrdp -y

sudo apt-get install xfce4
```
### for single user

echo xfce4-session >~/.xsession 


### for multi xrdp connection
```
sudo gedit /etc/xrdp/startwm.sh

     << after the fi section add the following line>>
     
      echo xfce4-session >~/.xsession

sudo service xrdp restart

```
# Reconnect to the same session throug xrdp <no longer use>

~~ sudo gedit /etc/xrdp/xrdp.ini ~~

~~ You might be prompted for a password. if this is the case, provide the password and Press enter.   When the file is open, locate the section [xrdp1] and replace the following line ~~

~~ port=-1 ~~
~~ with the line ~~
~~ port=ask-1 ~~
