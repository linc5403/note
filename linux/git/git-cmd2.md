| reset | checkout | revert  
|  - |  - |  -  
|   命令 | 作用域 | 常用情景 
| git reset | 提交层面 | 在私有分支上舍弃一些没有提交的更改  
| git reset| 文件层面 |	将文件从缓存区中移除  
| git checkout |	提交层面 |	切换分支或查看旧版本  
| git checkout |	文件层面 |	舍弃工作目录中的更改  
| git revert |	提交层面 |	在公共分支上回滚更改  
| git revert |	文件层面 |	（然而并没有）  


https://gitbook.tw/chapters/using-git/reset-commit.html  

https://github.com/geeeeeeeeek/git-recipes/wiki/5.2-%E4%BB%A3%E7%A0%81%E5%9B%9E%E6%BB%9A%EF%BC%9AReset%E3%80%81Checkout%E3%80%81Revert-%E7%9A%84%E9%80%89%E6%8B%A9  



# pre-commit


`$ flake8 --install-hook git`

`$ git config --bool flake8.strict true`


# git fetch origin branchname:branchname

可以把远程某各分支拉去到本地的branchname下，如果没有branchname，则会在本地新建branchname

 
# 拉去新的远程分支
`git checkout origin/remoteName -b localName`

获取远程分支remoteName 到本地新分支localName，并跳到localName分支

# 创建远程分支
1. 创建本地分支  
`$ git checkout -b localName`

2. 创建远程分支  
`git push origin remoteName:localName`
注意:左右不能有空格  

