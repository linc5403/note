## install error 

```
sudo apt install default-libmysqlclient-dev

apt-get install default-libmysqlclient-dev gcc python3-dev

pip install mysqlclient

## sudo apt install default-libmysqlclient-dev  
```

```
Collecting MySQL-python==1.2.5 (from -r ./deploy/web_server/base_requirements.txt (line 26))
  Downloading https://files.pythonhosted.org/packages/a5/e9/51b544da85a36a68debe7a7091f068d802fc515a3a202652828c73453cad/MySQL-python-1.2.5.zip (108kB)
    100% |████████████████████████████████| 112kB 33.4MB/s
    Complete output from command python setup.py egg_info:
    sh: 1: mysql_config: not found
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
      File "/tmp/pip-install-btYk6h/MySQL-python/setup.py", line 17, in <module>
        metadata, options = get_config()
      File "setup_posix.py", line 43, in get_config
        libs = mysql_config("libs_r")
      File "setup_posix.py", line 25, in mysql_config
        raise EnvironmentError("%s not found" % (mysql_config.path,))
    EnvironmentError: mysql_config not found

    ----------------------------------------
Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-install-btYk6h/MySQL-python/
```
