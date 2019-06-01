# docker cmd

docker info | grep 'Docker Root Dir'
docker rmi
docker rm
docker search
docker run
docker pull
docker commit -m "added Node.js" -a "sammy" d9b100f2f636 sammy/ubuntu-nodejs
docker run -dit --name os centos
docker exec -it CONTAINER_ID sh
docker build -f /path/to/dockerfile -t nginx:v3 .
docker build -f ~/docker/p3_web/Dockerfile -t linchuan/p3-web /data/code
docker build [选项] <上下文路径/URL/->

## 删除
docker image prune
docker container prune
**docker system prune -a**
**docker system df**


##copy

```
docker cp /opt/test/file.txt mycontainer：/opt/testnew/
docker cp mycontainer：/opt/testnew/file.txt /opt/test/
```

