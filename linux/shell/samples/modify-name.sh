#!/usr/bin/env sh

# 9开头的文件名修改为09开头

for i in `ls 9*`
do 
  mv $i "0$i"
done
