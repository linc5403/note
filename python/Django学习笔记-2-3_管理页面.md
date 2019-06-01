# Django学习笔记-2-3管理页面
好像没有什么好说的  
就是在需要admin页面呈现的app对应的**admin.py**中增加需要管理的表单  
使用admin.site.register()方法—先要将对应的ModelClass导入
```
from django.contrib import admin
from .models import Question


admin.site.register(Question)
```
