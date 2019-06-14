#!/usr/bin/env sh

######################################################################
# @author      : linchuan (linch1982@gmail.com)
# @file        : mac-install
# @created     : Friday Jun 14, 2019 01:28:20 CST
#
# @description : install mac system 
######################################################################
function check_rlt() {
  if [ $? != 0 ]; then
    echo "install $step failed."
    exit -1
  fi
}

# for brew
step=brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
check_rlt

step=zsh
brew install zsh zsh-completions
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
check_rlt

step=zsh-completions
echo 'fpath=(/usr/local/share/zsh-completions $fpath)' >> $HOME/.zshrc
rm -f $HOME/.zcompdump && compinit
check_rlt

step=oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
check_rlt

step=oh-my-zsh-complete
git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
check_rlt

step=powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
check_rlt

step=tmux
brew install tmux
check_rlt

step=tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
check_rlt

step=vim
brew install lua
mkdir $HOME/software
git clone git@github.com:vim/vim.git $HOME/software/vim
cd $HOME/software
sudo mkdir /opt
sudo chown linchuan:linchuan /opt
mkdir -p /opt/local
./configure --prefix=/opt/local --with-features=huge --with-lua-prefix=/usr/local/Cellar/lua/5.3.5_1 --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-multibyte --enable-rubyinterp=yes --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope --enable-largefile --enable-fail-if-missing --enable-gui=gtk3
make VIMRUNTIMEDIR=/Users/linchuan/software/vim81
ln -s /opt/local/share/vim/vim81 /Users/linchuan/software/vim81
