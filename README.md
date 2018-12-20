# ubuntu

# change password policy
```
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


# jupyterhub
```
sudo passwd
su
sudo apt-get update
sudo apt-get install openssh-server -y
sudo service ssh restart
sudo apt-get upgrade
#Download Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh

#Install Anaconda
bash Anaconda3-5.2.0-Linux-x86_64.sh -b

sudo apt install curl

#Install NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get -y install nodejs
sudo apt-get -y install npm
#Install Java Runtime Environment
sudo apt-get -y install default-jre

#Install Python 3
sudo apt-get -y install python3-pip

#Install configurable-http-proxy
sudo npm install -g configurable-http-proxy

#Install Optimus & Spark
pip3 install optimuspyspark scikit-learn H2O

#Install JupyterHub
pip3 install jupyterhub

#Upgrade notebook
pip3 install --upgrade notebook

sudo mkdir /etc/jupyterhub

jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py

sudo jupyterhub --config /etc/jupyterhub/jupyterhub_config.py

# create service for jupyterhub
cd /etc/systemd/system/
wget https://gist.github.com/Jarrioja/e144697ba17bf0cdec73618c7ac1689c/raw/320e61d614926a15c988873a8b7523ec6e48c926/jupyterhub.service

#Stop Autoboot service
systemctl stop jupyterhub

#Enable Autoboot service
systemctl enable jupyterhub

#Start Service
systemctl start jupyterhub



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
