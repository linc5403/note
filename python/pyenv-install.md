# pyenv install
## 1. 依赖  


```
sudo apt-get install  make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev
```



## 2. pip  


linux

```
sudo apt-get install python-pip python-dev build-essential
```

mac:

```
sudo easy_install pip
```


## 3. pyenv  


```
sudo apt-get install curl git-core
curl -L https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
```


### 3.1 pyenv-virtualenv

    git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv


### 3.2 pyenv virtualenv 虚拟环境 python版本   


### 3.3 pyenv local 虚拟环境   

### 3.4 pyenv local --unset
解除绑定关系

## 4. virtualenv
**用于创建一个可以active的环境，方便部署和shell脚本使用**  
`virtualenv -p python3.7 python3.7.1`  
```
  -p PYTHON_EXE, --python=PYTHON_EXE
                        The Python interpreter to use, e.g.,
                        --python=python3.5 will use the python3.5 interpreter
                        to create the new environment.  The default is the
                        interpreter that virtualenv was installed with
                        (/usr/bin/python)
```

