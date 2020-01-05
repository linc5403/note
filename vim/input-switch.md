# 中文输入法切换（macos）

<!-- vim-markdown-toc GFM -->

* [1. xkbswitch](#1-xkbswitch)
* [2. .vimrc](#2-vimrc)

<!-- vim-markdown-toc -->

## 1. xkbswitch
```
git clone https://github.com/myshov/xkbswitch-macosx
cp xkbswitch-macosx/bin/xkbswitch /usr/local/bin
git clone https://github.com/myshov/libxkbswitch-macosx
cp libxkbswitch-macosx/bin/libxkbswitch.dylib /usr/local/lib/

```

## 2. .vimrc
```
"""" for chinese input
let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.dylib'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchNLayout = 'us'
let g:XkbSwitchILayout = 'us'
autocmd BufEnter * let b:XkbSwitchILayout = 'us'
```
