vim build from source (mac)

./configure --prefix=/opt/local --with-features=huge --with-lua-prefix=/usr/local/Cellar/lua/5.3.5_1 --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-multibyte --enable-rubyinterp=yes --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope --enable-largefile --enable-fail-if-missing --enable-gui=gtk3


make VIMRUNTIMEDIR=/Users/linchuan/software/vim81    
这里需要建个快捷方式，ln -s /opt/local/share/vim/vim81 /Users/linchuan/software/vim81  

\\# 卸载源码安装的vim,下面替换成你已经装好的vim命令路径  
make VIMRUNTIMEDIR=/usr/local/vim8/bin/vim  
make uninstall
