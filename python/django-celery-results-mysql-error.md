django-celery-results mysql error

### [Issues with mysql](https://github.com/celery/django-celery-results#issues-with-mysql)

If you want to run`django-celery-results`with MySQL, you might run into some issues.

One such issue is when you try to run`python manage.py migrate django_celery_results`, you might get the following error:

django.db.utils.OperationalError: (1071, 'Specified key was too long; max key length is 767 bytes')

To get around this issue, you can set:

**`DJANGO_CELERY_RESULTS_TASK_ID_MAX_LENGTH=191`**

in settings.py

(or any other value if any other db other than MySQL is causing similar issues.)

max_length of **191** seems to work for MySQL.
