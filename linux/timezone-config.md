# system timezone

## 用户时区  
~/.profile  
`TZ='Asia/Shanghai'; export TZ`  

## 系统时区  
```
hunch@db-in-server:~$ sudo rm /etc/localtime
hunch@db-in-server:~$ sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```
