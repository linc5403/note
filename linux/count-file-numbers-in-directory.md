# count file numbers in directory
[Linux统计文件夹下的文件数目 \\| SnailTyan](http://noahsnail.com/2017/02/07/2017-02-07-Linux%E7%BB%9F%E8%AE%A1%E6%96%87%E4%BB%B6%E5%A4%B9%E4%B8%8B%E7%9A%84%E6%96%87%E4%BB%B6%E6%95%B0%E7%9B%AE/)
```
$ ls -l | grep "^-" | wc -l
```
