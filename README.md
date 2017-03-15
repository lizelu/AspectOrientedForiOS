# AspectOrientedForiOS
# iOS面向切面编程

上篇博客我们类比着Java的Spring框架中的依赖注入的实现方式，也试着使用Objective-C来写了一下OC中的依赖注入的实现方式。当然，我们是使用的PList文件来加载的依赖注入时用到的依赖关系。本篇博客我们就来实现一下OC中的AOP编程。上篇博客我们对AOP（Aspect Oriented Programming）进行了简单的介绍，说白了，AOP编程就是在运行时动态的将代码切入到类的指定方法、指定位置上的编程方式。

当然，是使用运行时动态的去实现的，所以被插入代码的一方是在不知情的情况下被插入的。换句话说，AOP编程就是在不改变原有类的结构，来动态的为类添加代码片段。之前我们在[《iOS开发之Runtime常用示例总结》](http://www.cnblogs.com/ludashi/p/6294112.html)中的方法交换的部分，提到过AOP编程。也就是说，我们可以使用Objective-C的Runtime中的方法交换来实现AOP编程。

本篇博客会简单的通过一个DEMO来看一下如果通过方法交换来实现AOP编程。当然在Github上有专门关于OC的AOP的开源库，如[Aspects](https://github.com/steipete/Aspects)。Aspects主要提供了两个方法来切入相应的代码实现，具体请移步于github相应的内容。

### 一、示例概述

本篇博客的示例比较简单，其实就是使用Runtime的方法交换来实现AOP面向切面编程。下方这两个文件就是我们本篇博客所涉及的核心文件。TestClass顾名思义就是我们的测试类，而TestClass+Logging就是TestClass的切片，TestClass+Logging会在TestClass不知情的情况下做一些事情。
![](http://images2015.cnblogs.com/blog/545446/201702/545446-20170213174049941-1408479485.png)

下方代码段就是TestClass类中的测试方法，该方法是非常简单的，只有一行输出语句
![](http://images2015.cnblogs.com/blog/545446/201702/545446-20170213174412988-880886199.png)

下方是未添加切片时的运行结果，是比较正常的，如下所示：
![](http://images2015.cnblogs.com/blog/545446/201702/545446-20170213175010269-244468692.png)


### 二、创建切片

接下来我们来创建切片，我们就在TestClass的类目中创建相应的切片。切片实现本质就是讲切入点的方法实现与切片中的方法进行交换。接下来我们就来实现这一过程，其实下方的代码在我们之前聊Runtime的时候就已经聊过了。今天的主题不是Rumtime, 而是AOP, 所以关于Runtime的东西在此就不做过多赘述了。

下方就是本篇博客实现AOP的核心代码：方法交换。
![](http://images2015.cnblogs.com/blog/545446/201702/545446-20170213175746894-1621905657.png)

下方就是在TestClass中的类目中调用方法交换要做的事情。首先在load()方法中调用方法交换的方法，将切入点testMethod()方法与我们添加的新的方法logTestMethod()进行交换，然后在我们新的方法中调用logTestMethod()。因为testMethod()与logTestMethod()方法的方法实现以及交换了，调用testMethod()即为调用logTestMethod()方法的实现，而调用logTestMethod()方法时，则调用testMethod()方法的实现。

当然这一块比较绕，不过好好捋捋还是不难搞明白的。
![](http://images2015.cnblogs.com/blog/545446/201702/545446-20170213180009519-829891903.png)

### 三、切片运行结果

添加完上述切片后，我们再次调用TestClass对象的testMethod()方法时就会先调用before()方法，然后执行testMethod()原有的方法体，然后执行after()方法。运行效果如下所示。
![](http://images2015.cnblogs.com/blog/545446/201702/545446-20170213180655097-473330015.png)
当然本篇博客的内容比较简单，但是还是比较有意思的。关于OC中更全面的AOP的实现请移步于Github上的第三方库Aspects。当然Aspects也是由OC写的，并在github上可以找到其相应的代码实现，有兴趣的可以去看看。
