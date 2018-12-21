# ubuntu

# change password policy
```
sudo gedit /etc/pam.d/common-password
```

password     [success=1 default=ignore]    pam_unix.so obscure sha512

To set minimum password length, add minlen=N (N is a number) to the end of this line.
To disable complexity check, remove “obscure” from that line.

https://www.server-world.info/en/note?os=Ubuntu_16.04&p=password



# Jupyterhub on 18.04 (multi-users)
```
# change superuser password
sudo passwd
su

# system update 
sudo apt-get update
sudo apt-get upgrade

# enable ssh connection
sudo apt-get install openssh-server -y
sudo service ssh restart


# Download Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh

# Install Anaconda
bash Anaconda3-5.2.0-Linux-x86_64.sh -b

sudo apt install curl

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get -y install nodejs
sudo apt-get -y install npm

# Install Java Runtime Environment
sudo apt-get -y install default-jre

# Install Python 3 pip
sudo apt-get -y install python3-pip

# Install configurable-http-proxy
sudo npm install -g configurable-http-proxy

# Install Optimus & Spark
pip3 install optimuspyspark scikit-learn H2O

# Install JupyterHub
pip3 install jupyterhub

# Upgrade notebook
pip3 install --upgrade notebook

# configure jupyterhub
sudo mkdir /etc/jupyterhub

jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py

sudo jupyterhub --config /etc/jupyterhub/jupyterhub_config.py

# create service for jupyterhub
cd /etc/systemd/system/
wget https://gist.github.com/Jarrioja/e144697ba17bf0cdec73618c7ac1689c/raw/320e61d614926a15c988873a8b7523ec6e48c926/jupyterhub.service

# plug jupyterlab
/etc/jupyterhub/jupyterhub_config.py
  # change the line  
  c.Spawner.default_url = '/lab'   

pip3 install jupyterlab
jupyter serverextension enable --py jupyterlab --sys-prefix
jupyter labextension install @jupyterlab/hub-extension
jupyter lab build

# Stop Autoboot service
systemctl stop jupyterhub

# Enable Autoboot service
systemctl enable jupyterhub

# Start Service
systemctl start jupyterhub

```
# Jupyter (single-user)
```
# system update 
sudo apt-get update
sudo apt-get upgrade

# enable ssh connection
sudo apt-get install openssh-server -y
sudo service ssh restart


# Download Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh

# Install Anaconda
bash Anaconda3-5.2.0-Linux-x86_64.sh -b

# Install Python 3 pip
sudo apt-get -y install python3-pip

# Install Java Runtime Environment
sudo apt-get -y install default-jre

# python plugin install
pip3 install optimuspyspark scikit-learn H2O
pip3 install opencv-contrib-python
pip3 install --upgrade notebook

# disable firewall
sudo ufw disable

# run jupyter
jupyter notebook --allow-root --ip=192.168.174.137 --no-browser
jupyter notebook --allow-root --ip=0.0.0.0 --no-browser






```

# Jupyterhub on 16.04 (multi-users)
```
sudo apt-get update
sudo apt install python3-pip
v=8
curl -sL https://deb.nodesource.com/setup_$v.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install npm nodejs-legacy
sudo apt-get purge nodejs npm

sudo npm install -g configurable-http-proxy
sudo python3 -m pip install jupyterhub 
sudo python3 -m pip install --upgrade notebook
jupyterhub

```
