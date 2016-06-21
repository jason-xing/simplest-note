# Apache、MySQL、PHP在Windows上的安装
## Apache的安装
### 参考文档
http://jingyan.baidu.com/article/29697b912f6539ab20de3cf8.html  
### 下载
1. 由于现在Apache本身不再提供已编译的安装包，只提供源码，如果你自己无法编译，可以选择官方推荐的第三方提供编译的网站，这里使用ApacheHaus第三方提供安装包。
1. http://httpd.apache.org
2. Apache httpd 2.4.20 Released / Download / Files for Microsoft Windows / ApacheHaus
3. http://www.apachehaus.com/cgi-bin/download.plx
4. **Version:** Apache 2.4.x VC11 / Apache 2.4.20 x64  
   **Includes:** with OpenSSL 1.0.2h, nghttp 1.9.2, Zlib 1.2.8, PCRE 8.38, APR 1.5.2, APR-Util 1.5.4, IPv6 and TLS SNI enabled  
   **File:** httpd-2.4.20-x64-vc14-r2.zip
### 解压
1. readme_first.html需看下。
2. Apache24拷贝到安装目录下，如D盘，则为D:\Apache24。
### 在PATH中添加bin目录
### 安装为系统的一个服务

    httpd -k install
### 使用ApacheMonitor

    ApacheMonitor
用于启动、关闭和重启服务。
### 问题总结
1. 默认端口被占用  
Apache默认监听80端口，如果该端口其它服务占用，Apache将无法正常启动。  
如需要，可修改默认端口，编辑配置文件conf\httpd.conf，Listen 80 -> Listen 8088。 然后重启服务。