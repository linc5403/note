# join()
**描述**  
Python join() 方法用于将序列中的元素以指定的字符连接生成一个新的字符串。  
**语法**  
str.join(sequence)  
**参数**  
*sequence* -- 要连接的元素序列。  
**返回值**  
返回通过指定字符连接序列中元素后生成的新字符串。  
**实例**  
以下实例展示了join()的使用方法：
```python str = "-";
seq = ("a", "b", "c"); # 字符串序列
print str.join( seq );
```
以上实例输出结果如下：
`a-b-c`

# pyenv&pyenv-virtualenv
## 0. 安装
```
$ brew install pyenv #brew安装pyenv
修改.bash_profile
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

$ brew install pyenv-virtualenv
修改.bash_profile
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
```
## 1. pyenv
用来安装python以及创建虚拟环境  
`pyenv install -l`  
`pyenv install 2.7.15`  
`pyenv install 3.6.5`  
通过pyenv安装的版本都会放到`/usr/local/var/pyenv/versions/`目录下。 
## 2. pyenv-virtualenv
用来创建干净的虚拟环境
`pyenv virtualenv 3.6.5 Django-loacl`//取的名字最好与项目相关  
进入工作目录，然后指定对应的pyenv local
```
linchuandeMacBook-Pro:django-test linchuan$ pyenv versions
* system (set by /Users/linchuan/.pyenv/version)
  2.7.15
  3.6.5
  3.6.5/envs/Django_local
  Django_local
linchuandeMacBook-Pro:django-test linchuan$ pyenv local Django_local
(Django_local) linchuandeMacBook-Pro:django-test linchuan$ cd ..
linchuandeMacBook-Pro:python_code linchuan$ cd django-test/
(Django_local) linchuandeMacBook-Pro:django-test linchuan$
```
## 大功告成
# python shell自动补齐
''pip completion --bash >> ~/.bash_profile'
# python 运行shell
DJANGO_SETTINGS_MODULE="aivideo.settings_local" python manage.py shell

# zsh
## om-my-zsh
### 安装
```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```
### 配置
#### 1. alias
'alias mysql_local_test="mysql -u root -p -h localhost -D test_db"'
=左右不能有空格

# jobs
zsh下的jobs有看不到的，这个时候可以使用

jobs    # list all jobs
jobs -r # list running jobs
jobs -s # list suspended jobs
jobs -l to list PIDs and use kill command as usual.

kill %jobs-number
kill -KILL %1
