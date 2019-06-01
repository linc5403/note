# Class View
- **HttpResponseRedirect**  
`HttpResponseRedirect(reverse('polls:results', args=(question.id,)))`  
*reverse()的运行思路：*  
*1). 根据第一个参数查找对应的url名字*  
*2). 把参数带进去，生成个url的字符串*  
rverse方法是django.urls提供，它需要我们给出我们想要跳转的视图的名字和该视图所对应的 URL 模式中需要给该视图提供的参数。
```python
    polls/urls.py
    # ex: /polls/5/results/
    path('<int:pk>/results/', views.ResultsView.as_view(), name='results'),
```
question.id = 3,本示例中返回
`'/polls/3/results/'`

## ListView和DetailView
```python
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from .models import Choice, Question


class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """Return the last five published questions."""
        return Question.objects.order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'


class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'
```
两个基类：ListView和DetailView
上面开到的所有类型和方法都是从基类中得来的  
这两个类都可以理解为从model中获取数据，组装context，调用template，返回render的结果。  

> 以ResultsView为例:  
>- 1. 从urls中解析出pk, 查询model
>- 2. 根据查询结果组装context={'question':question,}传递给模板pools/results.html进行渲染
>因为DetailView会缺省取model的__str__作为context的key，所以什么都不用做，直接就可以了。

> 以IndexView为例：  
因为在对应的模板中使用了'latest_question_list',所以通过context_object_name来进行标志，否则会使用缺省的'question_list'  
如果不定义get_queryset(self),那么会根据指定的model去查找所有结果并返回
