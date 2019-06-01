# Django学习笔记-2-1 数据库
## 一. 数据库配置
### 1. 修改pro_dir/setting.py中数据库的配置，连接上数据库
::注意修改TIME_ZONE = 'Asia/Shanghai'::

### 2. 初始化Django需要的数据库表
`$ python manage.py migrate`  
这条命令会查询 pro_dir/setting.py中的INSTALLED_APPS设置，并在数据库中创建对应的表。

## 二. 创建模型
### 在对应app/model.py中创建模型：

```
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
```

## 三. 激活模型
### 0. 每个应用都有自己的AppConfig（配置信息），存放在apps.py文件中

例如polls对应的AppConfig会由Django自动生成在pools/apps.py中：
```
from django.apps import AppConfig


class PollsConfig(AppConfig):
    name = 'polls'
```

其对应的点式路径为: 'polls.apps.PollsConfig'
需要在项目的settings.py中添加该AppConfig。

### 1. 项目/settings.py中添加应用的AppConfig的点式路径
目的是为了能够让Django能够安装对应的应用
`project_dir/settings.py`
```
INSTALLED_APPS = [
    'polls.apps.PollsConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]
```

### 2. makemigrations让Django检查对model文件的修改
通过运行 makemigrations 命令，Django 会检测你对模型文件的修改，并且把修改的部分储存为一次迁移。  
`$ python manage.py makemigrations polls`

### 3. migrate应用数据库迁移
`$ python manage.py migrate`

## 数据库使用总结
### 1. 修改app对应的models.py文件，改变模型
### 2. 在project_dir/settings.py中增加对应AppConfig的点式路径
（app目录下apps.py中会由Django自动生成，对应的点式路径就是：app.apps.AppNameConfig）
### 3. python manage.py makemigrations appName
让Django检查对应appConfig的修改，生成数据库迁移的代码（规则）
### 4. python manage.py migrate
应用数据库迁移

## 如何快速同步线上的数据库结构
### 1. 删除app下migrations目录下的文件
### 2. make migrations app  
### 3. migrate app --fake-initial

`DJANGO_SETTINGS_MODULE="aivideo.settings_local" python manage.py migrate asset --fake-initial`
