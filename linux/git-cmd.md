<!-- toc -->

- [git-cmd](#git-cmd)
  * [本地目录创建远端分支](#%E6%9C%AC%E5%9C%B0%E7%9B%AE%E5%BD%95%E5%88%9B%E5%BB%BA%E8%BF%9C%E7%AB%AF%E5%88%86%E6%94%AF)
  * [初始化配置](#%E5%88%9D%E5%A7%8B%E5%8C%96%E9%85%8D%E7%BD%AE)
  * [reset checkout 和 revert](#reset-checkout-%E5%92%8C-revert)
  * [pre-commit](#pre-commit)
  * [git fetch origin branchname:branchname](#git-fetch-origin-branchnamebranchname)
  * [获取新的远程分支](#%E8%8E%B7%E5%8F%96%E6%96%B0%E7%9A%84%E8%BF%9C%E7%A8%8B%E5%88%86%E6%94%AF)
  * [创建远程分支](#%E5%88%9B%E5%BB%BA%E8%BF%9C%E7%A8%8B%E5%88%86%E6%94%AF)
  * [删除本地分支](#%E5%88%A0%E9%99%A4%E6%9C%AC%E5%9C%B0%E5%88%86%E6%94%AF)
  * [删除远端分支](#%E5%88%A0%E9%99%A4%E8%BF%9C%E7%AB%AF%E5%88%86%E6%94%AF)
  * [查看所有branch分支](#%E6%9F%A5%E7%9C%8B%E6%89%80%E6%9C%89branch%E5%88%86%E6%94%AF)
  * [submodule](#submodule)
  * [pre-commit flake8](#pre-commit-flake8)
  * [修改commit msg](#%E4%BF%AE%E6%94%B9commit-msg)
  * [merge](#merge)

<!-- tocstop -->
# git-cmd
## 本地目录创建远端分支
```
git init
git add .
git commit -m "init git"
git remote add origin git@github.com:linchuan1982/web.git
git push -u origin master
```

## 初始化配置
```
git config user.name linchuan1982   
git config user.email linchuan@hunch.ai  
```

## reset checkout 和 revert
| reset | checkout | revert
|  - |  - |  -
|   命令 | 作用域 | 常用情景
| git reset | 提交层面 | 在私有分支上舍弃一些没有提交的更改
| git reset| 文件层面 | 将文件从缓存区中移除
| git checkout |        提交层面 |      切换分支或查看旧版本
| git checkout |        文件层面 |      舍弃工作目录中的更改
| git revert |  提交层面 |      在公共分支上回滚更改
| git revert |  文件层面 |      （然而并没有）


https://gitbook.tw/chapters/using-git/reset-commit.html

https://github.com/geeeeeeeeek/git-recipes/wiki/5.2-%E4%BB%A3%E7%A0%81%E5%9B%9E%E6%BB%9A%EF%BC%9AReset%E3%80%81Checkout%E3%80%81Revert-%E7%9A%84%E9%80%89%E6%8B%A9



## pre-commit


`$ flake8 --install-hook git`

`$ git config --bool flake8.strict true`


## git fetch origin branchname:branchname

可以把远程某各分支拉去到本地的branchname下，如果没有branchname，则会在本地新建branchname


## 获取新的远程分支
`git checkout origin/remoteName -b localName`

获取远程分支remoteName 到本地新分支localName，并跳到localName分支

## 创建远程分支
1. 创建本地分支
`$ git checkout -b localName`

2. 创建远程分支
`git push origin loaclName:remoteName`
注意:左右不能有空格

[TOP](#git-cmd)

## 删除本地分支  
`git branch -D branch_name`

## 删除远端分支  
`git push origin --delete branch_name`

## 查看所有branch分支
`git branch -a`

[TOP](#git-cmd)

## submodule
**要在git根目录执行，比如说aishipin**

    git submodule init
    git submodule update
    git submodule deinit --all



## pre-commit flake8


`$ flake8 --install-hook git`

`$ git config --bool flake8.strict true`

## 修改commit msg   
`git commit --amend`  

## merge
```
git merge --no-commit --no-ff master
git merge feature/login
```

### merge特定commit
```
    git cherry-pick 62ecb3
```

### reset added
```
git reset HEAD 指定文件
git reset HEAD aivideo/social/migrations/0001_initial.py
```

    
[TOP](#git-cmd)

