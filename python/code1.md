# code memorize

## 读取json文件

```python
with open("read_json.json", 'r') as f:
    temp = json.loads(f.read())
```

## django 重连数据库
```python
from django.db import connection
connection.connect()
```

