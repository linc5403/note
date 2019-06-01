# Python 语法高亮  
<!-- toc -->

- [Python 语法高亮](#Python-%E8%AF%AD%E6%B3%95%E9%AB%98%E4%BA%AE)
      - [.vimrc](#vimrc)
      - [~/.vim/bundle/python-syntax/syntax/python.vim](#vimbundlepython-syntaxsyntaxpythonvim)

<!-- tocstop -->


#### Plugin


`Plugin 'vim-python/python-syntax'`

```
140 """" 语法高亮
141 let g:python_highlight_all = 1
142 let g:python_version_2 = 1
143 syntax 
``````

#### ~/.vim/bundle/python-syntax/syntax/python.vim  

```shell
if s:Python2Syntax()
  if !s:Enabled('g:python_print_as_function')
    syn keyword pythonStatement  print
  endif
  syn keyword pythonStatement   exec
  syn keyword pythonImport      as
  syn match   pythonFunction    /\\v[[:alpha:]_.]+\\ze(\\s?\\()/
"  syn match   pythonFunction    '[a-zA-Z_][a-zA-Z0-9_]*' display contained
else
  syn keyword pythonStatement   as nonlocal
  syn match   pythonStatement   '/v/.@<!<await>'
  syn match   pythonFunction    '/%([^[:cntrl:][:space:][:punct:][:digit:]]/|_/)/%([^[:cntrl:][:punct:][:space:]]/|_/)*' display contained
  syn match   pythonStatement   '/<async/s/+def/>' nextgroup=pythonFunction skipwhite
  syn match   pythonStatement   '/<async/s/+with/>'
  syn match   pythonStatement   '/<async/s/+for/>'
  syn cluster pythonExpression contains=pythonStatement,pythonRepeat,pythonConditional,pythonOperator,pythonNumber,pythonHexNumber,pythonOctNumber,pythonBinNumber,pythonFloat,pythonString,pythonBytes,pythonBo    olean,pythonBuiltinObj,pythonBuiltinFunc
endif

```
