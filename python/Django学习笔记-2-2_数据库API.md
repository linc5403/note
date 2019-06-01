# Django学习笔记-2-2 数据库API
## 数据库操作的API
### \_\_str__
用来描述对象，实际没什么用的吧...
Django 自动生成的 admin 里也使用这个方法来表示对象。

```
from django.db import models

class Question(models.Model):
    # ...
    def __str__(self):
        return self.question_text

class Choice(models.Model):
    # ...
    def __str__(self):
        return self.choice_text
```

>实际效果：
```python
>>> Question.objects.all()
<QuerySet [<Question: Question object (1)>]>

>>> Question.objects.all()
<QuerySet [<Question: What's up?>]>
```

### 最重要的一个1对多的ForeignKey
```
class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
```

每个choice都可以选择一个question，那么对于一个question就存在多个choice。因此，一个question会存在一个choice_set的东西，反向可以查找选择该question的choice。

建立数据库时，是先创建choice，再在其中建立和对应question的链接关系。
也可以反过来，使用question的choice_set来创建choice：

> Create three choices.
```python 
>>> q.choice_set.create(choice_text='Not much', votes=0)
<Choice: Not much>
>>> q.choice_set.create(choice_text='The sky', votes=0)
<Choice: The sky>
>>> c = q.choice_set.create(choice_text='Just hacking again', votes=0)
```


