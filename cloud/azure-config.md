# Azure配置

## 挂载磁盘
https://www.cnblogs.com/sparkdev/p/8108921.html

### 1. 格式化
```
cd /dev
ls sd*
df -h
(echo n; echo p; echo 1; echo ; echo ; echo w) | sudo fdisk /dev/sdc
ls sd*
sudo mkfs -t ext4 /dev/sdc1
sudo mkdir /data && sudo mount /dev/sdc1 /data
```
### 2. 获取磁盘UUID：  
```
sudo -i blkid
```

### 3. `/etc/fstab`增加  
```
UUID=9cc7717c-e8b6-40c0-9bd1-967ec302c86d       /data   ext4    defaults,nofail,barrier=0       1       2
```

