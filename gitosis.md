===administrator local side & developer user======
run git bash (windows)
ssh-keygen -t rsa -C "seanuw@aten.com.tw"
cd ~/.ssh

#
scp id_rsa.pub username@servername:/tmp/id_rsa.user1.pub


===server side =====

sudo adduser -m git
sudo passwd git

sudo mkdir /home/git/repositories
sudo chown git:git /home/git/repositories
sudo chmod 755 /home/git/repositories

sudo apt-get install python-setuptools
cd /tmp
git clone https://github.com/tv42/gitosis.git
cd gitosis
sudo python setup.py install

cp ~/.ssh/id_rsa.pub /tmp
sudo -H -u git gitosis-init < /tmp/id_rsa.pub
sudo chmod 755 /home/git/repositories/gitosis-admin.git/hooks/post-update

=== administrator local side ===
cd <git_admin_directory> (自行設定)
git clone git@192.168.140.131:gitosis-admin.git
cd gitosis-admin (進入gitosis管理目錄, 也有git 控管)
(keydir目錄裡面存放目前所有Git使用者的公鑰，建議用user email  xxx@xxx.xxx.xx)


<<<<<<<<<<<<  edit gitosis.conf >>>>>>>>>>>>

[gitosis]

[group gitosis-admin]
members = seanuw@aten.com.tw
writable = gitosis-admin

[group project1]
members = seanuw@aten.com.tw
writable = project1

<<<<<<<<<<<<  >>>>>>>>>>>>

git add & commit
git push origin master





=== developer user  ===
run git bash
create directory 
mkdir project1 
cd project1
git init
git add&commit file
git remote add origin git@git_server_dev:project1.git
