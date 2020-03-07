## commands

### cut and rev
**获取最后一个分隔符的内容**  

```
echo 'maps.google.com' | rev | cut -d'.' -f 1 | rev
```

### parameter expantion
```sh
${parameter:-word} # 为空替换为word
${parameter:=word} # 为空替换，并将值赋给$parameter变量
bash-3.2$ unset a
bash-3.2$ echo ${a:-1234} # a为空，输出新的值，但不对a赋值
1234
bash-3.2$ echo $a

bash-3.2$ echo ${a:=1234} # a为空，输出新的值，同时对a赋值
1234
bash-3.2$ echo $a
1234
bash-3.2$ echo ${a:=abcd} # a不为空，输出a
1234
bash-3.2$ echo $a 
1234
bash-3.2$ echo ${a:-abcd} # a不为空，输出a
1234
```

```
${parameter:?word} # 为空报错, 主要用于排查错误
${parameter:+word} # 不为空替换
```

```sh
${#parameter}      # 获得字符串的长度
 
# 截取字符串，有了这四种用法就不必使用cut命令来截取字符串了。
# 在shell里面使用外部命令会降低shell的执行效率。特别是在循环的时候。
 
${parameter%word}  # 最小限度从后面截取word
${parameter%%word} # 最大限度从后面截取word
${parameter#word}  # 最小限度从前面截取word
${parameter##word} # 最大限度从前面截取word
bash-3.2$ a=abc.txt
bash-3.2$ echo ${a%.txt}
abc
bash-3.2$ echo ${a#abc}
.txt
```
