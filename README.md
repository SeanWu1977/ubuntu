# ubuntu

# change password policy
```ruby
sudo gedit /etc/pam.d/common-password
```

password     [success=1 default=ignore]    pam_unix.so obscure sha512

To set minimum password length, add minlen=N (N is a number) to the end of this line.
To disable complexity check, remove “obscure” from that line.

https://www.server-world.info/en/note?os=Ubuntu_16.04&p=password


# XRDP for 18.04
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -f
sudo apt-get install xrdp -y
sudo apt install gnome-tweak-tool
sudo service xrdp restart
登入後執行Tweak,
Extensions -> open
Desktop -> show icons (才會有open termial)
```

# XRDP for xfce4 16.04
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install xrdp -y
sudo apt-get install xfce4
```
### for single user
```
echo xfce4-session >~/.xsession 
```
### for multi xrdp connection
```
sudo gedit /etc/xrdp/startwm.sh
     << after the fi section add the following line>>     
      echo xfce4-session >~/.xsession
sudo service xrdp restart
```

### XRDP for mate 16.04
```
sudo apt-get update
sudo apt-get install mate-core mate-desktop-environment mate-notification-daemon
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n mate-session \n' /etc/xrdp/startwm.sh
```


# jupyter
```
sudo apt install python3-pip
pip3 install --upgrade pip
sudo python3 -m pip uninstall pip && sudo apt install python3-pip --reinstall
pip3 install jupyter
jupyter notebook
```
# Reconnect to the same session throug xrdp <no longer use>

~~sudo gedit /etc/xrdp/xrdp.ini~~

~~You might be prompted for a password. if this is the case, provide the password and Press enter.   When the file is open, locate the section [xrdp1] and replace the following line~~

~~port=-1~~

~~with the line~~

~~port=ask-1~~
