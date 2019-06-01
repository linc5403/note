# 数据库常用命令
## 1. 建立数据库
**create database** *test-db*;
## 2. 查询服务器端的数据库
**show** *databases*;
## 3. 使用数据库
**mysql -D** *test-db*;  
mysql>**use** *test-db*;
## 4. 表
4.1 查看有哪些表  
**show tables**;  
4.2 查看表的描述  
**desc** *talbe-name*  
4.3 更新/修改字段  
`update asset_huazi set category='动态贴图' where type = 'animate_huazi';`  
`update asset_huazi set category='静态贴图' where type = 'static_huazi';`  

4.4 查看第一个和最后一个项
```
第一条记录
mysql> select * from apple LIMIT 1;
默认升序，等价于

mysql> select * from apple order by asc id LIMIT 1;
最后一条记录

mysql> select * from apple order by id desc LIMIT 1;
```

更新表
```
update <table-name> set <field-name> where <filter>;
```

## 5. 查询

### 计数count

```
select count(*) from table
```

### 去重distinct  
```
select distinct(file_type) form asset_userasset;
```  

