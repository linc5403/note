# Shell

## Important commands

| command | meaning |
| - | - |   
| type -a | 查看命令在系统中的可用情况|  

## shell script

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
标准输入赋值到变量  

```
hunch@linchuan-test3:~/test/shell$ read name
sdfjlkavsj bn pihef awoenkjn fsdad
hunch@linchuan-test3:~/test/shell$ echo $name
sdfjlkavsj bn pihef awoenkjn fsdad
```


输入到数量多余变量数量，最后一个变量会收集剩余所有到值  

```
hunch@linchuan-test3:~/test/shell$ read name1 name2 nameall
aa bb cc dd ee ff gg hh
hunch@linchuan-test3:~/test/shell$ echo $name1
aa
hunch@linchuan-test3:~/test/shell$ echo $name2
bb
hunch@linchuan-test3:~/test/shell$ echo $nameall
cc dd ee ff gg hh
```

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
