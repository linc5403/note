# systemd

## 1.  /etc/systemd/system/ssh_proxy.service

```
[Unit]
Description=proxy ssh daemon
After=network.target

[Service]
ExecStart=/home/hunch/shells/proxy_ssh.sh
Restart=on-failure
RestartSec=30s

[Install]
WantedBy=multi-user.target
```

## 2. systemd start

```
sudo systemctl daemon-reload
sudo systemctl enable ssh_proxy.service
sudo systemctl status ssh_proxy.service
sudo systemctl start ssh_proxy.service
```

## 3. shell
/home/hunch/shells/proxy_ssh.sh
```
#!/bin/bash
ssh -i /home/hunch/.ssh/hunch_hongkong.pem  -TCnND 1086 -o StrictHostKeyChecking=no root@47.244.117.109
```

## 4. polipo

/etc/polipo/config

```
# This file only needs to list configuration variables that deviate
# from the default values.  See /usr/share/doc/polipo/examples/config.sample
# and "polipo -v" for variables you can tweak and further information.

logSyslog = true
logFile = /var/log/polipo/polipo.log
socksParentProxy = localhost:1086
proxyPort = 8123
proxyAddress = "0.0.0.0"
```

