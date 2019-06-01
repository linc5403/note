# django

<!-- vim-markdown-toc GFM -->

* [admin-password](#admin-password)
* [时区](#时区)
* [random](#random)
* [request](#request)

<!-- vim-markdown-toc -->


## admin-password

python manage.py createsuperuser
    
    
## 时区  
    settings.py
```
TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True
```

## random
```
def get_random():
    return Category.objects.order_by("?").first()
```

## request
```
    if request.method == 'POST':
        post = request.POST
        params = request.GET
```

