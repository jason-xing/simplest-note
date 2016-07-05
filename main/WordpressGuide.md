
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
6. 主题设置(以Optimizer主题为例)：  
<1>. BASIC：针对站点全局设置，如全站布局、基本样式、基本字体、站点标识等。  
<2>. HEADER：头部、站点名称和Logo、菜单。  
<3>. FRONT PAGE：这个很重要，是首页主页面的内容部分。  
<4>. FOOTER：页脚。 
