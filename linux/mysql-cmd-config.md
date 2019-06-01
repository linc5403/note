# MYSQL cmd and configuration
<!-- toc -->

- [1. 数据库](#1-%E6%95%B0%E6%8D%AE%E5%BA%93)
  * [1.1 创建](#11-%E5%88%9B%E5%BB%BA)
  * [1.2 删除](#12-%E5%88%A0%E9%99%A4)
  * [1.3 选择数据库](#13-%E9%80%89%E6%8B%A9%E6%95%B0%E6%8D%AE%E5%BA%93)
  * [1.4 查询有哪些数据库](#14-%E6%9F%A5%E8%AF%A2%E6%9C%89%E5%93%AA%E4%BA%9B%E6%95%B0%E6%8D%AE%E5%BA%93)
  * [1.5 查看连接的session](#15-%E6%9F%A5%E7%9C%8B%E8%BF%9E%E6%8E%A5%E7%9A%84session)
- [2. 表](#2-%E8%A1%A8)
  * [2.1 查看有哪些表](#21-%E6%9F%A5%E7%9C%8B%E6%9C%89%E5%93%AA%E4%BA%9B%E8%A1%A8)
  * [2.2 查看表的描述](#22-%E6%9F%A5%E7%9C%8B%E8%A1%A8%E7%9A%84%E6%8F%8F%E8%BF%B0)
  * [2.3 更新/修改字段](#23-%E6%9B%B4%E6%96%B0%E4%BF%AE%E6%94%B9%E5%AD%97%E6%AE%B5)
  * [2.4 查看第一个和最后一个项](#24-%E6%9F%A5%E7%9C%8B%E7%AC%AC%E4%B8%80%E4%B8%AA%E5%92%8C%E6%9C%80%E5%90%8E%E4%B8%80%E4%B8%AA%E9%A1%B9)
  * [2.6 修改field类型](#26-%E4%BF%AE%E6%94%B9field%E7%B1%BB%E5%9E%8B)
  * [2.7 增加字段](#27-%E5%A2%9E%E5%8A%A0%E5%AD%97%E6%AE%B5)
  * [2.8 创建新表](#28-%E5%88%9B%E5%BB%BA%E6%96%B0%E8%A1%A8)
  * [2.9 修改field名称](#29-%E4%BF%AE%E6%94%B9field%E5%90%8D%E7%A7%B0)
  * [2.10 增加row行](#210-%E5%A2%9E%E5%8A%A0row%E8%A1%8C)
- [3. 创建用户](#3-%E5%88%9B%E5%BB%BA%E7%94%A8%E6%88%B7)
- [4. 查询](#4-%E6%9F%A5%E8%AF%A2)
  * [计数count](#%E8%AE%A1%E6%95%B0count)
  * [去重distinct](#%E5%8E%BB%E9%87%8Ddistinct)
- [5. 迁移 修改数据库data目录](#5-%E8%BF%81%E7%A7%BB-%E4%BF%AE%E6%94%B9%E6%95%B0%E6%8D%AE%E5%BA%93data%E7%9B%AE%E5%BD%95)

<!-- tocstop -->
## 1. 数据库  
### 1.1 创建  
**create database** *test_db*;
### 1.2 删除  
**drop database** *test_db*;  
### 1.3 选择数据库
**use** *test_db*;  
### 1.4 查询有哪些数据库  
**show databases**  
### 1.5 查看连接的session  
`mysql> show processlist;`

[TOP](#MYSQL-cmd-and-configuration)
## 2. 表
### 2.1 查看有哪些表
**show tables**;
### 2.2 查看表的描述
**desc** *talbe-name*
### 2.3 更新/修改字段
`update asset_huazi set category='动态贴图' where type = 'animate_huazi';`
`update asset_huazi set category='静态贴图' where type = 'static_huazi';`

### 2.4 查看第一个和最后一个项
```
第一条记录
mysql> select * from apple LIMIT 1;
默认升序，等价于

mysql> select * from apple order by asc id LIMIT 1;
最后一条记录

mysql> select * from apple order by id desc LIMIT 1;
```

**更新表** 
```
update <table-name> set <field-name> where <filter>;
```

### 2.6 修改field类型

```
ALTER TABLE account MODIFY cell VARCHAR(20);
ALTER TABLE account MODIFY cell VARCHAR(20) NOT NULL;
```

### 2.7 增加字段

```
ALTER TABLE account ADD COLUMN expiryTime DATETIME;
```

### 2.8 创建新表

```
CREATE TABLE toto_platforms ( name VARCHAR(40) NOT NULL, id int NOT NULL, platStatus INT NOT NULL, type INT NOT NULL, autuUrl VARCHAR(100), );
```

### 2.9 修改field名称
```
ALTER TABLE toto_platforms CHANGE autuUrl authUrl VARCHAR(100);
```

[TOP](#MYSQL-cmd-and-configuration)

### 2.10 增加row行
```
INSERT INTO tbl_name
    (a,b,c)
VALUES
    (1,2,3),
    (4,5,6),
    (7,8,9);

```

## 3. 创建用户

sudo mysql -u root

```
use mysql

MariaDB [mysql]> CREATE USER 'hunch'@'%' IDENTIFIED BY 'asdf1234';
Query OK, 0 rows affected (0.00 sec)

MariaDB [mysql]> GRANT ALL PRIVILEGES ON *.* TO 'hunch'@'%';
Query OK, 0 rows affected (0.00 sec)

MariaDB [mysql]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)
```

[TOP](#MYSQL-cmd-and-configuration)

## 4. 查询

### 计数count

```
select count(*) from table
```

### 去重distinct
```
select distinct(file_type) form asset_userasset;
```

[TOP](#MYSQL-cmd-and-configuration)
## 5. 迁移 修改数据库data目录
    /etc/mysql/my.cnf
```
[mysqld]
datadir         = /data/mysql
bind-address    = 0.0.0.0
```
```
sudo cp -pr /var/lib/mysql /data/mysql
sudo chown -R mysql:mysql /data/mysql
```
```
sudo rsync -av /var/lib/mysql /data
```
```
sudo /etc/init.d/mysql restart
```

[TOP](#MYSQL-cmd-and-configuration)


## 6. 字符集

```
[mysqld]
datadir         = /data/mysql
bind-address    = 0.0.0.0
character-set-server = utf8mb4
```

