# 字符串查找和替换
http://xstarcd.github.io/wiki/vim/vim_replace_encodeing.html


## 规则
作用范围 				| from 	| to 	| 每行的规则 	| confirm
- 						| - 	| - 	| - 			| -
.,$s 从当前行到最后一行 | #		|		| g:替换本行所有匹配				|	c	
.,.+2s 从当前行到之后的两行 | #		|		| g:替换本行所有匹配				|	c	
%s 所有行 				| /		|		|				|
s 当前行 				| +     |		|				|

### `:.,$s/abc/efg/gc`  
1. .,$ 指定执行的范围为从当前行到最后  
2.  最后的g表示当前行所有匹配，不然则只会替换第一个  
3.  最后的c表示confirm，需要确认  
4. 分隔符有三种：/, #, + 遇到特殊字符用其他两个来代替


### `:%s#//#/#gc`  
替换文件中所有的`//`到`/`

# 禁用括号匹配
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

# 宏录制与重复  
```
@{0-9a-z".=*+} Execute the contents of register {0-9a-z”.=*+} [count] times. 
Note that register ‘%’ (name of the current file) and ‘#’ (name of the alternate file) 
cannot be used.
```

vim里面宏录制是一个非常NB的功能，你可以录制一系列的操作到寄存器里面，之后直接@{寄存器}就可以重复之前录制的一系列操作

vim里面可以用q{寄存器}开始进行录制，之后用q来结束录制,寄存器的名字a-z中的任意一个，比如qa就是将操作录制到寄存器a中，之后如果想要使用该宏，使用@a就可以重复录制的操作

# 光标回到之前的位置
ctrl+o  回退 

ctrl+i  前进 

# 全局搜索 ctrlsf  
```
Enter ：跳转到选择的行；
t : 在新建标签中打开该文件；
p : 在预览窗口中打开；
q : 退出CtrlSF窗口。
```  

# 缓冲区使用buffer
命令 | 作用
- | -
:ls, :buffers      | 列出所有缓冲区
:bn[ext     ]           | 下一个缓冲区
:bp[revious]              | 上一个缓冲区
:b {number, expression}   |  跳转到指定缓冲区
:bd                |  关闭缓冲区
:b \<Tab\>            | 列出缓冲区

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
