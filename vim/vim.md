# VIM
<!-- toc -->

- [字符串查找和替换](#)
  * [规则](#-1)
    + [`:.,$s/abc/efg/gc`](#sabcefggc)
    + [替换行首和行尾的空格](#-2)
    + [`:%s#//#/#gc`](#sgc)
- [禁用括号匹配](#-3)
- [宏录制与重复](#-4)
- [光标回到之前的位置](#-5)
- [全局搜索 ctrlsf](#-ctrlsf)
- [缓冲区使用buffer](#buffer)
- [跳转函数段](#-6)
- [Vim插件之文件搜索插件-CtrlP](#Vim-CtrlP)
- [居中-:set so=999](#-set-so999)
- [调整窗口尺寸 :virtical resize](#-virtical-resize)
- [reload/refresh all buffers](#reloadrefresh-all-buffers)
- [replace in all buffers](#replace-in-all-buffers)
- [clipborad ssh copy](#clipborad-ssh-copy)
- [build from source](#build-from-source)
- [backspace 退格不能用](#backspace)
- [open multiple file(打开多个文件)](#open-multiple-file)
- [vim server](#vim-server)
  * [退出server](#server)
- [书签](#-7)
- [tab](#tab)
- [sudo save](#sudo-save)

<!-- tocstop -->

## 字符串查找和替换
http://xstarcd.github.io/wiki/vim/vim_replace_encodeing.html


### 规则
作用范围                | from  | to    | 每行的规则    | confirm
-                       | -     | -     | -             | -
.,$s 从当前行到最后一行 | #     |       | g:替换本行所有匹配                |   c
.,.+2s 从当前行到之后的两行 | #     |       | g:替换本行所有匹配                |   c
%s 所有行               | /     |       |               |
s 当前行                | +     |       |               |

#### `:.,$s/abc/efg/gc`
1. .,$ 指定执行的范围为从当前行到最后
2.  最后的g表示当前行所有匹配，不然则只会替换第一个
3.  最后的c表示confirm，需要确认
4. 分隔符有三种：/, #, + 遇到特殊字符用其他两个来代替

#### 替换行首和行尾的空格

命令 | 作用  
 - | -  
``:%s/^\\s\\+``  |  删除行首的空格  
`:%s/\\s\\+$`  | 删除行尾的空格  
 ^  |  行首 
 $  |  行尾 
 `\\s`   |空格和tab  
 `\\+` | 匹配一个或多个

> #### `:%s#//#/#gc`  
> 替换文件中所有的`//`到`/`  

> 
> `:%s/\\t/  /g`
> 替换tab为两个空格

[top](#VIM)
## 禁用括号匹配
```
" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FuckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FuckThatMatchParen()
augroup END
```

## 宏录制与重复
```
@{0-9a-z".=*+} Execute the contents of register {0-9a-z”.=*+} [count] times.
Note that register ‘%’ (name of the current file) and ‘#’ (name of the alternate file)
cannot be used.
```

vim里面宏录制是一个非常NB的功能，你可以录制一系列的操作到寄存器里面，之后直接@{寄存器}就可以重复之前录制的一系列操作
**`q{寄存器}`** **开始录制**
**`@{寄存器}`** **重复录制的操作**
vim里面可以用**`q{寄存器}` **开始进行录制，之后用q来结束录制,寄存器的名字a-z中的任意一个，比如qa就是将操作录制到寄存器a中，之后如果想要使用该宏
，使用@a就可以重复录制的操作
[top](#VIM)
## 光标回到之前的位置
ctrl+o  回退

ctrl+i  前进

## 全局搜索 ctrlsf
```
Enter ：跳转到选择的行；
t : 在新建标签中打开该文件；
p : 在预览窗口中打开；
q : 退出CtrlSF窗口。
```

## 缓冲区使用buffer
命令 | 作用
- | -
:ls, :buffers      | 列出所有缓冲区
:bn[ext     ]           | 下一个缓冲区
:bp[revious]              | 上一个缓冲区
:b {number, expression}   |  跳转到指定缓冲区
:bd                |  关闭缓冲区
:b /<Tab/>            | 列出缓冲区

示例

```
:b <Tab>       " 显示所有Buffer中的文件, tab自动补全
:b car<Tab>    " 显示 car.c car.h
:b *car<Tab>   " 显示 car.c jetcar.c car.h jetcar.h
:b .h<Tab>     " 显示 vehicle.h car.h jet.h jetcar.h
:b .c<Tab>     " 显示 vehicle.c car.c jet.c jetcar.c
:b ar.c<Tab>   " 显示 car.c jetcar.c
:b j*c<Tab>    " 显示 jet.c jetcar.c jetcar.h
```
[top](#VIM)
## 跳转函数段   
`[[]]`
`(())`

## Vim插件之文件搜索插件-CtrlP

[阅读数:48次](javascript:;)[2018-01-17](https://lizhiwei.net/V_p_CtrlP.html)

*   `Ctrl-p`:模糊搜索当前目录及其子目录下的所有文件。
*   `Ctrl-f`:模糊搜索最近打开的文件（MRU）

**进入搜索模式后可使用的快捷键**

*   `Ctrl-d`:在搜索框内按ctrl-d，切换为值搜索文件名（只匹配文件名），再次按ctrl-d则返回全路径搜索（如果路径中有要搜索的字符串则也会被显示在搜索结果框内）
*   `Ctrl-r`:切换到正则表达式模式
*   `Ctrl-b`和`Ctrl-f`:在不同的搜索模式下切换。
*   `Ctrl-j`/`Ctrl-k`:在搜索结果中向下/上移动。
*   `Ctrl-x`:在当前窗口水平分屏打开文件
*   `Ctrl-v`:在当前窗口垂直分屏打开文件
*   `Ctrl-t`:在tab中打开文件
*   `Ctrl-p`/`Ctrl-n`:选择历史记录。
*   `Ctrl-y`:文件不存在时创建文件及目录
*   `Ctrl-z`:标记/取消标记，标记多个文件后可以使用`Ctrl-o`同时打开多个文件
[top](#VIM)
## 居中-:set so=999
一般是按“zz”调的中间。

如果你是希望固定，那么可以设置scrolloff：

    'scrolloff' 'so'	数值型	(缺省为 0)
    			全局
    			{Vi 无此功能}
    	光标上下两侧最少保留的屏幕行数。这使你工作时总有一些可见的上下文。
    	如果你设置此选项为很大的值 (比如 999)，光标所在的行将总定位在窗口的中
    	间位置 (除非你非常靠近文件开始或者结束的地方，或者有长行回绕)。
    	水平滚动见 'sidescrolloff'。
    	注意: 如果置位 'compatible'，该选项被设为 0。
    

然后设一下就好了：

下面总有3行  

    :se so=3
    

  
总在中间  

    :se so=999

[top](#VIM)  
  
作者：知乎用户  
链接：https://www.zhihu.com/question/22445442/answer/21379266  
来源：知乎  
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

## 调整窗口尺寸 :virtical resize
``````
:virtical resize +10
:resize +10
``````
    如果要水平的平分窗口，可以使用”:split“命令，如果要改变窗口尺寸，可以用ctrl + w + +\\- 来改变窗口尺寸，这个操作方式等同于命令” :<C-W>+  "或者” :<C-W>- "，如果一次要增加3个char或者减少3个char，则命令是” :<C-W>+ 3"或” :<C-W>-3"，其实这两个命令也不是真正的命令，仅仅是替代了操作方式而已，下面会给出真正的命令。

         如果我要垂直的平分窗口，则可以使用”:vsplit“或者 “:vertical split”命令，如果要改变窗口尺寸，该如何操作呢？

         要回答这个问题，需要先了解vim 的“resize”命令。resize的具体内容，请自己去查找，这里不多讲。先回答上面的一个包袱，命令” :<C-W>+3 "等效于“:resize +3”，命令” :<C-W>-3 "等效于“:resize -3”。

         再回答垂直分割窗口时候如何改变窗口大小的问题。垂直分割窗口时的命令就是在分割窗口命令”split“前面加上”vertical“，同样地，垂直分割窗口时修改窗口尺寸的命令就是在水平分割窗口时改变窗口尺寸的命令”resize“前面也加上”vertical“为”vertical resize“！怎么样，有趣吧？

         因此，垂直分割窗口时要给窗口增加3个char或者减少3个char 的命令是":vertical resize +3" 或 ":vertical resize -3"。

作者：企鹅 
来源：CSDN 
原文：https://blog.csdn.net/menggucaoyuan/article/details/12950711 
版权声明：本文为博主原创文章，转载请附上博文链接！

[top](#VIM)

## reload/refresh all buffers
See`:help bufdo`for what you want to do. It will execute a command in each buffer in the buffer list. For example:

    :bufdo e
    

You may also want to look at`:help noconfirm`to disable the confirmation dialog before issueing the`bufdo`command

    :set noconfirm
    

and reenabling it after the`bufdo`command.

    :set confirm

[top](#VIM)

## replace in all buffers

```
:bufdo %s/pattern/replace/ge | update
```

[Search and replace in multiple buffers \\| Vim Tips Wiki | FANDOM powered by Wikia](http://vim.wikia.com/wiki/Search_and_replace_in_multiple_buffers)
[top](#VIM)

## clipborad ssh copy

[No xauth Program; Cannot Forward With Spoofing Error and Solution - nixCraft](https://www.cyberciti.biz/faq/linux-unix-appleosx-noxauth-program-cannot-forward-with-spoofing/)

缺少`.Xauthority`文件

```
sudo apt-get install xauth
```

[top](#VIM)


## build from source

>```
>./configure --prefix=/opt/local --enable-fail-if-missing --disable-darwin  --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-cscope --enable-terminal --enable-multibyte --enable-fontset --with-features=huge --with-x
>```

[top](#VIM)


## backspace 退格不能用

[Why doesn't the backspace key work in insert mode? - Vi and Vim Stack Exchange](https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode)

## open multiple file(打开多个文件)

```
:args ./*.py

```

[top](#VIM)

## vim server

### 退出server

```
vim --servername toto1 --remote-send '<Esc>:wqa<CR>'
```

[top](#VIM)

## 书签
命令 | 作用
- | -
mm	| 无名书签 (on/off)
mi	| 有注释的书签 (on/edit)
mn/mp	| 后一个/前一个书签
ma	| 显示所有书签
mc	| 删除当前buffer中书签
mx	| 删除所有书签


## tab
```
set ts=4
set expandtab
set autoindent
```

```
:%s/\\t/  /g
```

## sudo save
:w !sudo tee %
