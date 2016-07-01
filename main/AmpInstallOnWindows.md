# Apache、MySQL、PHP在Windows上的安装
## 一. 下载 
### VC11
1. 首先安装VC11(vc2012语言包)。
2. 地址：http://download.microsoft.com/download/9/C/D/9CD480DC-0301-41B0-AAAB-FE9AC1F60237/VSU4/vcredist_x64.exe
### Apache 2.4.20
1. 由于现在Apache本身不再提供已编译的安装包，只提供源码，如果你自己无法编译，可以选择官方推荐的第三方提供编译的网站，这里使用ApacheHaus第三方提供安装包。  
2. 地址：http://www.apachehaus.com/cgi-bin/download.plx#APACHE24VC11
3. 包含：with OpenSSL 1.0.2h, nghttp 1.9.2, Zlib 1.2.8, PCRE 8.38, APR 1.5.2, APR-Util 1.5.4, IPv6 and TLS SNI enabled  
4. 文件：httpd-2.4.20-x64-vc11-r2.zip
### MySQL 5.6.31
1. 地址：http://dev.mysql.com/downloads/file/?id=463025
2. 文件：mysql-5.6.31-winx64.zip
### PHP 5.6.22
1. 地址：http://windows.php.net/download#php-5.6
2. 文件：php-5.6.22-Win32-VC11-x64
## 二. 解压
1. D:\Apache24  
解压后出现D:\readme_first.html文件，需看下。
2. D:\mysql-5.6.31
3. D:\php-5.6.22
## 三. 在环境变量PATH中添加bin目录
1. D:\Apache24\bin
2. D:\mysql-5.6.31\bin
## 四. 修改配置文件
### Apache：D:\Apache24\conf\httpd.conf  
1. Define SRVROOT "/Apache24" => Define SRVROOT "D:/Apache24"
2. Listen 80 => Listen 8088
Apache默认监听80端口，如果该端口其它服务占用，Apache将无法正常启动。
3. ServerName localhost:80 => ServerName localhost:8088
4. DirectoryIndex index.html => DirectoryIndex index.html index.php
5. 添加：  
LoadModule php5_module "D:/php-5.6.22/php5apache2_4.dll"  
AddType application/x-httpd-php .php  
AddType application/x-httpd-php .html  
PHPIniDir "D:/php-5.6.22"  
### MySQL：D:\mysql-5.6.31\my.ini(D:\mysql-5.6.31\my-default.ini的副本)
1. # basedir = => basedir = D:\mysql-5.6.31
2. # datadir = => datadir = D:\mysql-5.6.31\data
### PHP：D:\php-5.6.22\php.ini(D:\php-5.6.22\php.ini-development的副本)
1. doc_root = => doc_root = "D:\Apache24\htdocs"
2. ; extension_dir = "ext" => extension_dir = "D:\php-5.6.22\ext"
3. ;extension=php_mysqli.dll => extension=php_mysqli.dll
## 五. 安装服务
### 将Apache安装为系统的一个服务
    httpd -k install
    net start apache2.4
> 1. 需要以管理员身份启动命令行窗口。  
> 2. ApacheMonitor工具可用于启动、关闭和重启服务。
### 将MySQL安装为系统的一个服务 
    cd D:/mysql-5.6.31/bin
    mysqld -install
    net start mysql
    mysql -u root
> 1. 需要以管理员身份启动命令行窗口。  
> 2. 在安装mysql服务时，一定要切换到mysql安装目录的bin目录下，不管你是否配置环境变量。否则会报错：发生系统错误 2。系统找不到指定的文件。 
> 3. 安装完成后，root登录无需密码，需要设置密码：mysqladmin -u root password
> 4. 有密码后，修改密码：mysqladmin -u root -p password
> 5. mysqladmin程序仅用户数据库的管理，执行数据库的管理命令，不是连接数据库，连接数据库使用mysql程序。
> 6. 连接数据库：mysql -u root -p 或者 mysql -u root --password=mypassword，不推荐在命令行中显示的输密码。
## 六. 验证
新增PHP文件：D:\Apache24\htdocs\index.php

    <?php phpinfo(); ?>

## 七. 参考文档
http://jingyan.baidu.com/article/7908e85c9c5227af481ad2f7.html