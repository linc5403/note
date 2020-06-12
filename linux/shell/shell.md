
# Table of Contents

1.  [Shell](#orgfcfa7dc)
    1.  [Important commands](#orgee4813d)
    2.  [shell cmd](#org27972e1)
        1.  [参考材料](#org71890c1)
        2.  [文件类型](#org575fb08)
        3.  [通配符，批量创建](#orgbdaf34d)
        4.  [find](#org6c96a58)
        5.  [xargs](#org94cb727)
        6.  [echo](#org0891688)
        7.  [read](#org952e028)
        8.  [cat](#orged4c976)
        9.  [tee](#orga2f4c60)
        10. [标准输入，标准输出和错误输出](#orgaa9b9dc)
        11. [grep](#org925b6e1)
        12. [awk](#orge116ec1)
        13. [sed](#orgce0070b)
        14. [join](#org6438fb8)
        15. [cut](#org62371d2)
        16. [rev](#org89b64b7)
        17. [sort](#orgd66b662)
        18. [ripgrep](#org97e0b74)
    3.  [shell变量和参数](#org770e479)
        1.  [变量设置时的不同模式](#orgbca71de)
        2.  [参数的引用](#orgaf899e8)
        3.  [各种引号](#org2930d3e)
        4.  [参数展开(parameter expantion)](#orga5895fb)
    4.  [条件测试](#org197e876)
        1.  [文件状态测试](#org656958c)
        2.  [组合(仅用于文件状态测试)](#org617380c)
        3.  [字符串测试](#orgb50c338)
        4.  [数值测试](#org4b252b3)
        5.  [expr](#org2c36b0a)
        6.  [<< HERE](#org3697cca)
        7.  [command substitution](#org6d37af4)
    5.  [控制流结构](#orgf7403de)
        1.  [if then else](#orgfabafed)
        2.  [case](#org07df566)
        3.  [for](#org1e03dfe)
        4.  [until](#orgff88ece)
        5.  [while](#orgd482b35)
        6.  [break](#org543e456)
        7.  [continue](#org60a58e4)
    6.  [shell函数](#orgf277236)
        1.  [load shell文件](#org5db2664)
        2.  [getopts](#org54e0483)

\#+LATEX<sub>HEADER</sub> \usepackage {ctex}


<a id="orgfcfa7dc"></a>

# Shell


<a id="orgee4813d"></a>

## Important commands

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">command</th>
<th scope="col" class="org-left">meaning</th>
<th scope="col" class="org-left">reference</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">type -a</td>
<td class="org-left">查看命令在系统中的可用情况</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">fdupes</td>
<td class="org-left">查找重复文件</td>
<td class="org-left"><https://linux.cn/article-6127-1.html></td>
</tr>


<tr>
<td class="org-left">fslint</td>
<td class="org-left">还是查找重复文件</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org27972e1"></a>

## shell cmd


<a id="org71890c1"></a>

### [参考材料](https://www.gnu.org/software/coreutils/manual/html_node/index.html)


<a id="org575fb08"></a>

### 文件类型

    b - 块设备文件。
    d - 目录。
    c - 字符设备文件。
    p - 管道文件。
    l - 符号链接文件。
    f - 普通文件。


<a id="orgbdaf34d"></a>

### 通配符，批量创建

    touch {0..10}.txt
    touch {a..z}.txt
    touch {0,1,2}.txt


<a id="org6c96a58"></a>

### find

-   `-exec 'command' {} \;`
    
        find -name "*.md" -exec more {} \;
    
    注意 `{}` 与 `\;` 之间的空格
-   `-mtime(modify) -ctime(create) -atime(access)`
    -   参数 `+` 表示在此内， `-` 表示在此之外
        
        <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
        
        
        <colgroup>
        <col  class="org-left" />
        
        <col  class="org-left" />
        </colgroup>
        <tbody>
        <tr>
        <td class="org-left">`-mtime +3`</td>
        <td class="org-left">3天内</td>
        </tr>
        
        
        <tr>
        <td class="org-left">`-mtime -1`</td>
        <td class="org-left">1天前</td>
        </tr>
        </tbody>
        </table>
-   `-newer`
    
    比哪个文件新
    
    用 `!` 来表示逻辑非
    
        find ./ ! -newer html学习.md

-   `-depth`
    
    先查找当前目录，再查找子目录

-   `-mount`
    
    只查找当前文件系统，不进去其他文件系统

-   `-ok`
    
    用法同-exec，但是会提示是否执行该命令

-   `-type`
    
    选项见上面，常用的是
    
    -   `-f` :普通文件
    -   `-d` :目录

-   `-max-depth 1`
    
    **应该放在其他选项之前**
    
    只搜索当前目录


<a id="org94cb727"></a>

### xargs

    ls -tr1 | tail -5 | xargs -i cp {} dest/folder/
    xargs -n1 -i cp {} dest/folder

-   文件名包含空格
    -   仅仅使用find
        
            find ./ -print0 |xargs -0 cp '{}' /data
        
        文件名中包含空格的情况下使用， `-print0` 和 `-0` 配合使用，能够将带空格的文件找出来。
    
    -   带grep的情况
        
            find ./ -type f | grep -v "\.git" |grep -v "code" | grep "02" | xargs -d '\n' file
        
        使用 `-d '\n'` 选项指定使用回车作为参数的分割符

-   参数在中间的情况
    
        find ./ -name "*.mp4" | xargs -i cp '{}' /data
    
        find ./ -type f -name "*.mp4" | xargs -I{} cp {} video/


<a id="org0891688"></a>

### echo

    \c 不换行。
    \f 进纸。
    \t 跳格。
    \n 换行。

-   `-e`
    转义
    
        echo -e "\"abc\" `tty`" > "abc" /dev/pts/11


<a id="org952e028"></a>

### read

-   **read -p** 
    
    给出提示符，不显示换行
    
        read -p "input your name: " a
        echo $a
         ✘ (python3.7)  ~/bin  t.sh
        input your name: abc
        abc

-   **标准输入赋值到变量**
    
        hunch@linchuan-test3:~/test/shell$ read name
        sdfjlkavsj bn pihef awoenkjn fsdad
        hunch@linchuan-test3:~/test/shell$ echo $name
        sdfjlkavsj bn pihef awoenkjn fsdad
-   **输入到数量多余变量数量，最后一个变量会收集剩余所有到值**
    
        hunch@linchuan-test3:~/test/shell$ read name1 name2 nameall
        aa bb cc dd ee ff gg hh
        hunch@linchuan-test3:~/test/shell$ echo $name1
        aa
        hunch@linchuan-test3:~/test/shell$ echo $name2
        bb
        hunch@linchuan-test3:~/test/shell$ echo $nameall
        cc dd ee ff gg hh

-   **为变量赋缺省值**
    
        read a
        case ${a:=1} in
            1|2) echo "you choose ${a}"
        	;;
            *) echo "must in [ 1 | 2 ]"
        	;;
        esac

-   **读取文本内容**
    **-r表示不转义解释，用raw的内容**
    
    简单的说，使用 `-r` 会解析 `\` 转义，但是当 `\` 在行末的时候不会将下一行连接到一起
    
    不使用 `-r` 则不会解析 `\` 转义，当 `\` 在行末的时候会将下一行连接到一起
    
        $ more 123
        asdf\asdf\asdf
        asdf\nasdf\nasdf\n
        aaaaaaaaaa\
        cccccc
        $ while read line; do echo $line; done < $a
        asdfasdfasdf
        asdfnasdfnasdfn
        aaaaaaaaaacccccc
        $ while read -r line; do echo $line; done < $a
        asdfsdfsdf
        asdf
        asdf
        asdf
        
        aaaaaaaaaa\
        cccccc
    
        a="abc.txt"
        while read -r line; do echo $line; done < $a

-   **读取命令结果**  
    
        while read -r line; do echo $line; done <<<$(ps aux | grep hunch)
        while read -r line; do echo $line; done < <(ps aux | grep hunch)


<a id="orged4c976"></a>

### cat

-   v
    显示控制字符
    
         $ more 123
        jkkdsf
         $ cat -v 123
        jkkdsf^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F^F

-   编辑文件 ctrl-D结束
    
        hunch@linchuan-test3:~/test/shell$ cat > myfile
        asdf
        1234
        hunch@linchuan-test3:~/test/shell$ more myfile
        asdf
        1234


<a id="orga2f4c60"></a>

### tee

输出到标准输出，同时同步一份输出到文件

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

-   vim 编辑root权限的文件
    
        :w !sudo tee %


<a id="orgaa9b9dc"></a>

### 标准输入，标准输出和错误输出

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">command > filename 2>&1</th>
<th scope="col" class="org-left">标准输出和错误输出重定向到一个文件</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">command 2 > filename</td>
<td class="org-left">错误输出重定向到一个文件</td>
</tr>
</tbody>
</table>

-   `>` 等价于 `1>`
-   `2>&1` 的含义是将错误输出重定向到标准输出


<a id="org925b6e1"></a>

### grep

-   通配符
    
    -   `*`
        
        匹配之前字符0次任意多次
    -   `.`
        表示任意1个字符
    
    `*` 和 `.` 通常会联合使用
    
        grep "dev-env.*conf" find_out
        ./docker-compose-samples/dev-env/proxy/polipo.conf
        ./docker-compose-samples/dev-env/proxy/ssh/config
    
    这个命令的作用是查找 `dev-env` 后面跟着 `conf` 的行

-   `^` 匹配行首
    
        grep "^vim" filename
        vim.md
        vim-build-from-source-mac.md
        vim2.md
        vim-build-from-source-debian.md

-   `$` 匹配行尾
    
        grep "sample$" filename
        commit-msg.sample
        pre-rebase.sample
        pre-commit.sample
        applypatch-msg.sample
        fsmonitor-watchman.sample

-   `\{1, 3\}` 匹配出现次数
    
    -   `\{1, \}` 一次以上
    -   `\{1\}` 刚好一次
    
        note  grep "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ~/.ssh/config
        HOST 121.196.213.142
        Host 192.168.1.66
        Host 40.125.172.62
        Host 139.219.10.159


<a id="orge116ec1"></a>

### awk

-   `BEGIN END`
    
        awk 'BEGIN {print "FILENAME\n--------------------"} {print $NF} END {print "end of report"}' find_out
    
        awk -F/ 'BEGIN {print ARGV[1] "\n----------"} {if ($NF ~/\.org$/)print NR " " $NF} END {print "---------------\nend of report"}' find_out

-   `FILENAME`
    
    当前文件名
    
    **warning** FILENAME not working in BEGIN rule. 需要用上面的方式在BEGIN中打印文件名。
    
    [print filename](https://www.cyberciti.biz/faq/how-to-print-filename-with-awk-on-linux-unix/)

-   `NR` 
    
    number of record, 行号

-   `NF`
    
    number of field, 域号
    
    -   打印最后一列
        
            awk '{print $NF}'
    
    -   打印倒数第二列
        
            awk '{print $(NF-1)}'

-   `-F` **定义分割符号**
    
        awk -F/ '{print $NF}' find_out | grep "md$"

-   正则匹配
    
    ~/re/
    
        awk '{if ($NF ~/md$/) print $0}' find_out
        awk '{if ($0 ~/\.md$/) print $0}' find_out
        awk '{if ($6 !~/May/) print $0}' find_out
        awk '{if ($6 ~/May/) print $0}' find_out
        awk -F/ '{if ($NF ~/org$/) print $2 "/" $3}' find_out
    
    上面的 `!` 表示取反操作


<a id="orgce0070b"></a>

### sed

好像没什么好说的，vi中自带的就是sed操作

1.  替换行首和行尾空格

    -   **行首** `sed 's/^[ \t]*//g'`
    -   **行尾** `sed 's/[ \t]*$//g'`
    -   **vim替换tab** `%retab`:
    -   **vim删除行尾空格和tab** `:%s/\s\+$//g`
    -   **只删除行尾空格，不删除tab** `:%s/ *$//g`


<a id="org6438fb8"></a>

### TODO join


<a id="org62371d2"></a>

### cut

[参考材料](https://www.gnu.org/software/coreutils/manual/html_node/cut-invocation.html#cut-invocation)

-   `-d` 指定分割符
-   `-fn` 只保留第n个field
-   `-fn-` 保留从n开始及以后的所有field

删除最后一个field:

    linc@pop-os:~/books$ echo "abc.def.hij" | rev | cut -d '.' -f2- | rev
    abc.def


<a id="org89b64b7"></a>

### rev

reverse输入的字符


<a id="orgd66b662"></a>

### sort

**sort里面起始域号是1，不是0**

-   `sort -u`
    
    删除所有重复行

-   `sort -k 3`
    
    按照第三列排序

-   `sort -kr 3`
    
    第三列倒序

-   `sort -nr -k 4`
    
    第四列数字倒序

-   `sort -M -k 4`
    
    第四列月份排序

-   sort的示例： 
    1.  第2列数字顺序，第5列数字顺序，第6列月份倒序
        
            ls -la | sort -k 2n -k 5n  -k 6Mr
            -rw-r--r--  1 linc linc    19 Mar  4 08:36 note.org~
            -rw-r--r--  1 linc linc    79 Mar  6 11:26 .gitignore
            -rw-r--r--  1 linc linc   178 Mar  6 18:07 123
            -rw-r--r--  1 linc linc   342 Mar  6 09:13 note.org
            -rw-r--r--  1 linc linc  6749 Feb 28 17:27 my_note.ipynb
            -rw-r--r--  1 linc linc 10113 Mar  6 18:20 find_out
            drwxr-xr-x  2 linc linc  4096 Mar  6 09:38 latex
            drwxr-xr-x  2 linc linc  4096 Mar  6 11:17 cloud
            drwxr-xr-x  2 linc linc  4096 Mar  6 11:30 idea
            drwxr-xr-x  2 linc linc  4096 Mar  6 15:55 python
            drwxr-xr-x  2 linc linc  4096 Mar  6 16:58 temp
            drwxr-xr-x  2 linc linc  4096 Feb 28 17:27 ffmpeg
            drwxr-xr-x  2 linc linc  4096 Feb 28 17:27 mac
            drwxr-xr-x  2 linc linc  4096 Feb 28 17:27 meta
            drwxr-xr-x  2 linc linc  4096 Feb 28 17:27 vim
            drwxr-xr-x  3 linc linc  4096 Feb 28 17:27 books
            drwxr-xr-x  6 linc linc  4096 Feb 28 17:27 docker-compose-samples
            drwxr-xr-x  8 linc linc  4096 Mar  7 10:29 .git
            drwxr-xr-x 11 linc linc  4096 Mar  6 09:57 linux
            drwxr-xr-x 15 linc linc  4096 Mar  7 10:16 .
            drwxr-xr-x 60 linc linc  4096 Mar  7 11:26 ..
            total 96
    2.  日期的排序
        
            4.150.156.3 - - [01/Apr/2004:06:31:51 +0000] message 1
            211.24.3.231 - - [24/Apr/2004:20:17:39 +0000] message 2
        
        对上面的文件先按照时间戳排序，再按照IP地址排序
        
            sort -s -t ' ' -k 4.9n -k 4.5M -k 4.2n -k 4.14,4.21 file*.log |
            sort -s -t '.' -k 1,1n -k 2,2n -k 3,3n -k 4,4n
        
        需要调用两次sort进行排序，因为IP地址是以 `.` 进行分割。
        
        思路：
        
        1.  第一个sort按照年-月-日-时间的顺序排序
        2.  第二个sort使用 `-t '.'` 将 `.` 用作分割符分离IP地址

-   [参考资料](https://www.gnu.org/software/coreutils/manual/html_node/sort-invocation.html)


<a id="org97e0b74"></a>

### ripgrep

1.  安装

    [github地址](https://github.com/BurntSushi/ripgrep/)

2.  指定文件类型进行搜索（后缀名）

        rg -torg png
    
    在.org文件中搜索png字符串


<a id="org770e479"></a>

## shell变量和参数


<a id="orgbca71de"></a>

### 变量设置时的不同模式

***注意：:=不能单独使用，需要在其他语句中使用，如echo，if等***

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">语法</th>
<th scope="col" class="org-left">含义</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">Variable-name=value</td>
<td class="org-left">设置实际值到variable-name</td>
</tr>


<tr>
<td class="org-left">Variable-name+value</td>
<td class="org-left">如果设置了variable-name，则重设其值</td>
</tr>


<tr>
<td class="org-left">Variable-name:?value</td>
<td class="org-left">如果未设置variable-name，显示未定义用户错误信息</td>
</tr>


<tr>
<td class="org-left">Variable-name?value</td>
<td class="org-left">如果未设置variable-name，显示系统错误信息</td>
</tr>


<tr>
<td class="org-left">Variable-name:=value</td>
<td class="org-left">如果未设置variable-name，设置其值</td>
</tr>


<tr>
<td class="org-left">Variable-name:-value</td>
<td class="org-left">同上，但是取值并不设置到variable-name，可以被替换</td>
</tr>
</tbody>
</table>


<a id="orgaf899e8"></a>

### 参数的引用

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">参数</th>
<th scope="col" class="org-left">含义</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">$#</td>
<td class="org-left">参数个数</td>
</tr>


<tr>
<td class="org-left">$0</td>
<td class="org-left">脚本名称</td>
</tr>


<tr>
<td class="org-left">$1</td>
<td class="org-left">第一个参数</td>
</tr>


<tr>
<td class="org-left">$?</td>
<td class="org-left">最后一条命令的退出状态, 0 表示正常，其他是异常</td>
</tr>
</tbody>
</table>


<a id="org2930d3e"></a>

### 各种引号

-   **双引号**
    除 `$`, `` ` ``, `\` 外的其他符号
-   **单引号**
    屏蔽所有的符号
-   **反引号**
    反引号用于设置系统命令的输出到变量
-   **反斜线**
    如果下一个字符有特殊含义，反斜线防止shell误解其含义


<a id="orga5895fb"></a>

### 参数展开(parameter expantion)

    ${parameter:-word} # parameter为空替换为word
    ${parameter:=word} # parameter为空替换，并将值赋给$parameter变量
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

    ${parameter:?word} # parameter为空报错, 主要用于排查错误
    ${parameter:+word} # parameter不为空替换

    ${#parameter}      # 获得字符串的长度

截取字符串&#x2014;有了下面这四种用法就不必使用cut命令来截取字符串了。

    ${parameter%word}  # 最小限度从后面截取word
    ${parameter%%word} # 最大限度从后面截取word
    ${parameter#word}  # 最小限度从前面截取word
    ${parameter##word} # 最大限度从前面截取word

    bash-3.2$ a=abc.txt
    bash-3.2$ echo ${a%.txt}
    abc
    bash-3.2$ echo ${a#abc}
    .txt

-   替换文件后缀名的一个方法：
    
        for i in `find ./ -name "*.list"`; do sudo mv $i ${i%.jpg}.bak; done


<a id="org197e876"></a>

## 条件测试


<a id="org656958c"></a>

### 文件状态测试

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">symbol</th>
<th scope="col" class="org-left">mean</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">-f</td>
<td class="org-left">普通文件</td>
</tr>


<tr>
<td class="org-left">-d</td>
<td class="org-left">目录</td>
</tr>


<tr>
<td class="org-left">-r</td>
<td class="org-left">可读</td>
</tr>


<tr>
<td class="org-left">-x</td>
<td class="org-left">可执行</td>
</tr>


<tr>
<td class="org-left">-s</td>
<td class="org-left">文件长度大于0</td>
</tr>
</tbody>
</table>


<a id="org617380c"></a>

### 组合(仅用于文件状态测试)

-   **-a逻辑与**
-   **-o逻辑或**

示例：

    [ -f abc.sh -a -x abc.sh ]

abc.sh存在且可执行, **注意括号两端的空格**


<a id="orgb50c338"></a>

### 字符串测试

    [ string operator string ]
    [ operator string ]

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">operator</th>
<th scope="col" class="org-left">mean</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">=</td>
<td class="org-left">两个字符串相等。</td>
</tr>


<tr>
<td class="org-left">!=</td>
<td class="org-left">两个字符串不等。</td>
</tr>


<tr>
<td class="org-left">-z</td>
<td class="org-left">空串。</td>
</tr>


<tr>
<td class="org-left">-n</td>
<td class="org-left">非空串。</td>
</tr>
</tbody>
</table>


<a id="org4b252b3"></a>

### 数值测试

    [ "number" numeric_operator "number" ]

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">operator</th>
<th scope="col" class="org-left">mean</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">-eq</td>
<td class="org-left">数值相等。</td>
</tr>


<tr>
<td class="org-left">-ne</td>
<td class="org-left">数值不相等。</td>
</tr>


<tr>
<td class="org-left">-gt</td>
<td class="org-left">第一个数大于第二个数。</td>
</tr>


<tr>
<td class="org-left">-lt</td>
<td class="org-left">第一个数小于第二个数。</td>
</tr>


<tr>
<td class="org-left">-le</td>
<td class="org-left">第一个数小于等于第二个数。</td>
</tr>


<tr>
<td class="org-left">-ge</td>
<td class="org-left">第一个数大于等于第二个数。</td>
</tr>
</tbody>
</table>


<a id="org2c36b0a"></a>

### expr

用于数值计算

    expr argument operator argument

    $ expr 3 + 4
    7


<a id="org3697cca"></a>

### << HERE

表示一段输入

    linc@pop-os:~/note$ while read -r line; do echo $line; done << eof
    > asdf
    > bbb
    > ccc
    > eof
    asdf
    bbb
    ccc

1.  read from var

        a="abc def ghi"
        cat <<< $a

2.  read from file

        a="abc.txt"\\
        cat < $a

3.  read from command output

        cat < <(command)\\
        cat <<< $(command)

4.  read from stand input

        $ grep "^a" <&0
        xxx
        abc
        abc
        jjj
    
        linc@pop-os:~/note$ grep "^a" <&0
        ccc
        ddd
        abc
        abc
        aaaaaaaaaaaaaa
        aaaaaaaaaaaaaa

5.  write file with multi-line

        cat > abc.txt <<eof
        abc
        $a
        end
        eof


<a id="org6d37af4"></a>

### TODO command substitution


<a id="orgf7403de"></a>

## 控制流结构


<a id="orgfabafed"></a>

### if then else

    if [ $# -lt "1" ]; then
        echo "need at lest one param"
    else
        echo "the params are $@"
    fi

-变异

    [ -f abc.txt ] && a="True" || a="False"


<a id="org07df566"></a>

### case

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


<a id="org1e03dfe"></a>

### for

    for filex in ./*; do
        echo $filex
    done


<a id="orgff88ece"></a>

### until

    read a
    until [ $a -eq 100 ]; do
        read a
    done


<a id="orgd482b35"></a>

### while

-   **读入文件**
    
        # 从第一个参数的文件读入每一行
        while read line; do
            echo $line
        done < $1


<a id="org543e456"></a>

### break

    # break的使用
    while :; do
        echo "input number in [1..5]"
        read input
        case $input in
    	1|2|3|4|5) echo "you are right"
    	    ;;
    	*) echo "you are wrong"
    	    break
    	    ;;
        esac
    done


<a id="org60a58e4"></a>

### continue

    # continue的使用
    echo "input number in [1..5]"
    while :; do
        read input
        if [ $input -le 5 -a $input -ge 1 ]; then
    	echo "you are right"
    	continue
        fi
        exit 0
    done


<a id="orgf277236"></a>

## shell函数

    function findit() {
        if [ $# -lt 1 ]; then
    	echo "usage: findit file"
    	return 1
        fi
        find / -name $1 -print
    }

     (python3.7)  ~/bin  . functions.main
     (python3.7)  ~/bin  findit
    usage: findit file


<a id="org5db2664"></a>

### load shell文件

**使用. file-path来加载shell文件，之后可以直接使用其中定义的函数**

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


<a id="org54e0483"></a>

### getopts

-   解析命令行参数的函数
    
        function parse_cmd() {
            ALL=false
            HELP=false
            VERBOSE=false
            function usage() {
        	echo "`basename $0` -[a h v] -c value -f file" 1>&2
            }
            while getopts ":ahvf:c:" OPTION; do
        	case $OPTION in
        	    a)ALL=true
        		;;
        	    h)HELP=true
        		;;
        	    f)FILE=$OPTARG
        		;;
        	    v)VERBOSE=true
        		;;
        	    c)COPIES=$OPTARG
        		;;
        	    \?) # usage statemant
        		usage
        		;;
        	    :) # missing params
        		echo "`basename $0`: option \"-$OPTARG\" missing value" 1>&2
        		return 1
        		;;
        	esac
            done
        
            if [ -z $FILE ] || [ -z $COPIES ]; then
        	echo "`basename $0` missing options -f -c"
        	usage
        	return 1
            fi
        }

-   调用该函数

    parse_cmd $@
    
    case $? in
        1) echo "something wrong"
    	;;
        0) echo "seems ok"
    	echo ALL is $ALL
    	echo VERBOSE is $VERBOSE
    	echo HELP is $HELP
    	echo FILE is $FILE
    	echo COPIES is $COPIES
    	;;
    esac

