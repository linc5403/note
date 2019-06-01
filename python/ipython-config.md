# iPython 配置
<!-- toc -->

- [配置文件位置](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E4%BD%8D%E7%BD%AE)
- [autoreload](#autoreload)
  * [Step 1: Make sure you have the latest ipython version installed](#Step-1-Make-sure-you-have-the-latest-ipython-version-installed)
  * [Step 2: find out where your config file is](#Step-2-find-out-where-your-config-file-is)
  * [Step 3: Open the config file with an editor based on the location of your config file. I use atom. For example:](#Step-3-Open-the-config-file-with-an-editor-based-on-the-location-of-your-config-file-I-use-atom-For-example)
  * [Step 4: Look for the following lines in the config file:](#Step-4-Look-for-the-following-lines-in-the-config-file)
- [vi mode](#vi-mode)

<!-- tocstop -->

## 配置文件位置
~/.ipython/profile_default/ipython_config.py
## autoreload

All the links you have above use commands within ipython. You should try editing your config file. Open up your terminal and complete the following steps.

### Step 1: Make sure you have the latest ipython version installed

$ ipython --version

### Step 2: find out where your config file is

```
ipython profile create
```

### Step 3: Open the config file with an editor based on the location of your config file. I use atom. For example:

```
vi ~/.ipython/profile_default/ipython_config.py
```

### Step 4: Look for the following lines in the config file:



>```
>c.InteractiveShellApp.extensions = ['autoreload']
>c.InteractiveShellApp.exec_lines = ['%autoreload 2']
>```


## vi mode
>```
>c.TerminalInteractiveShell.editing_mode = 'vi'
>```
