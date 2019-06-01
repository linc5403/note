# python 代码笔记

## function name

```
import sys
sys._getframe().f_code.co_name
```

## timezone
```
clock = datetime.datetime.now(pytz.timezone('Asia/Shanghai')).strftime(fmt)
```

