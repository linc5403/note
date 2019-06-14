# linux cmd
<!-- toc -->

- [删除特殊文件名的文件](#%E5%88%A0%E9%99%A4%E7%89%B9%E6%AE%8A%E6%96%87%E4%BB%B6%E5%90%8D%E7%9A%84%E6%96%87%E4%BB%B6)
- [设置系统编辑器](#%E8%AE%BE%E7%BD%AE%E7%B3%BB%E7%BB%9F%E7%BC%96%E8%BE%91%E5%99%A8)
- [netstat](#netstat)
- [后台执行](#%E5%90%8E%E5%8F%B0%E6%89%A7%E8%A1%8C)
- [删除所有指定目录](#%E5%88%A0%E9%99%A4%E6%89%80%E6%9C%89%E6%8C%87%E5%AE%9A%E7%9B%AE%E5%BD%95)
- [cp 大量文件](#cp-%E5%A4%A7%E9%87%8F%E6%96%87%E4%BB%B6)
- [netstat](#netstat)
- [sort](#sort)
- [awk](#awk)
- [ln -s](#ln--s)
- [rsync](#rsync)
- [删除指定日期之前的文件](#%E5%88%A0%E9%99%A4%E6%8C%87%E5%AE%9A%E6%97%A5%E6%9C%9F%E4%B9%8B%E5%89%8D%E7%9A%84%E6%96%87%E4%BB%B6)
- [nload (network load) 查看流量](#nload-network-load-%E6%9F%A5%E7%9C%8B%E6%B5%81%E9%87%8F)

<!-- tocstop -->

### 删除特殊文件名的文件
`rm -rf -- -dx`
    
### 设置系统编辑器
`sudo update-alternatives --config editor`

### netstat
```
     netstat -lntp

```

```
$sudo netstat -tulpen | grep 1081
tcp        0      0 0.0.0.0:1081            0.0.0.0:*               LISTEN      13         41905719   68152/polipo
```
### 后台执行  
```
nohup cmd  > /dev/null &
```
### 删除所有指定目录
```
find /test/subtest -type d -name '.svn' -exec rm -rf {} \\;
```
### cp 大量文件  

```
sudo find source/ -type f -name "*.jpg" -exec cp {} target \\; 
```
linux  
```
find ./ -type f -exec cp {} ../2 \;
```

[top](#linux-cmd)

### netstat  
`netstat -atunlp`   
parameter | meaning       
- | -       
a | all   
t | tcp  
u | udp  
n | port number  
l | listening  
p | program  
 
### sort  
sort -k14,14n -k15,15n  

### awk  
```
docker ps | grep 'zhiying-web' | awk {'print $1'}  
kill -9 ` ps -e | grep salt | awk 'NR==1 {print $1}' `  
```

### ln -s 
    ln -s 已经有的 快捷方式
```
ln -s source shortcut
```

### rsync
```
rsync -aP --rsh=ssh  hunch@40.73.33.137:/data/temp/mp4/finished ./new
rsync -aP --rsh=ssh --include="*.mp4" --exlude=* hunch@40.73.33.137:/data/temp/mp4/finished ~/temp/
sshpass -p remotepasswd rsync -avz --delete local_dir -e ssh remoteuser@192.168.5.38:remote_dir  

rsync -aP --rsh=ssh --include="*.mp4" --exclude="*.part" test3:/data/temp/ ./finished
```

**`-S, --sparse 对稀疏文件进行特殊处`**
**`-P 等同于 --partial --progress 显示备份过程`**   
**`-v, --verbose 详细模式输出`**
**`--rsh=COMMAND 指定使用rsh、ssh方式进行数据同步`**
**`-x, --one-file-system 不要跨越文件系统边界`**
**`-z 传输时压缩`**
[top](#linux-cmd)


### 删除指定日期之前的文件
```
find asynctask/ -mtime +92 -type f -exec sudo rm -f {} \\;
```
文件的Access time，atime 是在读取文件或者执行文件时更改的。
文件的 Modified time，mtime 是在写入文件时随文件内容的更改而更改的。
文件的 Create time，ctime 是在写入文件、更改所有者、权限或链接设置时随 Inode 的内容更改而更改的。

### nload (network load) 查看流量

[top](#linux-cmd)


### 删除grep的结果

```
git status | grep aivideo | xargs rm -rf
```

### macos下xargs参数
```
ls -l | grep -v "^d" | grep docker | awk '{print $NF}' | xargs -I {} mv {} docker
```

### linux下xargs带参数
```
find ./ -maxdepth 1 -type f | grep -v "^\./\." | xargs -i mv {} test
```

[top](#linux-cmd)

### 查看dns
```
cat /etc/resolv.conf 
```
[top](#linux-cmd)


### 统计目录下的文件个数

```
ls -l |grep "^-"|wc -l
ls -lR|grep "^-"|wc -l
```
