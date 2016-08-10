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
8. 关于菜单  
<1>. 基本操作：新建一个菜单，如Menu1，然后在"菜单结构"中定义该菜单的菜单项(可以是页面、文章、自定义链接、分类目录)，添加、删除、排序菜单项，可以在"菜单设置"中设置在主题中的显示位置为Naviagtion Menu。  
<2>. 基本思路为：新建菜单，定义菜单项，设置菜单在主题中的显示位置等。
9. Menu Structure可以控制菜单的顺序以及分层等。
10. Theme由若干的Template文件(.php文件)组成，共同的结果，形成一个Theme。
11. 页面和文章一样也是在数据库中存放的。
12. 在Page List中，子页面在父页面的下面层级，并且，Permalink(Slug)会在父页面的Permalink(Slug)的下面加上自己的标识。
13. page.php是Page的模板文件。
14. 修改为简体中文，在设置-常规-站点语言设置为中文简体。
15. 页面布局几个关键的模板文件：header.php, footer.php, sidebar.php, content.php等。

## 二. 几个官方文档要看：  
1. **Pages**  
https://codex.wordpress.org/Pages  
<1>. Page和Post的区别。  
<2>. 像Post可以放到Category中实现分类一样，Page也可以实现父子的层次结构，设定后，页面的导航标题中会显示层级。  
<3>. 可以更改Page的URL。  
<4>. 使用模板标签wp\_list\_pages()可以将一个Page列表放到页面的sidebar或footer上。  
<5>. Almost everything in WordPress is generated dynamically, including Pages. Everything published in WordPress (Posts, Pages, Comments, Blogrolls, Categories, etc...) is stored in the MySQL database. When the site is accessed, the database information is used by your WordPress Templates from your current Theme to generate the web page being requested.  
<6>. 可以重新定义一个Page Template，覆盖掉原来的page.php模板文件。  
<7>. Wordpress是动态网页展示的，如果修改为静态网页，则主题和模板就没有用武之地了，不过，现在的技术，如pseudo-static，可先对动态网页生成静态网页，用户可直接看静态网页即可。  
2. **Creating a Static Front Page**  
https://codex.wordpress.org/Creating\_a\_Static\_Front\_Page  
<1>. WordPress Static Front Page Process小节。  
<2>. Creating a Static Front Page小节。  
<3>. Theme Development for Custom Front Page Templates小节。  
<4>. Blog Posts Index Page Template: home.php; Site Front Page Template: front-page.php或A Custom Page Template。  
3. **Theme Development**  
https://codex.wordpress.org/Theme_Development。以下摘要较好：  
<1>. WordPress Themes are files that work together to create the design and functionality of a WordPress site. Each Theme may be different, offering many choices for site owners to instantly change their website look.  
<2>. WordPress Themes typically consist of three main types of files, in addition to images and JavaScript files.  
A. The stylesheet called style.css, which controls the presentation (visual design and layout) of the website pages.  
B. WordPress template files which control the way the site pages generate the information from your WordPress database to be displayed on the site.  
C. The optional functions file (functions.php) as part of the WordPress Theme files.  
<3>. Templates are PHP source files used to generate the pages requested by visitors, and are output as HTML. Template files are made up of HTML, PHP, and WordPress Template Tags.  
<4>. Template Files List、Basic Templates部分很重要。  
4. **Template Hierarchy**  
https://developer.wordpress.org/themes/basics/template-hierarchy/


