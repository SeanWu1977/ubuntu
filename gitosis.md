### administrator local side & developer user

```
run git bash (windows only)

# create key pair
# -C 為login name，沒有一定格式，但使用e-mail較方便管理
ssh-keygen -t rsa -C "xxxx@xxx.xxx.xx"

# copy public key to git server
# develop can send public key to administrator (see "administrator local side")
cd ~/.ssh
scp id_rsa.pub username@servername:/tmp/id_rsa.user1.pub
```

### server side (用super user登入即可)

```
# create git user
sudo adduser -m git
sudo passwd git

# create repositories 
# SERVER上專案目錄會在此底下產生
sudo mkdir /home/git/repositories
sudo chown git:git /home/git/repositories
sudo chmod 755 /home/git/repositories

# 下載&安裝gotosis
sudo apt-get install python-setuptools
cd /tmp
git clone https://github.com/tv42/gitosis.git
cd gitosis
sudo python setup.py install

# 使用sudo 切換(-H)至使用使(-u)git 執行 gitosis-init
sudo -H -u git gitosis-init < /tmp/id_rsa.user1.pub
sudo chmod 755 /home/git/repositories/gitosis-admin.git/hooks/post-update
```

### administrator local side (windows or linux)

```
# 建立gitosis管理目錄
mkdir <git_admin_directory> 
cd <git_admin_directory> 

# 複製git server上的管理目錄
git clone git@servername:gitosis-admin.git

# 進入gitosis管理目錄, 有git控管
cd gitosis-admin 

# keydir目錄裡面存放目前所有Git使用者的公鑰，建議用user email  xxx@xxx.xxx.xx
# 其它使用者的公鑰可上傳至此，再由管理員push至server

# gitosis.conf 專案目錄權限控管的設定檔

   [gitosis]

   [group gitosis-admin]
   members = seanuw@aten.com.tw
   writable = gitosis-admin

   [group project1]
   members = seanuw@aten.com.tw
   writable = project1

# 將修改push至git server
git add & commit
git push origin master
```


### developer user
```
# 需先將public key 給管理者上傳(前一小節)

run git bash
create directory 
mkdir project1 
cd project1
git init
git add&commit file
git remote add origin git@servername:project1.git

```
