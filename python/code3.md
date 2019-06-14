# python

## 输出函数名
```python
print('{} running'.format(sys._getframe().f_code.co_name))
```
 
 ## 生产随机字符串
 
```python
 salt = ''.join(random.sample(string.ascii_letters + string.digits, 8))
 ```
 
```python
 seed = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+=-"
sa = []
for i in range(8):
    sa.append(random.choice(seed))
salt = ''.join(sa)
print salt
 ```
 
 
## 起手式
`#!/usr/bin/env python`


## timeprocess date

```
'2019-01-31T07:12:03Z'

el=datetime.strptime(finish[0], '%Y-%m-%dT%H:%M:%SZ') - datetime.strptime(start[0], '%Y-%m-%dT%H:%M:%SZ')
```

```
def _es_time_format(es_time):
    # 2019-01-12T00:52:05+00:00
    a = es_time.replace('T', '+')
    a_split = a.split('+')
    return a_split[0] + ' ' + a_split[1]
```

```
# 年月日 时间 主播 标题
fmt = "%Y%m%d %H:%M"
clock = datetime.datetime.now(pytz.timezone('Asia/Shanghai')).strftime(fmt)
```

```
Directive	Meaning	Notes  
%a	Locale’s abbreviated weekday name.	 
%A	Locale’s full weekday name.	 
%b	Locale’s abbreviated month name.	 
%B	Locale’s full month name.	 
%c	Locale’s appropriate date and time representation.	 
%d	Day of the month as a decimal number [01,31].	 
%H	Hour (24-hour clock) as a decimal number [00,23].	 
%I	Hour (12-hour clock) as a decimal number [01,12].	 
%j	Day of the year as a decimal number [001,366].	 
%m	Month as a decimal number [01,12].	 
%M	Minute as a decimal number [00,59].	 
%p	Locale’s equivalent of either AM or PM.	(1)
%S	Second as a decimal number [00,61].	(2)
%U	Week number of the year (Sunday as the first day of the week) as a decimal number [00,53]. All days in a new year preceding the first Sunday are considered to be in week 0.	(3)
%w	Weekday as a decimal number [0(Sunday),6].	 
%W	Week number of the year (Monday as the first day of the week) as a decimal number [00,53]. All days in a new year preceding the first Monday are considered to be in week 0.	(3)
%x	Locale’s appropriate date representation.	 
%X	Locale’s appropriate time representation.	 
%y	Year without century as a decimal number [00,99].	 
%Y	Year with century as a decimal number.	 
%Z	Time zone name (no characters if no time zone exists).	 
%%	A literal '%' character.
```
