# Shell

<!-- vim-markdown-toc GFM -->

* [Important commands](#important-commands)
* [shell cmd](#shell-cmd)
    * [文件类型](#文件类型)
    * [find](#find)
    * [xargs](#xargs)
    * [echo](#echo)
    * [read](#read)
    * [cat](#cat)
    * [tee](#tee)
    * [标准输入，标准输出和错误输出](#标准输入标准输出和错误输出)
    * [grep](#grep)
    * [awk](#awk)
    * [sed](#sed)
    * [合并与分割](#合并与分割)
        * [sort](#sort)
* [shell变量和参数](#shell变量和参数)
    * [变量设置时的不同模式](#变量设置时的不同模式)
    * [参数的引用](#参数的引用)
    * [各种引号](#各种引号)
* [条件测试](#条件测试)
    * [文件状态测试](#文件状态测试)
    * [组合](#组合)
    * [字符串测试](#字符串测试)
    * [数值测试](#数值测试)
    * [expr](#expr)
* [控制流结构](#控制流结构)
    * [if then else](#if-then-else)
    * [case](#case)
    * [for](#for)
    * [until](#until)

<!-- vim-markdown-toc -->

## Important commands

| command | meaning |
| - | - |   
| type -a | 查看命令在系统中的可用情况|  

## shell cmd

### 文件类型

```
b - 块设备文件。
d - 目录。
c - 字符设备文件。
p - 管道文件。
l - 符号链接文件。
f - 普通文件。
```

### find

* -exec 'command' {} \\;  
> `find -name "*.md" -exec more {} \;`  
> 注意 {}与 \\; 之间的空格

* -mtime(modify)        -ctime(create)          -atime(access)  
> 参数+表示在此内，\-表示在此之外  
> 
> | `-mtime +3` | 3天内 |    
> | :-: | :-: |   
> | `-mtime -1` | 1天前 |    

* -newer

> 比哪个文件新
> 
> 用!来表示逻辑非
> 
> `find ./ ! -newer html学习.md`  查找比这个文件旧的文件

* -depth  
先查找当前目录，再查找子目录  

* -mount  
只查找当前文件系统，不进去其他文件系统  

* -ok  
用法同\-exec，但是会提示是否执行该命令  

* -type  
选项见上面，常用的是\-f:普通文件 \-d:目录

* -max-depth  
**应该放在其他选项之前**  
1: 只搜索当前目录  

[top](#Shell)

### xargs

`ls  -tr1  |  tail  -5  |  xargs  -i  cp  '{}'  dest/folder/`  
`...  xargs  -n1  -i  cp  '{}' dest/folder`  
`sudo salt 'minion' cmd.run "sudo docker exec -it  zhiying-worker-main bash -c 'pip install --upgrade youtube-dl'"`

* `find ./ -print0 |xargs -0 file`  
文件名中包含空格的情况下使用

* xargs cp  
`find ./ -name "*.mp4" | xargs -i cp '{}' /data`  

### echo  
```
\c 不换行。
\f 进纸。
\t 跳格。
\n 换行。
```

* \-e  
> 转义  
> ```
> echo -e "\"abc\" `tty`"
> "abc" /dev/pts/11
> ```

### read  
- **标准输入赋值到变量**  

> ```
> hunch@linchuan-test3:~/test/shell$ read name
> sdfjlkavsj bn pihef awoenkjn fsdad
> hunch@linchuan-test3:~/test/shell$ echo $name
> sdfjlkavsj bn pihef awoenkjn fsdad
> ```


- **输入到数量多余变量数量，最后一个变量会收集剩余所有到值**  

> ```
> hunch@linchuan-test3:~/test/shell$ read name1 name2 nameall
> aa bb cc dd ee ff gg hh
> hunch@linchuan-test3:~/test/shell$ echo $name1
> aa
> hunch@linchuan-test3:~/test/shell$ echo $name2
> bb
> hunch@linchuan-test3:~/test/shell$ echo $nameall
> cc dd ee ff gg hh
> ```

- **为变量赋缺省值**  
```sh
read a
case ${a:=1} in
    1|2) echo "you choose ${a}"
        ;;
    *) echo "must in [ 1 | 2 ]"
        ;;
esac
```


[top](#Shell)

### cat

* \-v  
显示控制字符  
* 编辑文件 ctrl-D结束
> 
> ```
> hunch@linchuan-test3:~/test/shell$ cat > myfile
> asdf
> 1234
> hunch@linchuan-test3:~/test/shell$ more myfile
> asdf
> 1234
> ```

### tee  
输出到标准输出，同时同步一份输出到文件  
```
hunch@linchuan-test3:~/test/shell$ ls | tee out.file
121.txt
122.txt
123.txt
12.a.txt
12a.txt
myfile
hunch@linchuan-test3:~/test/shell$ ls
121.txt  122.txt  123.txt  12.a.txt  12a.txt  myfile  out.file
hunch@linchuan-test3:~/test/shell$ more out.file
121.txt
122.txt
123.txt
12.a.txt
12a.txt
myfile
```

* vim 编辑root文件  
`:w !sudo tee %`

### 标准输入，标准输出和错误输出

| command filename 2>&1 | 标准输出和错误输出重定向到一个文件 |  
| :-: | :-:  |  
| command 2 > filename |  错误输出重定向到一个文件 |  

[top](#Shell)

### grep

* 通配符 \*  
**表示任意多个之前的字符**  
**查找vim\*vim**    
> ```
> grep "vim.*vim" find_out
> -rw-r--r--  1 linchuan  staff  9929 May 25 20:35 .//vim/vim.md
> -rw-r--r--  1 linchuan  staff  655 May 25 20:35 .//vim/vim-build-from-source-mac.md
> -rw-r--r--  1 linchuan  staff  2811 Oct 30  2018 .//vim/vim2.md
> -rw-r--r--  1 linchuan  staff  5373 May 25 20:35 .//vim/vim-build-from-source-debian.md
> -rw-r--r--  1 linchuan  staff  3838 May 25 20:35 .//vim/zsh-vim-mode.md
> ```

* 通配符 .  
**表示任意1个字符**

* \^ 匹配行首  
```
grep "^vim" filename
vim.md
vim-build-from-source-mac.md
vim2.md
vim-build-from-source-debian.md
```

* \$ 匹配行尾  
```
grep "sample$" filename
commit-msg.sample
pre-rebase.sample
pre-commit.sample
applypatch-msg.sample
fsmonitor-watchman.sample
```

* \\{1, 3\\} 匹配出现次数  
**\\{1, \\} 一次以上**  
**\\{1\\} 刚好一次**  
```
note  grep "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ~/.ssh/config
HOST 121.196.213.142
Host 192.168.1.66
Host 40.125.172.62
Host 139.219.10.159
```

[top](#Shell)

### awk  

* BEGIN END

`awk 'BEGIN {print "FILENAME\n--------------------"} {print $NF} END {print "end of report"}' find_out`

* FILENAME  
**当前文件名**

* NR
**number of record, 行号**

* NF
**number of field, 域号**  
'{print $NF}' 用来打印最后一列

* -F
**定义分割符号**  
`  master  ~/iCloud/note  awk '{print $NF}' find_out | awk -F/ '{print $NF}' | grep "md$"`

* 匹配  
**~/re/**
> ```
> awk '{if ($NF~/md$/) print $0}' find_out
> awk '{if ($0 ~/\.md$/) print $0}' find_out
> awk '{if ($6 !~/May/) print $0}' find_out
> awk '{if ($6 ~/May/) print $0}' find_out
> ```
> **注意!与~之间没有空格**  

### sed  
好像没什么好说的，vi中自带的就是sed操作  

### 合并与分割   

#### sort  

> * sort -u  
> **删除所有重复行**  
> 
> * sort -k 3  
> * sort -kr 3  
> * sort -nr +4  
> * sort -M 4  

[top](#Shell)

## shell变量和参数

### 变量设置时的不同模式  
***注意：:=不能单独使用，需要在其他语句中使用，如echo，if等***  
| 语法 | 含义 |
| - | - |
| Variable-name=value | 设置实际值到variable-name |
| Variable-name+value | 如果设置了variable-name，则重设其值 |
| Variable-name:?value | 如果未设置variable-name，显示未定义用户错误信息 |
| Variable-name?value | 如果未设置variable-name，显示系统错误信息 |
| Variable-name:=value | 如果未设置variable-name，设置其值 |
| Variable-name:-value | 同上，但是取值并不设置到variable-name，可以被替换 |

### 参数的引用  
| 参数 | 含义 |
| :- | :- |
| $# | 参数个数|
| $0 | 脚本名称 |
| $1 | 第一个参数 |
| $? | 最后一条命令的退出状态, 0 表示正常，其他是异常 |

### 各种引号  

- **双引号**  
> 除 $, `, \\外的其他符号  
- **单引号**  
> 屏蔽所有的符号  
- **反引号**  
> 反引号用于设置系统命令的输出到变量    
- **反斜线**  
> 如果下一个字符有特殊含义，反斜线防止shell误解其含义   

[top](#Shell)

## 条件测试  
### 文件状态测试  
> | symbol | mean |
> | - | - |
> | -f | 普通文件 |
> | -d | 目录 |
> | -r | 可读 |
> | -x | 可执行 |
> | -s | 文件长度大于0 |

### 组合  
> - **-a逻辑与**  
> - **-o逻辑或**  

`[ -f abc.sh -a -x abc.sh ]`  
abc.sh存在且可执行, **注意括号两端的空格**  

### 字符串测试  
> ```
> [ string operator string ]
> [ operator string ]
> ```
> 
> | operator | mean |
> | - | - |
> | = | 两个字符串相等。   |
> | != | 两个字符串不等。   |
> | -z | 空串。   |
> | -n | 非空串。   |

### 数值测试  
> `[ "number" numeric_operator "number" ]`  
>
> | operator | mean |
> | - | - |
> | -eq | 数值相等。 |
> | -ne | 数值不相等。 |
> | -gt | 第一个数大于第二个数。 |
> | -lt | 第一个数小于第二个数。 |
> | -le | 第一个数小于等于第二个数。 |
> | -ge | 第一个数大于等于第二个数。 |

### expr  
用于数值计算  
` expr argument operator argument `
```
(python3.7)  ~/bin  expr 3 + 4
7
```
[top](#Shell)

## 控制流结构  
### if then else

```sh
if [ $# -lt "1" ]; then
    echo "need at lest one param"
else
    echo "the params are $@"
fi
```

### case  
```sh
if ! [ $# -eq "1" ]; then
    echo "need just 1 param"
else
    case $1 in
        1) echo "you input 1"
            ;;
        2) echo "you input 2"
            ;;
        *) echo "must input 1 or 2" >&2
            exit 1
            ;;
    esac
fi
```

### for  
```sh
for filex in ./*; do
    echo $filex
done
```

### until  
```sh
read a
until [ $a -eq 100 ]; do
    read a
done
```

