# redis install
## 安装  
```
wget http://download.redis.io/releases/redis-5.0.0.tar.gz
sudo tar -C /usr/local -xzf redis-5.0.0.tar.gz
cd /usr/local/redis-5.0.0/
sudo make
sudo make install
sudo utils/install_server.sh
```  
Port           : 6379  
Config file    : /etc/redis/6379.conf  
Log file       : /var/log/redis_6379.log  
Data dir       : /data/redis/6379  
Executable     : /usr/local/bin/redis-server  
Cli Executable : /usr/local/bin/redis-cli  
Is this ok? Then press ENTER to go on or Ctrl-C to abort.  
Copied /tmp/6379.conf => /etc/init.d/redis_6379    
  
```
sudo vi /etc/redis/6379.conf
```

**bind requirepass**   

```
sudo service redis_6379 restart
```
