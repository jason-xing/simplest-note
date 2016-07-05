
# Wordpress指南
## 一. Wordpress使用
### 知识点
1. Page编辑中，Permalink中不能有中文，否则前台出现：  
It looks like nothing was found at this location. Maybe try a search?
2. 出现关于图片的报错，如：there was been an error cropping your image。  
考虑启用GD功能，启用方式为：  
将配置文件php.ini中的extension=php_gd2.dll行的注解去掉。
3. Customize按钮用于定制网站的配置等。
4. Dashboard是后台主界面。
5. 安装下载新主题是报错：  
Download failed. There are no HTTP transports available which can complete the requested request.  
考虑启用php_openssl，启用方式为：    
将配置文件php.ini中的;extension=php_curl.dll行的注解去掉。
