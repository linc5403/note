#!/bin/bash
# salt master使用build-server
SALT_MASTER='139.217.231.24'

echo "apt-update"
sudo apt-get update

echo "install tmux"
sudo apt-get -y install tmux

echo "install docker"
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt -y install docker-ce
sudo usermod -aG docker hunch

echo "install docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "install salt-minion"
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P
sudo sh -c "echo 'master: ${SALT_MASTER}' > /etc/salt/minion.d/master.conf"
sudo service salt-minion restart

# # 只需要在master上进行安装
# # echo "install salt-master"
# # curl -L https://bootstrap.saltstack.com -o install_salt.sh
# # sudo sh install_salt.sh -P -M

echo "change timezone"
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
