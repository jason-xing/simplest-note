> Markdown Processor: GitHub Flavored Markdown (Offline)

# Apache配置
## 一. 主配置文件介绍
### D:\Apache24\conf\httpd.conf
1. 三部分  
Global Environment：全局环境配置，决定Apache服务器的全局参数。
Main' server configuration：主(实际、一般)服务器配置，对后面的虚拟服务器也起作用，但可能会被后面的覆盖。
Supplemental configuration：其它配置。
2. 关键配置
DocumentRoot：网页文件存放目录。
ServerName：默认是不需要指定的，服务器通过名字解析过程来获得自己的名字，但如果解析有问题（如反向解析不正确），或者没有DNS名字，也可以在这里指定IP地址，当这项不正确的时候服务器不能正常启动。
Directory：仅是对目录的权限的设置。


## 二. 虚拟主机配置
### 主配置文件(D:\Apache24\conf\httpd.conf)
1. 启用apache的虚拟主机功能  
\#LoadModule vhost_alias_module modules/mod_vhost_alias.so => LoadModule vhost_alias_module modules/mod_vhost_alias.so  
2. 包含虚拟主机配置文件  
\#Include conf/extra/httpd-vhosts.conf => Include conf/extra/httpd-vhosts.conf
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
    #    Require all denied  
    </Directory>
```

### 虚拟主机配置文件(D:\Apache24\conf\extra\httpd-vhosts.conf)
1. 删除注解
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
2. 监听端口修改为8088
```
    <VirtualHost *:8088>
        ServerAdmin webmaster@dummy-host.example.com
        DocumentRoot "${SRVROOT}/docs/dummy-host.example.com"
        ServerName dummy-host.example.com
        ServerAlias www.dummy-host.example.com
        ErrorLog "logs/dummy-host.example.com-error.log"
        CustomLog "logs/dummy-host.example.com-access.log" common
    </VirtualHost>
    <VirtualHost *:8088>
        ServerAdmin webmaster@dummy-host2.example.com
        DocumentRoot "${SRVROOT}/docs/dummy-host2.example.com"
        ServerName dummy-host2.example.com
        ErrorLog "logs/dummy-host2.example.com-error.log"
        CustomLog "logs/dummy-host2.example.com-access.log" common
    </VirtualHost>
```

### DNS配置
以Windows 10为例，C:\Windows\System32\drivers\etc\hosts添加：
```
    127.0.0.1       dummy-host.example.com
    127.0.0.1       dummy-host2.example.com
```