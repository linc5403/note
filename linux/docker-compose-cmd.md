# docker compose cmd

```
docker-compose up #启动所有容器 
docker-compose up -d #后台启动并运行所有容器 
docker-compose up --no-recreate -d #不重新创建已经停止的容器 
docker-compose up -d test2 #只启动test2这个容器 
docker-compose stop #停止容器 
docker-compose start #启动容器 
docker-compose down #停止并销毁容器
```
    docker-compose.yaml
```
version: "0.1"
services:
    test1: 
        image: "10.8.52.225:5000/base:v1.2.1_autoserver" 
        ports: 
            - "1022:22" 
            - "1080:80" 
        volumes: 
            - /work/test1:/work 
        dns: 
            - 10.1.2.9 
            - 10.1.2.70 
        hostname: test1 
    test2: 
        image: "10.8.52.225:5000/base:v1.2.1_autoserver" 
        ports: 
            - "1023:22" 
        volumes: 
            - /work/test2:/work 
        dns: 10.1.2.9 
        hostname: test2 
        links: 
            - els1:db
```


### compose 不退出
Docker镜像的缺省命令是`bash`，如果不加`-it`,`bash`命令执行了自动会退出，加`-it`后docker命令会为容器分配一个伪终端，并接管其`stdin/stdout`支持交互操作，这时候`bash`命令不会自动退出

像不使用`docker-compose`,我们会执行类似如下的命令

`docker run -it --name node node`

但`docker-compose`需要额外配置下

需要在`docker-compose.yml`中包含以下行:

```
stdin_open: true  
tty: true  
```
第一个对应于`docker run`中的 -i ,第二个对应于 -t .
