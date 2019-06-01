# 启动
## 1. 创建项目
`$ django-admin startproject` *project-name*
## 2. 启动 web server
`$ python manage.py runserver` *0:8000*
## 3. 创建应用 (**app**)
`$ python manage.py startapp` *app-name*
## 4. 编写第一个视图 (view)
### 4.1 views处理函数
`app-dir/views.py`
```python
from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")
```
### 4.2 新增app的路由
`app-dir/urls.py`
```python
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
]
```
**path()的4个参数：route, view, kwargs, name:  
name为你的 URL 取名能使你在 Django 的任意地方唯一地引用它，尤其是在模板中。这个有用的特性允许你只改一个文件就能全局地修改某个 URL 模式。**

### 4.3 让rootURLconf路由过来
`pro-dir/urls.py`
```python
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('polls/', include('polls.urls')),
    path('admin/', admin.site.urls),
]
```
**include()** 引用其他的URLconfs

