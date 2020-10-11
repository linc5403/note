# ssh HostKeyChecking
Use the StrictHostKeyChecking option, for example:

    ssh -oStrictHostKeyChecking=no $h uptime
    

This option can also be added to ~/.ssh/config, e.g.:

    Host somehost
        Hostname 10.0.0.1
        StrictHostKeyChecking no

# 将客户端的ssh-public-key添加到服务器

`ssh-copy-id username@remote_host`

