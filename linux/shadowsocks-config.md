# Shadowsocks Configuration
<!-- toc -->

- [服务器端配置](#%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%AB%AF%E9%85%8D%E7%BD%AE)
- [客户端配置](#%E5%AE%A2%E6%88%B7%E7%AB%AF%E9%85%8D%E7%BD%AE)
- [polipo](#polipo)
- [ss开机自启](#ss%E5%BC%80%E6%9C%BA%E8%87%AA%E5%90%AF)

<!-- tocstop -->
## 服务器端配置

* /usr/bin/python /usr/local/bin/ssserver -c /etc/shadowsocks-python/config.json -d start


* root@iZj6c47qpndp7j61bgxn3kZ:~# more /etc/shadowsocks-python/config.json


```json
{
    "server":"0.0.0.0",
    "server_port":10088,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"hunch@hongkong",
    "timeout":300,
    "method":"aes-256-ctr",
    "fast_open":false
}
```
[top](#Shadowsocks-Configuration)

## 客户端配置

    /usr/bin/python /home/hunch/.local/bin/sslocal -c /data/config/ss.json
```json
more /data/config/ss.json
{
        "server":"47.244.117.109",
        "server_port":10088,
        "local_address": "127.0.0.1",
        "local_port":1086,
        "password":"hunch@hongkong",
        "timeout":600,
        "method":"aes-256-ctr"
}

```

[top](#Shadowsocks-Configuration)

## polipo
    sudo vi /etc/polipo/config
```shell
logSyslog = true
logFile = /var/log/polipo/polipo.log
socksParentProxy = localhost:1086
proxyPort = 1081
proxyAddress = "0.0.0.0"
```
     sudo /etc/init.d/polipo restart
     
[top](#Shadowsocks-Configuration)


## ss开机自启

以下使用Systemd来实现shadowsocks开机自启。

    sudo vim /etc/systemd/system/shadowsocks.service
    

在里面填写如下内容：

```
[Unit]
Description=Shadowsocks Client Service
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/sslocal -c /home/xx/Software/ShadowsocksConfig/shadowsocks.json

[Install]
WantedBy=multi-user.target
```

    

把`/home/xx/Software/ShadowsocksConfig/shadowsocks.json`修改为你的`shadowsocks.json`路径，如：`/etc/shadowsocks.json`

配置生效：

```
systemctl enable /etc/systemd/system/shadowsocks.service
```
    

输入管理员密码就可以了。

[top](#Shadowsocks-Configuration)
