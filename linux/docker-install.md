# docker install

[How To Install and Use Docker on Debian 9 \\| DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-9)


<!-- toc -->

- [Step1 apt-get install docker-ce](#Step1-apt-get-install-docker-ce)
- [Step 2 — Executing the Docker Command Without Sudo (Optional)](#Step-2--Executing-the-Docker-Command-Without-Sudo-Optional)
  * [在tmux中将当前用户加入docker group](#%E5%9C%A8tmux%E4%B8%AD%E5%B0%86%E5%BD%93%E5%89%8D%E7%94%A8%E6%88%B7%E5%8A%A0%E5%85%A5docker-group)
    + [***`sudo usermod -aG docker hunch`***](#sudo-usermod--aG-docker-hunch)
    + [***`newgrp docker`***](#newgrp-docker)
- [Step 3 修改docker数据存储路径](#Step-3-%E4%BF%AE%E6%94%B9docker%E6%95%B0%E6%8D%AE%E5%AD%98%E5%82%A8%E8%B7%AF%E5%BE%84)
  * [/etc/docker/daemon.json](#etcdockerdaemonjson)
  * [已有数据同步到 /data/docker](#%E5%B7%B2%E6%9C%89%E6%95%B0%E6%8D%AE%E5%90%8C%E6%AD%A5%E5%88%B0-datadocker)
  * [重启docker](#%E9%87%8D%E5%90%AFdocker)
- [国内仓库](#%E5%9B%BD%E5%86%85%E4%BB%93%E5%BA%93)

<!-- tocstop -->
## Step1 apt-get install docker-ce
The Docker installation package available in the official Debian repository may not be the latest version. To ensure we get the latest version, we'll install Docker from the official Docker repository. To do that, we'll add a new package source, add the GPG key from Docker to ensure the downloads are valid, and then install the package.

First, update your existing list of packages:

sudo apt update   
Next, install a few prerequisite packages which let apt use packages over HTTPS:  




```
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
```

Then add the GPG key for the official Docker repository to your system:  

```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```  
Add the Docker repository to APT sources:  


```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
```
Next, update the package database with the Docker packages from the newly added repo:    


```
sudo apt update
```
Make sure you are about to install from the Docker repo instead of the default Debian repo:   


```
apt-cache policy docker-ce
```


You'll see output like this, although the version number for Docker may be different:  


```
Output of apt-cache policy docker-ce
docker-ce:
  Installed: (none)
  Candidate: 18.06.1~ce~3-0~debian
  Version table:
     18.06.1~ce~3-0~debian 500
        500 https://download.docker.com/linux/debian stretch/stable amd64 Packages
```

Notice that docker-ce is not installed, but the candidate for installation is from the Docker repository for Debian 9 (stretch).


Finally, install Docker:


```
sudo apt install docker-ce
```



Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:  



```
sudo systemctl status docker
```

The output should be similar to the following, showing that the service is active and running:  


```
Output
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2018-07-05 15:08:39 UTC; 2min 55s ago
     Docs: https://docs.docker.com
  Main PID: 21319 (dockerd)
   CGroup: /system.slice/docker.service
           ├─21319 /usr/bin/dockerd -H fd://
           └─21326 docker-containerd --config /var/run/docker/containerd/containerd.toml
```  
Installing Docker now gives you not just the Docker service (daemon) but also the docker command line utility, or the Docker client. We'll explore how to use the docker command later in this tutorial.


## Step 2 — Executing the Docker Command Without Sudo (Optional)  
***只有docker group的用户和root用户才能执行docker命令***  

By default, the docker command can only be run the root user or by a user in the docker group, which is automatically created during Docker's installation process. If you attempt to run the docker command without prefixing it with sudo or without being in the docker group, you'll get an output like this:

```
Output
docker: Cannot connect to the Docker daemon. Is the docker daemon running on this host?
See 'docker run --help'.
```

If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:

`sudo usermod -aG docker ${USER}`  
To apply the new group membership, log out of the server and back in, or type the following:

`su - ${USER}`  
You will be prompted to enter your user's password to continue.  

Confirm that your user is now added to the docker group by typing:  

```
id -nG
```
Output  

```
sammy sudo docker
```  
If you need to add a user to the docker group that you're not logged in as, declare that username explicitly using:

```
sudo usermod -aG docker username
```   
The rest of this article assumes you are running the docker command as a user in the docker group. If you choose not to, please prepend the commands with sudo.

Let's explore the docker command next.   

### 在tmux中将当前用户加入docker group  


#### ***`sudo usermod -aG docker hunch`*** 

将用户hunch加入docker group中    

#### ***`newgrp docker`*** 

刷新当前session    



Horribly hacky, but you could use two layers of newgrp to achieve this for a particular group:

`id -g`  
...will give you the current primary group ID. We'll call this orig_group for the purposes of this example. Then:


`newgrp <new group name>`  
...will switch you to that group as the primary and add it to the list of groups returned by groups or id -G. Now, a further:


`newgrp <orig_group>`  
...will get you a shell in which you can see the new group and the primary is the original one.


This is horrible and will only get you one group added at a time, but it has helped me out a couple of times to get groups added without logging out/in my whole X session (e.g. to get fuse added as a group to a user so that sshfs will work).


Edit : This doesn't require you to type your password either, which su will.

## Step 3 修改docker数据存储路径  

### /etc/docker/daemon.json
```
{
  "data-root": "/data/docker"
}
```

### 已有数据同步到 /data/docker

`sudo rsync -axPS /var/lib/docker/ /data/docker`  

### 重启docker  
```
sudo systemctl stop docker
sudo systemctl start docker
sudo systemctl restart docker
```

## 国内仓库  
/etc/docker/daemon.json  
```
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
```


