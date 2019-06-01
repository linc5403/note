# Django学习笔记-3
## 1. 什么是视图
**Django** 中的视图的概念是「一类具有相同功能和模板的网页的集合」。比如，在一个博客应用中，你可能会创建如下几个视图：  
>博客首页       ——展示最近的几项内容。   
内容“详情”页 ——详细展示某项内容。  
以年为单位的归档页——展示选中的年份里各个月份创建的内容。  
以月为单位的归档页——展示选中的月份里各天创建的内容。  
以天为单位的归档页——展示选中天里创建的所有内容。  
评论处理器——用于响应为一项内容添加评论的操作。 

而在我们的投票应用中，我们需要下列几个视图：  

>问题索引页——展示最近的几个投票问题。   
问题详情页——展示某个投票的问题和不带结果的选项列表。  
问题结果页——展示某个投票的结果。  
投票处理器——用于响应用户为某个问题的特定选项投票的操作。  

## 2. 编写更多的视图
1. 实现视图
`app_dir/views.py`
```python
def detail(request, question_id):
    return HttpResponse("You're looking at question %s." % question_id)

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)
```
2. 在urls.py中调用对应视图的处理
```python
from django.urls import path

from . import views

urlpatterns = [
    # ex: /polls/
    path('', views.index, name='index'),
    # ex: /polls/5/
    path('<int:question_id>/', views.detail, name='detail'),
    # ex: /polls/5/results/
    path('<int:question_id>/results/', views.results, name='results'),
    # ex: /polls/5/vote/
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
```
当某人请求你网站的某一页面时——比如说， "/polls/34/" ，Django 将会载入 mysite.urls 模块，因为这在配置项 ROOT_URLCONF 中设置了。然后 Django 寻找名为 urlpatterns 变量并且按序匹配正则表达式。在找到匹配项 'polls/'，它切掉了匹配的文本（"polls/"），将剩余文本——"34/"，发送至 'polls.urls' URLconf 做进一步处理。  
在这里剩余文本匹配了 '<int:question_id>/'，使得我们 Django 以如下形式调用 detail():
>`detail(request=<HttpRequest object>, question_id=34)`  

question_id=34 由 <int:question_id> 匹配生成。使用尖括号“捕获”这部分 URL，且以关键字参数的形式发送给视图函数。上述字符串的 :question_id> 部分定义了将被用于区分匹配模式的变量名，而 int: 则是一个转换器决定了应该以什么变量类型匹配这部分的 URL 路径。

>settings.py配置ROOT_URLCONF  
通常指向project_dir/urls.py
## 3. 编写真正有用的视图
### 3.1 使用模板(templates)---就是个html文件
调用render()或是HttpResponse()函数，将模板需要使用的参数传入
- render()  
`render(requst, 'polls/index.html', context)`  
接收三个参数：
>- 1. request，
>- 2. 模板名 
>- 3. 上下文context，这是一个字典,传递信息给template的脚本处理  

- HttpResponse  
接收template.render()返回的字符串
template.render()接受context和request作为参数
```python
    template = loader.get_template('polls/index.html')
    context = {
        'latest_question_list': latest_question_list,
    }
    return HttpResponse(template.render(context, request))
```
### 3.2 处理异常，抛出404
Django的视图处理最终返回一个应答，或者是HttpResponse，或者是Http404  
抛出异常的正确姿势:
> - get_object_or_404  
`question = get_object_or_404(Question, pk=question_id)`  
>- 注意了：pk=question_id其实是作为get()函数的入参传入的，get_object_or_404其实会调用Question.objects.get(pk=question_id)  
传入Django的model作为第一个参数，索引字段作为第二个参数，如果检索失败，抛出404    
`The get_object_or_404() function takes a Django model as its first argument and an arbitrary number of keyword arguments, which it passes to the get() function of the model's manager. It raises Http404 if the object doesn't exist. ` 
---
> - get_list_or_404  
使用方法同get_object_or_404，只是将model.get()变为了model.filter()函数

## 4. 为URL名称添加命名空间
大家（不同的app）都有相同url名字的视图该怎么办？
- 在app/urls.py中设置命名空间
`polls/urls.py`
```python
from django.urls import path

from . import views

app_name = 'polls'
urlpatterns = [
    path('', views.index, name='index'),
    path('<int:question_id>/', views.detail, name='detail'),
    path('<int:question_id>/results/', views.results, name='results'),
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
```
 - 对应需要引用该url的地方(通常是在html文件中)要增加命名空间
 `polls/templates/polls/index.html`
```html 
<li><a href="{% url 'detail' question.id %}">{{ question.question_text }}</a></li>
 ```
修改为指向具有命名空间的详细视图：

```html
<li><a href="{% url 'polls:detail' question.id %}">{{ question.question_text }}</a></li>
```

