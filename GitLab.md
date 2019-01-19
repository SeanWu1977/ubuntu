```
sudo apt-get install curl openssh-server ca-certificates postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce
sudo gitlab-ctl reconfigure

sudo nano /etc/gitlab/gitlab.rb
external_url 'http://10.0.2.15:81'
sudo gitlab-ctl reconfigure
```

```
    Local                        git lab
 ~/.ssh/id_rsa                id -> SSH Keys -> id_rsa.pub
                              id belong to group
                              id belong to git project with access level


```
