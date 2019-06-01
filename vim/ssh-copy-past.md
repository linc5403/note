## vim ssh copy&past

### 1. vim build （xclip+clipboard）

### 2. x-server
#### 2.1 mac(XQuartz)
#### 2.2 windows(mobaxterm)

### 3. configuration
#### 3.1 ssh_config
ssh/config
```
Host         azure_baidu
    Port         22
    User hunch
    ForwardX11 yes
    ForwardX11Trusted yes
    TCPKeepAlive=yes
    ServerAliveInterval 10
    ServerAliveCountMax 5
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_Azure
```

#### 3.2 vim_config

