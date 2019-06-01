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



