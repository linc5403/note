# CELERY


## 定时任务

DJANGO_SETTINGS_MODULE="aivideo.settings_test" celery -A timer worker -B -l=info --concurrency=10
