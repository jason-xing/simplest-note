# Apache配置
## 一. 虚拟主机配置
### Apache：D:\Apache24\conf\httpd.conf  
1. 启用apache的虚拟主机功能
\#LoadModule vhost_alias_module modules/mod_vhost_alias.so -> LoadModule vhost_alias_module modules/mod_vhost_alias.so  
2. 包含虚拟主机配置文件
\#Include conf/extra/httpd-vhosts.conf -> Include conf/extra/httpd-vhosts.conf
3. 修改根目录权限(如不修改会报错：You don't have permission to access / on this server.)

```
<Directory />
    AllowOverride none
    Require all denied
</Directory>
```

修改为：

```
<Directory />
    AllowOverride none
</Directory>
```

### Apache：D:\Apache24\conf\extra\httpd-vhosts.conf
```
#<VirtualHost *:80>
#    ServerAdmin webmaster@dummy-host.example.com
#    DocumentRoot "${SRVROOT}/docs/dummy-host.example.com"
#    ServerName dummy-host.example.com
#    ServerAlias www.dummy-host.example.com
#    ErrorLog "logs/dummy-host.example.com-error.log"
#    CustomLog "logs/dummy-host.example.com-access.log" common
#</VirtualHost>

#<VirtualHost *:80>
#    ServerAdmin webmaster@dummy-host2.example.com
#    DocumentRoot "${SRVROOT}/docs/dummy-host2.example.com"
#    ServerName dummy-host2.example.com
#    ErrorLog "logs/dummy-host2.example.com-error.log"
#    CustomLog "logs/dummy-host2.example.com-access.log" common
#</VirtualHost>
```

注释去掉：

```
<VirtualHost *:80>
    ServerAdmin webmaster@dummy-host.example.com
    DocumentRoot "${SRVROOT}/docs/dummy-host.example.com"
    ServerName dummy-host.example.com
    ServerAlias www.dummy-host.example.com
    ErrorLog "logs/dummy-host.example.com-error.log"
    CustomLog "logs/dummy-host.example.com-access.log" common
</VirtualHost>

<VirtualHost *:80>
    ServerAdmin webmaster@dummy-host2.example.com
    DocumentRoot "${SRVROOT}/docs/dummy-host2.example.com"
    ServerName dummy-host2.example.com
    ErrorLog "logs/dummy-host2.example.com-error.log"
    CustomLog "logs/dummy-host2.example.com-access.log" common
</VirtualHost>
```
