# 格式化输出
`print("I'm %s. I'm %d year old" % ('Vamei', 99))`  
`print("I'm %(name)s. I'm %(age)d year old" % {'name':'Vamei', 'age':99})`
# log
```python
import logging
logger = logging.getLoger(__name__)
logger.info("for your log")
```
# time
```
import datetime
now = datetime.datetime.now()
print (now.striftime(%Y-%m-%d %H:%M:%S))
```
## 日期
```
>>> day1=datetime.date(2014,7,2)
>>> day2=datetime.date(2014,7,11)
>>> print(day2-day1)
9 days, 0:00:00
>>> print((day2-day1).days)
9
```
## 打印日历
Python calendar.month(theyear, themonth, w=0, l=0):

The function returns a month’s calendar in a multi-line string using the formatmonth() of the TextCalendar class.

'l' specifies the number of lines that each week will use.

```
>>> print(calendar.month(2018, 6))
     June 2018
Mo Tu We Th Fr Sa Su
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30
```



# sys
import sys
sys.verison()
sys.version_info()

# turple
```
>>> exam_st_date = (11, 12, 2014)
>>> print("%i/%i/%i" % exam_st_date)
11/12/2014
```

# repr  
将一个obj转换为str

# 格式化字符串
```
a = int(input("Input an integer : "))
n1 = int( "%s" % a )
n2 = int( "%s%s" % (a,a) )
n3 = int( "%s%s%s" % (a,a,a) )
print (n1+n2+n3)
```

# 帮助文件
`abs.__doc__`

# 打印多行文本
```
print("""
a string that you "don't" have to escape
This
is a  ....... multi-line
heredoc string --------> example
""")
```

# 运算符优先级
   
 优先级  | 	运算符 |	描述   
 -  |  -  |  -    
1	| lambda				| Lambda表达式  
2	| or					| 布尔“或”  
3	| and					| 布尔“与”  
4	| not x					| 布尔“非”
5	| in，not in			| 成员测试  
6	| is，is not			| 同一性测试  
7	| <，<=，>，>=，!=，==	| 比较  
8	| \|						| 按位或
9	| ^						| 按位异或
10	| &						| 按位与
11	| <<，>>				| 		移位
12	| +，-					| 	加法与减法
13	| *，/，%				| 		乘法、除法与取余
14	| +x，-x				| 		正负号
15	| ~x					| 	按位翻转
16	| **					| 	指数
17	| x.attribute			| 			属性参考
18	| x[index]				| 		下标
19	| x[index:index]		| 				寻址段
20	| f(arguments...)		| 				函数调用
21	| (experession,...)		| 				绑定或元组显示
22	| [expression,...]		| 				列表显示
23	| {key:datum,...}		| 				字典显示
24	| 'expression,...'		| 				字符串转换


# 使用内存文件  

```
def convert_webp_to_jpeg(content):
    raw_im = Image.open(cStringIO.StringIO(content))
    a = cStringIO.StringIO()
    raw_im.save(a, 'jpeg')
    content = a.getvalue()
    return content
```
# 系统选择python版本

## 安装  
```
$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1

update-alternatives: 使用 /usr/bin/python2.7 来在自动模式中提供 /usr/bin/python (python) 

$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2

update-alternatives: 使用 /usr/bin/python3.5 来在自动模式中提供 /usr/bin/python (python)

```  
## 卸载  

```
$ sudo update-alternatives --remove python /usr/bin/python2.7 

$ update-alternatives --list python

/usr/bin/python3.5
```
## 配置  

```
$ update-alternatives --config python

有 2 个候选项可用于替换 python (提供 /usr/bin/python)。

  选择       路径              优先级  状态
------------------------------------------------------------
* 0            /usr/bin/python3.5   2         自动模式
  1            /usr/bin/python2.7   1         手动模式
  2            /usr/bin/python3.5   2         手动模式

要维持当前值[*]请按<回车键>，或者键入选择的编号：1
```


## 判断图片是否带透明通道

```
img = Image.open(filename) 
if img.mode == "RGBA" or "transparency" in img.info: 
    # image uses transparency 
```
