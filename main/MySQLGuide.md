> Markdown Processor: GitHub Flavored Markdown (Offline)

# MySQL指南
## 一. 创建用户和数据库
```
// 创建用于本地localhost连接的用户并指定密码
create user 'test'@'localhost' identified by '123456';
// 创建数据库
create database test_db character set utf8;
// 给本地用户授权, 这里不需要指定密码
grant all on test_db.* to 'test'@'localhost';
// 给任意主机登陆的用户授权, 注意: 这里必须指定密码, 否则就可以无密码访问
grant all on test_db.* to 'test'@'%' identified by '123456';
```