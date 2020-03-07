# Shell

<!-- vim-markdown-toc GFM -->

* [Important commands](#important-commands)
* [shell cmd](#shell-cmd)
    * [文件类型](#文件类型)
    * [通配符，批量创建](#通配符批量创建)
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
        * [替换行首和行尾空格](#替换行首和行尾空格)
    * [合并与分割](#合并与分割)
        * [sort](#sort)
* [shell变量和参数](#shell变量和参数)
    * [变量设置时的不同模式](#变量设置时的不同模式)
    * [参数的引用](#参数的引用)
    * [各种引号](#各种引号)
* [条件测试](#条件测试)
    * [文件状态测试](#文件状态测试)
    * [组合(仅用于文件状态测试)](#组合仅用于文件状态测试)
    * [字符串测试](#字符串测试)
    * [数值测试](#数值测试)
    * [expr](#expr)
    * [<< HERE](#-here)
        * [read from var](#read-from-var)
        * [read from file](#read-from-file)
        * [read from command output](#read-from-command-output)
        * [read from stand input](#read-from-stand-input)
        * [write file with multi-line](#write-file-with-multi-line)
    * [command substitution](#command-substitution)
* [控制流结构](#控制流结构)
    * [if then else](#if-then-else)
    * [case](#case)
    * [for](#for)
    * [until](#until)
    * [while](#while)
    * [break](#break)
    * [continue](#continue)
* [shell函数](#shell函数)
    * [load shell文件](#load-shell文件)
    * [getopts](#getopts)

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

### 通配符，批量创建
```sh
touch {0..10}.txt
touch {a..z}.txt
touch {0,1,2}.txt
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

- **read -p**
> 给出提示符，不显示换行  
> ```sh
> read -p "input your name: " a
> echo $a
> ```
> ```
>  ✘ (python3.7)  ~/bin  t.sh
> input your name: abc
> abc
> ```

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

- **读取文本内容**  
***-r表示不转义解释，用raw的内容***  
a="abc.txt"  
```sh
while read -r line; do echo $line; done < $a
```
- **读取命令结果**  
```sh
while read -r line; do echo $line; done <<<$(ps aux | grep hunch)
while read -r line; do echo $line; done < <(ps aux | grep hunch)
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

#### 替换行首和行尾空格
- **行首**
`sed 's/^[ \t]*//g' `
- **行尾**
`sed 's/[ \t]*$//g' `

- **vim替换tab**
`%retab`

- **vim删除行尾空格和tab**
`:%s/\s\+$//g`

- **只删除行尾空格，不删除tab**
`:%s/ *$//g`

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

### 组合(仅用于文件状态测试)  
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

### << HERE
表示一段输入  
> ```sh
> $ while read -r line; do echo $line; done << eof
> asdf
> zxcv
> ujmasdf
> asdf
> eof
> asdf
> zxcv
> ujmasdf
> asdf
> ```  

#### read from var  
a="abc
def
ghi"

cat <<< $a

#### read from file  
a="abc.txt"  
cat < $a  

#### read from command output
cat < <(command)  
cat <<< $(command)  

#### read from stand input  
```sh
$ grep "^a" <&0
xxx
abc
abc
jjj
```

#### write file with multi-line
```sh
cat > abc.txt <<eof
abc
$a
end
eof
```

### command substitution
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

- 变异  
```sh
[ -f abc.txt ] && a="True" || a="False"
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

### while
- **读入文件**  
> ```sh
> # 从第一个参数的文件读入每一行
> while read line; do
>     echo $line
> done < $1
> ```

### break  
> ```sh
> # break的使用
> while :; do
>     echo "input number in [1..5]"
>     read input
>     case $input in
>         1|2|3|4|5) echo "you are right"
>             ;;
>         *) echo "you are wrong"
>             break
>             ;;
>     esac
> done
> ```

### continue
> ```sh
> # continue的使用
> echo "input number in [1..5]"
> while :; do
>     read input
>     if [ $input -le 5 -a $input -ge 1 ]; then
>         echo "you are right"
>         continue
>     fi
>     exit 0
> done
> ```

## shell函数  
```sh  
function findit() {
    if [ $# -lt 1 ]; then
        echo "usage: findit file"
        return 1
    fi
    find / -name $1 -print
}
```  
```  
 (python3.7)  ~/bin  . functions.main
 (python3.7)  ~/bin  findit
usage: findit file
```  
### load shell文件  

**使用. file-path来加载shell文件，之后可以直接使用其中定义的函数**

```sh
bash-3.2$ find
find           find2perl      find2perl5.18  findhyph       findrule       findrule5.18
bash-3.2$ ls
__pycache__                     functions.main                  phantomjs-2.1.1-macosx.zip
compose.py                      img_view.py                     rec.py
format_boost.py                 index.sh                        sox
front_rsa                       phantomjs                       t.sh
front_rsa.pub                   phantomjs-2.1.1-macosx          test.sh
bash-3.2$ . functions.main
bash-3.2$ find
find           find2perl5.18  findit         findrule5.18
find2perl      findhyph       findrule
bash-3.2$ findit
usage: findit file
bash-3.2$ more functions.main
#!/usr/bin/env sh

function findit() {
    if [ $# -lt 1 ]; then
        echo "usage: findit file"
        return 1
    fi
    find / -name $1 -print
}
bash-3.2$ unset findit
bash-3.2$ find
find           find2perl      find2perl5.18  findhyph       findrule       findrule5.18
```

### getopts
- **解析命令行参数的函数**  
> ```sh
> function parse_cmd() {
>     ALL=false
>     HELP=false
>     VERBOSE=false
>     function usage() {
>         echo "`basename $0` -[a h v] -c value -f file" 1>&2
>     }
>     while getopts ":ahvf:c:" OPTION; do
>         case $OPTION in
>             a)ALL=true
>                 ;;
>             h)HELP=true
>                 ;;
>             f)FILE=$OPTARG
>                 ;;
>             v)VERBOSE=true
>                 ;;
>             c)COPIES=$OPTARG
>                 ;;
>             \?) # usage statemant
>                 usage
>                 ;;
>             :) # missing params
>                 echo "`basename $0`: option \"-$OPTARG\" missing value" 1>&2
>                 return 1
>                 ;;
>         esac
>     done
> 
>     if [ -z $FILE ] || [ -z $COPIES ]; then
>         echo "`basename $0` missing options -f -c"
>         usage
>         return 1
>     fi
> }
> ```

- **调用该函数**
> ```sh
> parse_cmd $@
> 
> case $? in
>     1) echo "something wrong"
>         ;;
>     0) echo "seems ok"
>         echo ALL is $ALL
>         echo VERBOSE is $VERBOSE
>         echo HELP is $HELP
>         echo FILE is $FILE
>         echo COPIES is $COPIES
>         ;;
> esac
> ```
