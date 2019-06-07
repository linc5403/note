# format
<!-- toc -->

- [帮助](#%E5%B8%AE%E5%8A%A9)
- [使用方法](#%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95)
  * [str.format 一般形式](#strformat-%E4%B8%80%E8%88%AC%E5%BD%A2%E5%BC%8F)
- [示例](#%E7%A4%BA%E4%BE%8B)

<!-- tocstop -->
## [帮助](http://www.codebelief.com/article/2017/03/python-elegant-programming-str-format/)

## 使用方法

### str.format 一般形式  
格式化字符串的一般形式如下：  

**{field_name!conversion:format_spec}**

```
从上面的代码可以看到，格式化字符串可分为 field_name、conversion、format_spec 三部分，分别对应替换字段名称（索引）、转换标志、格式描述。其中，字段名称是必选的，而后两者是可选的。转换标志紧跟在英文感叹号后面，而格式描述紧跟在英文冒号后面。

前面已经提到过，字段名称既可是位置索引，也可是关键字索引。字段名称后面可以通过点来访问属性，或通过方括号来访问元素。

在这里，我们重点看一下格式描述（format_spec）这一项。

格式描述中含有6个选项，分别是 fill、align、sign、width、precision、type。
它们的位置关系如下：

[[fill]align][sign][#][0][width][,][.precision][type]
fill
可以是任意字符，默认为空格。

align
仅当指定最小宽度时有效。

< 左对齐（默认选项）
> 右对齐
= 仅对数字有效；将填充字符放到符号与数字间，例如 +0001234
^ 居中对齐
sign
仅对数字有效

+ 所有数字均带有符号
- 仅负数带有符号（默认选项）
即空格；正数前面带空格，负数前面带符号
'#'
只对整数有效

自动在二进制、八进制、十六进制数值前添加对应的 0b、0o、 0x。

','
自动在每三个数字之间添加 , 分隔符。

width
十进制数字，定义最小宽度。如果未指定，则由内容的宽度来决定。

如果没有指定对齐方式（align），那么可以在 width 前面添加一个0来实现自动填充0，等价于 fill 设为 0 并且 align 设为 =。

precision
用于确定浮点数的精度，或字符串的最大长度。不可用于整型数值。

type
确定参数类型，默认为 s ，即字符串。

整数输出类型：

b：以二进制格式输出
c：将整数转换成对应的 unicode 字符
d：以十进制输出（默认选项）
o：以八进制输出
x：以十六进制小写输出
X：以十六进制大写输出
n：与 d 相同，但使用当前环境的分隔符来分隔每3位数字
十进制浮点数输出类型：

e：指数标记；使用科学计数法输出，用e来表示指数部分，默认 precision 为6
E：与 e 相同，但使用大写 E 来表示指数部分
f：以定点形式输出数值，默认 precision 为6
F：与 f 相同
g：通用格式；对于给定的 precision p >= 1，取数值的p位有效数字，并以定点或科学计数法输出（默认选项）
G：通用格式；与 g 相同，当数值过大时使用 E 来表示指数部分
n：与 g 相同，但使用当前环境的分隔符来分隔每3位数字
%：百分比标记；使用百分比的形式输出数值，同时设定 f 标记
```

## 示例  
```
['this is a format example for {_id:05d}'.format(_id=_id) for _id in range(100)]
```
