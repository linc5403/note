# dev-environment

## 使用方法

1. 安装docker和docker-compose

> docker-compose
>```
>sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
>
>sudo chmod +x /usr/local/bin/docker-compose
>```


2. `.env`文件中指定aishipin绝对路径  
3. 使用阿里云容器仓库账号登陆  
        ```
        docker login --username=xxxxxxx registry.cn-hangzhou.aliyuncs.com
        ```  
        passwd: `xxxxxxx`  
4. 启动容器  
        ```
        docker-compose up -d  
        ```
## 对外接口

1. web 对外接口为8080(HTTPS), 8081(HTTP)

>在docker-compose中定义:
>```
>    ports:
>      - '8080:8080/tcp'
>      - '8081:8081/tcp'
>```
