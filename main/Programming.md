# 编程大全
## 编程规范
1. 遵循Java编码规范。
2. 一个编程约定：返回类型为List的方法，若没有数据，则返回一个size为0的空list，而不是返回null。其实，在Hibernate中，Session.find(sql)返回的List就是这样的。
3. 对有必要的Java代码一定要进行注解，如果代码已非常明了，就不用注解了。
4. Javadoc中@param、@throw等，能写的一定要写。句子以“.”结尾，短语无需“.”结尾。
5. 命名要尽量简短明了，单词能不用简写就不用简写，但对于常用简写的一定要用简写。
6. 文件夹命名，类似于Java中包的命名，要用小写，且尽量简短，能用缩写或截取尽量用缩写或截取。
7. 文件命名，HTML、CSS、images、JS等文件名暂定为小写，若由多个单词组成，则用中划线“-”分割。这是参考ExtJS文件命名、maven site生成的站点的文件得出的结论。JSP文件命名规则同Java类命名。
8. 开发文档等文档的名字使用Java类的命名方式。
9. 代码中，首字母拼起来的简写当成一个单词来看，该小写要小写，但在描述性文字中，要大写，比如数据库连接池，在代码中写为dbcp，但在代码注释中，要写为DBCP。  
Java程序中变量或参数的命名尽量不要包含变量或参数的类型，因为变量或参数的类型以后有可能会发生变化。
10. 类中方法名如果必须动词和名词一起使用，则尽量动在前名在后。dao类的名称约定以Dao结尾，而非DAO。
11. 注意项目的文件目录和结构，要好好考虑，最后稳定下来。
12. Java类文件不用tab键，只用空格，缩进4个空格。  
eclipse设置：Window/Preferences/Java/Code Style/Formatter，点击“Edit”，选项卡切换到“Indentation”，Tab only改为Space only，Indentation size和Tab size改为4。  
13. Java类源文件代码的字符宽度不超过80。  
右侧界线的eclipse设置：Window/Preferences/General/Editors-/Text Editors，Print margin column修改为80。  
14. 在写产品时，须遵守上面规定，但写项目时，在尽量遵守上面规定的同时，还要考虑到项目的特殊性，比如代码中有较长的sql，考虑程序的可读性，每行可以超过规定的字符个数。  
基于代码的可读性、行云流水是第一位的考虑，代码宽度放到100。另外，还有两个因素：  
1>. 我们用Java写的这种类型的项目，变量的名字相对C语言写的基础性项目，还是比较长的；  
2>. 我们现在的电脑显示器都是宽屏了，所以列数可以加大些。  
尽量遵循这它，但也不应拘泥于它，少数情况下，比如就差几个字母代码就搞一段落了，也可超100。  
最后，程序中的Javadoc或注释更不应该拘泥于它，可更加宽恕些。
15. Java类中方法名如果类似于queryRecordsByCardNo(String cardNo)，则可以简写为queryRecords(String cardNo)，ByCardNo含义可以在Javadoc中通过主说明以及@param等进行说明。但是，如果方法命和参数一样，这就必须加By...了。另外，在DAO方法中，类似getByGroupId(...)的Id是不必的，写成getByGroup()即可，因为@param会具体说明的。
16. 在DAO类的方法中，参数名可以使用诸如id、name、no等，因为一个DAO一个类，所以这样不会有歧义，但在Service类中，参数名最好使用诸如productId、productName、cardNo等，这样会避免歧义。
17. 使用英语书写Javadoc，应使用最合适的自然语言来说明，不论是量词、单数、复数等。  
另外，@param p1和@return后一般是一个词或短语，小写开头。@throws后形如：SQLException if...。这三种，最后不以句号结尾。若后面还有附加说明，则说明前加句号隔开。  
如果返回值是复数（类型为List、Array等），则在主注释说明中要加“列表”、“数组”等。
18. 一般的增、删、改、查操作一个表一个DAO，但在报表的DAO，由于涉及三个或三个以上表的关联查询，则可以酌情
   按业务分配到一个新建的的报表DAO。
19. CSS书写时，由外部属性向本身属性，然后再向内部属性写。
20. 一个包可大可小，可根据系统的大小和复杂性来决定是否要划定为一个包。
21. CSS中的class和id暂定使用小写，若由多个单词组成，则用中划线“-”分割。另外，命名和注释规范参见yiqusoft-site中index.htm和carousel.css的相关做法。

## 架构
1. 从目前的发展趋势来看，像mis和erp之类的软件，采用js、ajax等异步请求响应的方式比使用JSP、Struts等传统的页面刷新的方式在客户体验(偏cs体验)、软件运行速度(取决于客户机的性能)、服务器端负载(客户机负责显示数据，控制显示格式等，这就将服务器解放出来了，服务器端只负责处理数据)等方面具有优势，所以作系统的时候可以使用js、jquery、extjs等来做。但做网站的话可以主要采用JSP、Struts等传统的页面刷新方式，在比较适合的地方使用js、jquery等，是非常好的。
2. 写框架时，当遇到难题时，可参考别人的框架，我写这个项目时，就参考了Mybatis。  
写dbutil时参考Mybatis项目的几个类：  
org.apache.ibatis.session.defaults.DefaultSqlSession相当于我的Session类。org.apache.ibatis.executor.BaseExecutor和org.apache.ibatis.executor.SimpleExecutor extends BaseExecutor被DefaultSqlSession引用（使用），完成操作查询、更新等操作。  org.apache.ibatis.transaction.jdbc.JdbcTransaction被BaseExecutor引用（使用），完成数据库的提交和回滚等操作。
3. 在有service和dao层的框架中使用我的org.projectsample.commons.dbutils.Session时，要：service层的类中的方法应该负责SessionFactory.openSession()和session.commit()以及session.close()，在其中创建若干dao对象，将session作为参数传给dao类的构造方法，调用多个dao对象的方法，完成一次事务操作。
4. 对于一般的三层架构：表示层-service层-dao层，创建database connection和conn.commit以及conn.close应该位于service类的方法中，一般情况下，一个dao类对应一个业务实体类，而service负责业务逻辑控制，一个service方法可能调用若干个dao，操作多个业务实体，这时，service方法中应该创建dao实体，将conn作为参数传入dao类的构造方法，调用多个dao对象的方法来完成一次事务操作。
5. 暂定：service中的类大致按模块划分(特殊的话自己定)，一个模块一个类，action采用同样办法。JSP也大致按模块划分(特殊的话自己定)，一模块一目录，里面放JSP文件。
6. 过滤器主要使用在解决中文乱码和权限控制方面，另外官方还有若干个过滤器的例子，如压缩响应数据流过滤器，在examples/WEB-INF/classes/compressionFilters中，还有examples/WEB-INF/classes/filters中的有几个，其中，RequestDumperFilter可以打印Request中的值，作调试用，这些类根据需要的可以拿过来用。
7. 有些页面比如用户注册页面是一个页面(register.jsp)两个动作，一个是进入动作registerInput，一个是提交动作registerSubmit，这时要注意需要定义两个动作。
8. 静态类和单态类，见《StaticAndSingletonClass》。
9. 每个Servlet类完成操作一个抽象实体的功能，在Servlet类中增加若干方法处理对该抽象实体的不同的操作，如UserServelt中有add、delete、modify、view、list、query、bindToRole等方法。
10. 在一个有bean、dao、service、servlet的一般的web应用项目中，对若干子模块的一个，如securiy子模块，包的结构是security.bean还是bean.securiy，目前决定security.bean，然后service及后面是这样约定。但web等前台展示是否可以考虑再做一个子项目。
11. 如果界面采用JSP（相对JS），对网页布局：偏网站项目的菜单在上部，一般不分级或最多两级，偏系统软件的项目在左部，分级且可能较多级，个人工具菜单在右上角。
12. DAO方法命名的get和query，无参的用get，根据唯一键(如id、name)获得唯一实体的也用get，其它可用query。
13. Java的实体包名（dao，service，servlet等）和实体类名（对应数据库的实体的表），约定不用复数。
14. 对于同表对应的实体类，目前根据经验以及分析、考虑，暂作如下处理：  
实体类的属性同表中字段一一对应（关联字段也一样），不增加关联对象的属性，若有需要增加非对应表中字段的临时属性，则要加上注释。
15. service层类在也可以像DAO那样同表一一对应，但不像DAO那样严格遵守这个原则，因为对DAO来讲，那是标准，对它来说标准不是这，而是从表示层看，从逻辑上讲，某些方法是否应该归到同一个类中。  
另外，对于方法中参数变量的命名，最好包含实体名，如用roleId代替id等。  
还有，Service类应该当作Manager类来写，而不能当作一个实体类来写。
16. service层类的方法，如果有参数可用实体类，也可用实体类的主键id，那么从面向对象和程序设计的规范性的角度来讲，应该用实体类，且从程序通用性来讲，一个实体类不一定要有主键id的，还有就是程序本身的可读性，所以也应该如此，但从灵活、方便、够用即可的角度来讲，可以用类的主键id。  
目前决定：够用即可，可用主键id，另外考虑到调用的方便性，也可以用实体，可灵活些。   
17. 原来想着在权限控制中，将URL权限定义为ServletPath+Operation，因为这符合Permission=Resource+Operation这的个模型。但现在感觉有以下问题：
1>. URL都定义为ServletPath+Operation，显得比较强硬，不好，因为在有些情况下，这种拆分实在不靠谱的，可能并没有什么Operation。
2>. 对Web框架有要求，处理URL权限时须按这个模式来，这样不好。
18. DAO中，一般情况下：小关联可直接处理，例如取销售单时可通过SQL关联得到操作人、销售人员名称；大关联，最多处理两级，多级的可放到Service中，调用DAO的get(id)处理。
19. 层中哪一部分来校验和处理不合法的数据，在产品级别或工具类的API实现代码中，大部分都是需要处理所有不合法数据的，但在一般的应用系统中，在考虑到安全调用的前提下，可各层处理自己的不合法数据，不需要每层都处理所有的不合法数据，可假设调用方传来的参数数据是经过它筛选的，是安全的，可以不考虑不合法情况。  
但这些一定要保证在安全调用的前提下。比如，登录页面，为了防止恶意用户编程提交，除了在客户端要做用户名
和密码的非空校验外，服务器端也要做非空校验。
20. 使用JQuery吗？包括core和ui。  
从简单角度讲：不使用。仅专注于该做的事情，即展示simplest-dbutils和simplest-web的如何使用为目的。
从项目的使用性角度讲，应该使用core，最低限度的使用ui，可用到：datepicker控件，ajax请求，类似于邮件格式的校验等。  
目前考虑：使用datepicker控件。所以，暂时使用jQuery UI的Download builder只在Widgets选择Datepicker和Dialog，Download builder会根据依赖关系自动选择上UI Core和Interactions的其它的。然后UI的Theme选择Smothness，跟目前的页面风格比较搭，比较简单。

## 数据库规范
1. 数据库sql用小写。
2. 数据库对象的命名，单词之间以“_”分开。  
表名、函数名和过程名不用以“t”、“f”和“p”等开头。  
表的命名，大多数单表(非关联表)是从一个实体抽象出来的，所以表名也应该取实体的名称。  
实体表名不加复数？考虑到：从面向对象的对象实体或类的命名考虑，没有必要加复数；另外，何时、什么实体加或不加，不好判断，所以还不如一刀切都不加。实体表名要加复数？考虑到数据库设计表的命名的习惯。  
对于单词能不用简写就不用简写，但对于常用简写的一定要用简写。  
数据库表中的表示实体本身属性的字段的命名不需要含表名，但外键是需要含表名的。  
3. 对数据库对象尽量加注解，必要时将“设计考量”加上。  
对容易混淆的概念，注解务必详尽。
4. 对于枚举类型，要将每个值的意义注释清楚：  
1>. 状态码约定：10代表初始状态、有效等，后面是20、30等；100代表删除、无效等，后面是101、102等。另外，对于删除状态，增加要慎重，只有当客户需求有删除操作时才增加删除状态，如果仅仅因为后台调整数据才增加删除状态，这是不可取的。  
2> .类型码约定：对于一般的类型码可以用1、2、3等，但对于需要在程序里比较的，请使用大写字母串(一般的是简写)，这样可读性更强。
5. 定义表结构时，按重要顺序从前向后定义列，而不管是否为外键。另外，关联冗余字段放到关联非冗余字段后面。
6. 在同表对应的实体类中，timestamp对time串，date对date串，其它的像int对Integer，numeric对BigDecimal，boolean对Boolean等。
7. 对于唯一键和外键等，一般的，能做一定要做。这些是数据库为了保证数据合法性所提供的机制，要充分运用这些功能。
8. 多对多关联表的命名，如果地位不等，根据习惯，主表名在前，附表名在后，如果地位相等，则看谁在前更符合习惯。
9. 表中是否增加“有效/无效”字段取决于：直接删除数据是否会对引用该表的表的数据造成影响、是否有大量的表引用了该表等。如可接受，则不必加，否则要加。另外，是否有专人维护系统也会对此决策产生影响。
10. 建表语句，字段声明开始至类型声明开始之间字符约定为16个。
11. 插入语句写法：insert into t1 (c1, c2, c3) values (v1, v2, v3)，这是标准写法。

## 异常处理
1. 通过将非运行期异常转换为运行期异常（RuntimeException），可以将接口上的显式的异常声明去掉，例如，在service层的代码中调用Session类方法执行sql，将方法抛出的SQLException转为了DbException。
2. 《Java核心技术-11.1 处理异常》中：异常处理的任务就是将控制权从错误产生的地方转移给能够处理这种情况的错误处理器。  
**本人注释：**向用户报告错误也是一种错误处理器。
3. 《Java核心技术-11.2 捕获异常》中：通常，应该捕获那些知道如何处理的异常，而将那些不知道怎样处理的异常传递出去。  
**本人注释：**有时候，有些异常即使抛出去也没有地方有办法去处理它，则还不如就地解决掉它，就像从网上摘录的话：“异常最好能在距发生异常的最近的地方被处理，如果继续抛出到上层，也不能被处理掉，为什么不立即处理掉呢？”，将一个checked异常转为一个runtime异常，也是一种处理方式。例如：在service层的代码中调用Session类方法执行sql，将方法抛出的SQLException转为了DbException。
4. 有时候，不能在最近的地方将非运行期异常处理掉或转换为运行期异常：因为方法的间接调用者（若干层调用）能需要通过捕获该非运行期异常来确定某些事情，所以要一直抛到那里进行处理或转换为运行期异常。正因如此，所以Session的执行sql的方法中没有将SQLException进行转为DbException，而是又直接传出去，由service层的代码来转为DbException。
5. 将意外的情况作为异常来处理，是比较合理的办法，例如因数据库配置错误或数据库网络连接中断或sql书写错误导致的意外情况都应该作为异常抛到最外层的表示层去处理（显示给用户：数据库异常），而不应该在业务逻辑层通过返回boolean类型来显示更新成功和失败，这是不合理的，而且这样也会把异常的详细信息给丢掉。
6. 使用try/catch处理异常，对于try中某类的方法抛出的非运行期异常，是必须要在catch中捕获的，但这些异常并不是该类的方法要抛出的所有异常，因为还有运行期异常，比如空指针异常（NullPointerException）就不会被捕获并处理（话说回来，其实NullPointerException一般可通过object is null来通过程序判断解决），这个要注意。如果要处理所有异常的，则需要在catch的括号中使用比较上层的异常类型，比如Exception，甚至Throwable。
7. Java的错误异常体系中Throwable类为所有错误异常类的基类，它的子类有Error类和Exception类，而Exception类的子类又有RuntimeException类和非RuntimeException类。所以，如果有个try-catch块的catch()中是Exception类，那么若try块中抛出Error或其子类的对象，则catch不会捕获到它，如果要捕获所有的错误异常，则可以在catch()中用Throwable类，这是要注意的。
8. 有本书《Effective Java》挺不错的，它的第8章就是讲异常的，给了我一些启发，最近（2012年1月）我又读了一遍这章。
9. 有篇网上的文章写的也挺好，见“studynote/java/resource/java-exception.html”。
10. 虽然不可能处理所有的异常（checked是必须要显式的，runtime是不必显式的），但考虑到某些场合，尽量多的处理异常，给调用者更多的异常也是不错的做法，如我写的Dbcp.java就对null做了一次抛出异常的操作。
11. service中的方法在处理业务时，有不符合正常逻辑的情况，应通过“抛出异常的方式”来处理，而不是采用“返回一个错误代码字符串”的方式，尽管后者处理起来比较容易。  
在产品级别的逻辑层类方法中，应该定义各种不同的异常，例如在专业的认证方法中，可以抛出用户名不存在异常，密码不正确异常，用户登录状态已无效异常等异常，例如Apache Shiro项目中Subject.login(Token)方法的处理。  
但在项目级别的逻辑类方法中，除了采用上面的方法定义各种不同的异常以外，还可以从简单、方便的角度考虑，直接抛出一个runtime异常，通过异常的字符串来让直接或间接调用者得到异常信息。
12. 关于异常，无论是runtime的还是非runtime的，只要程序抛出此异常，则程序的调用方就会停止程序的执行。
13. servlet中的抛出的异常，如果不做处理，不能够被web.xml中的配置的error-page得到。配置了error-page后，一旦servlet抛出异常发生，容器应该是将request forward到这个error-page，这仅仅是个forward的过程。因此可以将异常放到request的attribute中，然后error-page中就可以从request的attribute中得到这个exception。但这样就需要每个抛出异常的地方都这样做，所以不是个理想的解决方法。
14. 参照Apache Shiro项目，定义一个root exception：ShiroException，该项目的其它exception均继承自exception，这样便于使用该项目的项目根据抛出的exception执行相应操作。
15. 若要定义非RuntimeException，则只要继承Exception即可。有时需要定义非RuntimeException：当需要向调用方报告有这种类型的异常发生，以便调用方可根据抛出的异常类型进行相应的处理，尤其是在产品（相对于项目）代码中。
16. 在service层，对于用户名为空或密码为空的异常，决定：抛出空指针异常，而非每个自己定义一个异常，因为它跟Java中的空指针异常类似，是明显的错误，而不像密码不正确这种不是错误，并且这种空异常在其他情形下也比较普遍，每个都自己定义一个新异常，没必要。这种做运行期异常处理，在Javadoc中提示调用者即可，不强制其处理（非运行期异常）。
17. 有篇介绍Exception的文章讲的特别全面：http://blog.csdn.net/hguisu/article/details/6155636。
18. 在进行Java程序设计的时候，需要关注Exception层次结构。这个层次结构又分解为两个分支：一个分支派生于RuntimeException的异常；另一个分支包含其他异常。划分两个分支的规则是：由程序错误导致的异常属性RuntimeException；曾经能够正确运行，而由于某些情况（例如，I/O错误）导致的异常不属于RuntimeException。
RuntimeException：错误的类型转换、数组访问越界、访问空指针。
19. “如果出现RuntimeException异常，就一定是你的问题” 是一条相当有道理的规则。应该通过检测数组下标是否越界来避免ArrayIndexOutOfBoundsException异常；应该通过在使用变量之前检测是否为空来杜绝NullPointerException异常的发生。
非RuntimeException：试图在文件尾部后面读取数据、试图打开一个错误格式的URL、试图根据给定的字符串查找Class对象，而这个字符串表示的类并不存在。

# 静态类和单态类
1. 一个静态类（这里是指成员函数皆为static），使用它的一种情形是：调用者没有将它作为一个对象来考虑，而是把它认为是一个函数集合，也即函数编程，如三层架构中的service和dao。
2. 虽然静态类也可以被当成唯一的一个对象来用， 但它阻止不了别人去new若干个它的对象，而单态模式就可以办到这些。
3. 另外，单态类和静态类还有以下区别：  
1>. 单态类是要被new的，只不过单态控制了只能new一个对象，而静态类一般不会被new的。  
2>. 单态类的方法不用是static的，但静态类的方法需要是static的。  
3>. 如果需要初始化，单态类在构造函数中完成，而静态类则是在一个static块里面完成。
4. 目前，我打算dbcp使用单态类，service、dao使用静态类。
5. 题外话：static类一般不会被继承，它的对象也不会被用作另外的类的组件，所以如果要使用继承或组合技术实现扩展的话，最好定义成普通类，而不是static类。

# Web相关
1. filter  
1>. filter和servlet的顺序  
加载顺序、init顺序：filter-->servlet。  
处理请求顺序：filter-->servlet-->filter。  
销毁顺序：servlet-->filter。  
2>. filter的配置  
filter-mapping的子配置dispatcher的可取值：REQUEST、FORWARD、INCLUDE、ERROR，如无明确声明，则默认是REQUEST。
2. simplest-web决策考虑  
simplest-web.xml中action的path未以“/”开头是参考struts2的配置文件的。
3. simplest-s1决策考虑  
SecurityFilter(过滤访问权限的)，它的url-pattern最好不要设置为"/\*"，因为这样会误
伤.css、.ico、.jpg、.js的路径等，所以，可设置为\*.action、\*.jsp、\*.html。
4. CSS  
1>. 一个div只有在父div中有position时，它的position和top、bottom等才有用。  
2>. 应用于主界面的CSS只用于控制框架宽窄高低和框架的边界线的控制，剩下可放到各个JSP(如Head.jsp、
Footer.jsp等)中，当然，如果Head.jsp、Footer.jsp中比较简单，那么放到主界面中也可。  
3>. 当一个元素不是块对象时，有很多块的属性不起作用，比如<span></span>的margin-left。若要它起作用，
可以display:block。  
4>. div和div之间使用的border: 1px solid会占位，在精确定位时慎用，因为可能会影响尺寸造成出现滚动
条或div错位的后果。如果为了区分div，现实div之间的界限，可以使用背景色或者设置背景图片来解决。

## 知识点
1. 参考JDK API，Statement的executeQuery()返回的ResultSet对象永远不可能为null。
2. 对于PreparedStatement的setXXX()，若该列的值为null，则可以写为setNull(1, JdbcType)或setXXX(1, null)或setObject(1, null)，据我了解，有的驱动程序这三种方法都支持，有的则部分支持，这个要注意首次使用数据库驱动或更换数据库驱动时要进行认真的测试。
3. 异常，见《Exception》。
4. 解析xml，dom4j功能比较强大，但需要引入包，而dom在jdk中已经包含了。由于我的项目是simples，所以用dom。
5. 编写递归函数的基本技巧：自己调用自己；函数中有条件语句，一个分支自己调自己，一个分支什么都不做，返回空。
6. 这两天(今天2013年7月6日)跟同事讨论组织结构等有如下心得：  
1>. 一般的，一种设计考虑只能解决一种问题，不要指望一种设计可以搞定所有问题，所以，每种设计考虑有自己的优势，当然，也有自己的劣势。虽然可以多个设计综合使用来解决不同方面的问题，但这也会引入复杂性。这时，关键是要分析，哪些问题是我们首先要解决的，哪些次之，哪些不重要或可以通过其他简单方式简单处理，根据问题的重要性排个序，做个列表，然后据此提出综合解决方案。  
2>. 在进行软件设计考虑时，对于该软件的使用，可能会有一些要求，或者是在思想上，或者是在原则上，需要使用者遵循某种约定，不能花乱的滥用，否则会导致软件在使用时，概念等会变的越来越混乱。这些需要遵循的约定在设计文档和软件成品说明书里都应该有体现。
7. CSS控制布局的高度和宽度：  
1>. 一般情况下，高度使用绝对值，而非百分比，宽度情况各占一半吧。但当要控制高度、宽度全屏或占百分比时，应使用百分比。  
2>. 一般来说，如果最外层布局的高度或宽度使用百分比(非绝对值)，但里层又要用绝对值，则可以采用div嵌套实现。外层百分比，里层绝对值，通过嵌套来实现这种转化。  
3>. 2>中讨论的，当内层采用绝对值时，会有剩下一部分的空隙，这是个弊端。因此，在设计页面时，掌握着百分比和绝对值的特点，然后从全局角度考虑。  
4>. 最后考虑，高度和宽度都采用绝对值，这样控制最简单，现在大部分显示器是宽屏，16:9或者16:10的，而这里再取一个1280 \* 800(16:10)的主流中最小分辨率作为标准来定义宽度和高度。  
8. 网站整体色彩搭配设计：主题部分大部分为白色，外框和主题部分的组件颜色可谓活泼的颜色如橙色、嫩绿等。

## 使用工具
1. 使用DBCP，需要导入commons-dbcp-1.4.jar，它又依赖于commons-pool-1.5.5.jar，它们可以从官网下载的commons-dbcp-1.4-bin.tar.gz和commons-pool-1.5.5-bin.tar.gz压缩包中获得。
2. 使用JSTL，需要导入的包为jstl.jar和standard.jar，它们可以从官网下载的jakarta-taglibs-standard-current.tar.gz包中获得。
3. 日志系统欲使用slf4j和logback，见http://www.slf4j.org和http://logback.qos.ch，另外，关于日志系统的选择，有篇文章还行http://yanboy.iteye.com/blog/204436。
4. 使用Javadoc，有几篇文章不错，见“studynote/java/resource/java-doc相关文章”，其中英文的那个可重点看一下。实现类的方法的java doc中一般用@see标注该方法的描述说明请参见接口类对应的方法。

## 参考项目
1. 参考项目iBATIS_JPetStore-4.0.5中我的笔记中关于值得学习的点。

## 项目管理
1. 有一个技巧不错：跟大家商量，然后约定在在某一天，将所有的程序提交，进行联调。这种具体、明确、硬性的目标对激励大家按时完成任务是很有用的。每个人可能会觉得，如果自己没有按时完成，拖大家后腿的话，会很丢人，所以也会积极配合。