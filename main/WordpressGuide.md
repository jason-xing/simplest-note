# Wordpress指南
## 一. Wordpress使用
### 知识点
1. Page编辑中，Permalink中不能有中文，否则前台出现：  
It looks like nothing was found at this location. Maybe try a search?
或报404错误。
2. 出现关于图片的报错，如：there was been an error cropping your image。  
考虑启用GD功能，启用方式为：将配置文件php.ini中的extension=php_gd2.dll行的注解去掉。
3. Customize按钮用于定制网站的配置等，会进入到各个主题的专用配置页面。
4. Dashboard是后台主界面。
5. 安装下载新主题是报错：  
Download failed. There are no HTTP transports available which can complete the requested request.  
考虑启用php_openssl，启用方式为：将配置文件php.ini中的;extension=php_curl.dll行的注解去掉。
6. 主题设置(以Optimizer主题为例)：  
<1>. BASIC：针对站点全局设置，如全站布局、基本样式、基本字体、站点标识等。
![Basic](http://i.imgur.com/WKTWD1R.jpg)  
<2>. HEADER：头部、站点名称和Logo、菜单。  
![Header](http://i.imgur.com/rsmB1w6.jpg)  
<3>. FRONT PAGE：这个很重要，是首页主页面的内容部分。  
![FrontPage](http://i.imgur.com/E4Tiak5.jpg)  
<4>. FOOTER：页脚。  
![Footer](http://i.imgur.com/OWKDrRx.jpg)  
其实，每个主题的这些设置是不一样的。但大体的概念都有Basic(含SiteIdentiy)，FrontPage, Header, Footer, Menus, Widgets等，含义也一样。
7. 点击网站标题/DashBoard可以看到使用wordpress管理界面，一般用它即可，也通用；点击Customize可以看到所选择的Theme的管理界面，对于该Theme的特殊组件和特性，用它更方便些。  
8. Menu Settings中有一个复选框Navigation Menu用来显示导航菜单。
9. Menu Structure可以控制菜单的顺序以及分层等。
10. Theme由若干的Template文件(.php文件)组成，共同的结果，形成一个Theme。
11. 几个官方文档要看：  
<1>. Pages：https://codex.wordpress.org/Pages。  
<2>. Creating a Static Front Page：https://codex.wordpress.org/Creating_a_Static_Front_Page。  
<3>. Theme Development：https://codex.wordpress.org/Theme_Development。以下摘要较好：  
A. WordPress Themes are files that work together to create the design and functionality of a WordPress site. Each Theme may be different, offering many choices for site owners to instantly change their website look.  
B. WordPress Themes typically consist of three main types of files, in addition to images and JavaScript files.  
a. The stylesheet called style.css, which controls the presentation (visual design and layout) of the website pages.  
b. WordPress template files which control the way the site pages generate the information from your WordPress database to be displayed on the site.  
c. The optional functions file (functions.php) as part of the WordPress Theme files.  
C. Templates are PHP source files used to generate the pages requested by visitors, and are output as HTML. Template files are made up of HTML, PHP, and WordPress Template Tags.  
D. Template Files List、Basic Templates、部分很重要。  
<4>. Template Hierarchy：https://developer.wordpress.org/themes/basics/template-hierarchy/
12. 页面和文章一样也是在数据库中存放的。
13. 在Page List中，子页面在父页面的下面层级，并且，Permalink(Slug)会在父页面的Permalink(Slug)的下面加上自己的标识。
14. page.php是Page的模板文件。
15. 修改为简体中文，在设置-常规-站点语言设置为中文简体。
16. 页面布局几个关键的模板文件：header.php, footer.php, sidebar.php, content.php等。


