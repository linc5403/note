
# Table of Contents

1.  [shell命令](#org360ccc9)
2.  [shell命令示例](#org8ace447)
    1.  [查看文件夹下有多少个文件](#orgd7c26e6)
    2.  [salt的命令](#orge57781a)
    3.  [sed替换字符串](#org33b5f5e)
    4.  [awk 不打印某一列](#org3c5ae6a)
    5.  [打印占用内存高的进程](#org93ef113)
    6.  [删除特殊文件名的文件 - `rm --`](#orgb37c0db)
    7.  [设置系统编辑器](#org92f72e0)
    8.  [netstat](#orge95bcb2)
    9.  [后台执行(nohup)](#org8fe5c63)
    10. [删除所有指定目录](#org759e40e)
    11. [cp 大量文件](#org703e07c)
    12. [sort](#orgd6fffea)
    13. [awk](#orgd59c4a6)
    14. [ln -s](#orge94923a)
    15. [rsync](#org88fbe49)
    16. [删除指定日期之前的文件](#org1ce339e)
    17. [删除grep的结果](#org34a45bc)
    18. [macos下xargs参数](#org3cdb443)
    19. [linux下xargs带参数](#org2bc1d8b)
    20. [查看dns](#org4640b94)
    21. [统计目录下的文件个数](#orgc115e0e)



<a id="org360ccc9"></a>

# shell命令


<a id="org8ace447"></a>

# shell命令示例


<a id="orgd7c26e6"></a>

## 查看文件夹下有多少个文件

    ls -l | grep "^-" | wc -l


<a id="orge57781a"></a>

## salt的命令

    sudo salt 'minion' cmd.run "sudo docker exec -it  zhiying-worker-main bash -c 'pip install --upgrade youtube-dl'


<a id="org33b5f5e"></a>

## sed替换字符串

    find ./ -type f -exec sed -i "s/com.tianmaying/club.banyuan/g" {} \;


<a id="org3c5ae6a"></a>

## awk 不打印某一列

    history| grep "sed" | grep -v "history" | awk '{$1 = ""; print $0}'


<a id="org93ef113"></a>

## 打印占用内存高的进程

    ps auxf | sort -nr -k 3 | head -5 | awk '{$1 = ""; $2 = ""; for (i=4; i < 12; i++) $i=""; print $0}'


<a id="orgb37c0db"></a>

## 删除特殊文件名的文件 - `rm --`

    rm -- -df

    linc@pop-os:~$ ls
    agenda       c           docs          go        Public     Videos
    banyuan      config      Documents     HomeWork  python
    banyuan-bak  c-projects  Downloads     Music     software
    blog         Desktop     ds            note      temp
    books        -df         emacs_config  Pictures  Templates
    linc@pop-os:~$ rm -df
    linc@pop-os:~$ ls
    agenda       c           docs          go        Public     Videos
    banyuan      config      Documents     HomeWork  python
    banyuan-bak  c-projects  Downloads     Music     software
    blog         Desktop     ds            note      temp
    books        -df         emacs_config  Pictures  Templates
    linc@pop-os:~$ rm -- -df
    linc@pop-os:~$ ls
    agenda       books       Desktop    ds            Music     python     Videos
    banyuan      c           docs       emacs_config  note      software
    banyuan-bak  config      Documents  go            Pictures  temp
    blog         c-projects  Downloads  HomeWork      Public    Templates

[返回顶部](#org360ccc9)


<a id="org92f72e0"></a>

## 设置系统编辑器

    sudo update-alternatives --config editor


<a id="orge95bcb2"></a>

## netstat

    netstat -lntp

    $sudo netstat -tulpen | grep 1081
    tcp        0      0 0.0.0.0:1081            0.0.0.0:*               LISTEN		13         41905719   68152/polipo

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">parameter</th>
<th scope="col" class="org-left">meaning</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">a</td>
<td class="org-left">all</td>
</tr>


<tr>
<td class="org-left">t</td>
<td class="org-left">tcp</td>
</tr>


<tr>
<td class="org-left">u</td>
<td class="org-left">udp</td>
</tr>


<tr>
<td class="org-left">n</td>
<td class="org-left">port number</td>
</tr>


<tr>
<td class="org-left">l</td>
<td class="org-left">listening</td>
</tr>


<tr>
<td class="org-left">p</td>
<td class="org-left">program</td>
</tr>


<tr>
<td class="org-left">e</td>
<td class="org-left">extend (additional infomation)</td>
</tr>
</tbody>
</table>

[返回顶部](#org360ccc9)


<a id="org8fe5c63"></a>

## 后台执行(nohup)

    nohup cmd  > /dev/null &


<a id="org759e40e"></a>

## 删除所有指定目录

    find /test/subtest -type d -name '.svn' -exec rm -rf {} \;


<a id="org703e07c"></a>

## cp 大量文件

    sudo find source/ -type f -name "*.jpg" -exec cp {} target \;

-   linux
    
        find ./ -type f -exec cp {} ../2 \;


<a id="orgd6fffea"></a>

## sort

    sort -k14,14n -k15,15n  


<a id="orgd59c4a6"></a>

## awk

    docker ps | grep 'zhiying-web' | awk {'print $1'}  
    kill -9 ` ps -e | grep salt | awk 'NR==1 {print $1}' `  


<a id="orge94923a"></a>

## ln -s

`ln -s` 已经有的 快捷方式

    ln -s source shortcut


<a id="org88fbe49"></a>

## rsync

    sync -aP --rsh=ssh  hunch@40.73.33.137:/data/temp/mp4/finished ./new
    rsync -aP --rsh=ssh --include="*.mp4" --exlude=* hunch@40.73.33.137:/data/temp/mp4/finished ~/temp/
    sshpass -p remotepasswd rsync -avz --delete local_dir -e ssh remoteuser@192.168.5.38:remote_dir  
    rsync -aP --rsh=ssh --include="*.mp4" --exclude="*.part" test3:/data/temp/ ./finished

-   `-S, --sparse` 对稀疏文件进行特殊处
-   `-P` 等同于 `--partial --progress` 显示备份过程
-   `-v, --verbose` 详细模式输出
-   `--rsh=COMMAND` 指定使用rsh、ssh方式进行数据同步
-   `-x, --one-file-system` 不要跨越文件系统边界
-   `-z` 传输时压缩

[返回顶部](#org360ccc9)


<a id="org1ce339e"></a>

## 删除指定日期之前的文件

\#+begin<sub>example</sub>
  find Asynctask/ -mtime +92 -type f -exec sudo rm -f {} \\;
\#+end<sub>example</sub>\`\`\`

-   文件的Access time，atime 是在读取文件或者执行文件时更改的。
-   文件的 Modified time，mtime 是在写入文件时随文件内容的更改而更改的。
-   文件的 Create time，ctime 是在写入文件、更改所有者、权限或链接设置时随 Inode 的内容更改而更改的。


<a id="org34a45bc"></a>

## 删除grep的结果

    git status | grep aivideo | xargs rm -rf


<a id="org3cdb443"></a>

## macos下xargs参数

    ls -l | grep -v "^d" | grep docker | awk '{print $NF}' | xargs -I {} mv {} docker


<a id="org2bc1d8b"></a>

## linux下xargs带参数

    find ./ -maxdepth 1 -type f | grep -v "^\./\." | xargs -i mv {} test


<a id="org4640b94"></a>

## 查看dns

    cat /etc/resolv.conf 

[返回顶部](#org360ccc9)


<a id="orgc115e0e"></a>

## 统计目录下的文件个数

    ls -l |grep "^-"|wc -l
    ls -lR|grep "^-"|wc -l

