# 系统安装

<!-- vim-markdown-toc GFM -->

* [0. iterm](#0-iterm)
* [1. brew](#1-brew)
* [2. zsh](#2-zsh)
* [3. oh-my-zsh](#3-oh-my-zsh)
    * [3.0 zsh completion](#30-zsh-completion)
    * [3.1 powerlevel9k](#31-powerlevel9k)
* [4. tmux](#4-tmux)
    * [4.1 TPM（Tmux Plugin Manager）安装](#41-tpmtmux-plugin-manager安装)
* [5. brew 使用国内源](#5-brew-使用国内源)
    * [更新](#更新)
    * [重置](#重置)

<!-- vim-markdown-toc -->

## 0. iterm
software

## 1. brew

        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
    
## 2. zsh

        brew install zsh zsh-completions
        sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh



==\\> zsh-completions

To activate these completions, add the following to your .zshrc:

  

 fpath=(/usr/local/share/zsh-completions $fpath)

  

You may also need to force rebuild \\`zcompdump\\`:

  

 rm -f ~/.zcompdump; compinit

  

Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting to load these completions, you may need to run this:

 chmod go-w '/usr/local/share'


## 3. oh-my-zsh

        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        
### 3.0 zsh completion
    
   ##### [oh-my-zsh](http://github.com/robbyrussell/oh-my-zsh)

*   Clone the repository inside your oh-my-zsh repo:
    
          git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
        
    
*   Enable it in your`.zshrc`by adding it to your plugin list and reloading the completion:
    
          plugins=(… zsh-completions)
          autoload -U compinit && compinit

### 3.1 powerlevel9k

        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        
## 4. tmux

        brew install tmux
        
### 4.1 TPM（Tmux Plugin Manager）安装[](http://koyo922.github.io/2016/02/21/tmux/#tpmtmux-plugin-manager)

        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


## 5. brew 使用国内源


### 更新
```shell
cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
brew update
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
source ~/.zshrc\\n

```


### 重置

```
    cd "$(brew --repo)"
    git remote set-url origin https://github.com/Homebrew/brew.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git
    brew update

```
**注释掉zsh配置文件里的有关Homebrew Bottles即可恢复官方源。**



