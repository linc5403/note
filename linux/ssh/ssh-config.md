# SSH 配置
## 保活

```
TCPKeepAlive=yes
ServerAliveInterval 10
ServerAliveCountMax 5
```

示例:  
```
Host         40.73.37.81
Host         40.73.39.124
Port         22
TCPKeepAlive=yes
ServerAliveInterval 10
ServerAliveCountMax 5
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_Azure
```

## 隧道

    将本地端口3388映射为远端40.73.39.124的3306端口  
```
ssh -NCPf hunch@40.73.39.124 -L 3388:127.0.0.1:3306
```
```
参数：

-C    使用压缩功能，是可选的，加快速度。 
-P    用一个非特权端口进行出去的连接。 
-f    一旦SSH完成认证并建立port forwarding，则转入后台运行。 
-N    不执行远程命令。该参数在只打开转发端口时很有用（V2版本SSH支持）
```

通过连接本地3388端口来连接40.73.39.124的3306端口

```
mysql -u hunch -pasdf1234 -P 3388 -h 127.0.0.1
```

## 跳转登录公网服务器(公网服务器不用开放3306端口)

1. 在有ssh登录权限的机器上运行

```
ssh  -L 0.0.0.0:19999:127.0.0.1:3306 root@36.133.152.22 -N -f
```
监听本地19999端口的流量，转发到远端(36.133.152.22)的3306端口

2. 其他人可以使用mysql访问跳转主机

```
mysql -uroot -pasdf -h 192.168.50.25 -P 19999
```


