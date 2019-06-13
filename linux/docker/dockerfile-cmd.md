# Dockerfile CMD
<!-- toc -->

- [RUN](#RUN)
- [CMD](#CMD)
- [创建一个数据卷](#%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E6%95%B0%E6%8D%AE%E5%8D%B7)
- [删除数据卷](#%E5%88%A0%E9%99%A4%E6%95%B0%E6%8D%AE%E5%8D%B7)

<!-- tocstop -->
## RUN
* shell 格式：  
RUN <命令>，就像直接在命令行中输入的命令一样。刚才写的 Dockerfile 中的 RUN 指令就是这种格式。  
`RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html`
* exec 格式：
RUN ["可执行文件", "参数1", "参数2"]，这更像是函数调用中的格式。


最佳实践

使用 RUN 指令安装应用和软件包，构建镜像。

如果 Docker 镜像的用途是运行应用程序或服务，比如运行一个 MySQL，应该优先使用 Exec 格式的 ENTRYPOINT 指令。
[top](#Dockerfile-CMD)
## CMD 
CMD 可为 ENTRYPOINT 提供额外的默认参数，同时可利用 docker run 命令行替换默认参数。

如果想为容器设置默认的启动命令，可使用 CMD 指令。用户可在 docker run 命令行中替换此默认命令。



* 建立 redis 用户，并使用 gosu 换另一个用户执行命令
`RUN groupadd -r redis && useradd -r -g redis redis`
* 下载 gosu
RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" /
    && chmod +x /usr/local/bin/gosu /
    && gosu nobody true
* 设置 CMD，并以另外的用户执行
CMD [ "exec", "gosu", "redis", "redis-server" ]

[top](#Dockerfile-CMD)

## 创建一个数据卷
`$ docker volume create my-vol`

* 启动一个挂载数据卷的容器
在用 docker run 命令的时候，使用 --mount 标记来将 数据卷 挂载到容器里。在一次 docker run 中可以挂载多个 数据卷。
下面创建一个名为 web 的容器，并加载一个 数据卷 到容器的 /webapp 目录。

```
$ docker run -d -P /
    --name web /
    # -v my-vol:/wepapp /
    --mount source=my-vol,target=/webapp /
    training/webapp /
    python app.py
```


[top](#Dockerfile-CMD)
## 删除数据卷
`$ docker volume rm my-vol`
数据卷 是被设计用来持久化数据的，它的生命周期独立于容器，Docker 不会在容器被删除后自动删除 数据卷，并且也不存在垃圾回收这样的机制来处理没有任何容器引用的 数据卷。如果需要在删除容器的同时移除数据卷。可以在删除容器的时候使用 docker rm -v 这个命令。

无主的数据卷可能会占据很多空间，要清理请使用以下命令

`$ docker volume prune`


[top](#Dockerfile-CMD)
