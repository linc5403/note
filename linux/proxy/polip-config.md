# ssh -qTCnfND 7070 hongkong


- polipo
- nohup sudo polipo -c /etc/polipo/config &

```shell
hunch@hunch-Z370-HD3:~$ more /etc/polipo/config
# This file only needs to list configuration variables that deviate
# from the default values.  See /usr/share/doc/polipo/examples/config.sample
# and "polipo -v" for variables you can tweak and further information.

logSyslog = true
logFile = /var/log/polipo/polipo.log
socksParentProxy = localhost:7070
```
