---
title: 静态网站生成器的优势
linktitle: 静态的优势
description: 优秀的性能，安全性和易用性只是静态网站生成器吸引人的部分原因。
date: 2018-05-04
publishdate: 2018-05-04
lastmod: 2018-05-04
keywords: [ssg,static,performance,security]
menu:
  docs:
    parent: "about"
    weight: 30
weight: 30
sections_weight: 30
draft: false
aliases: []
toc: false
---

静态网站生成器的目的是将内容以HTML的方式呈现。网络上所见到的大多是动态网站生成器。他们运行在HTTP服务器上，用来为用户的每次访问创建相应的HTML网页。

通常在访问页面时，动态网站生成器会在访问时生成缓存文件，用以防止用户加载页面时出现不必要的延迟。而这个缓存页面就是这个网页的静态版本。

Hugo提前将所有的文件在你的电脑上转化为HTML网页。因此在你上传网页到托管HTTP服务器的计算机之前，你可以在本地访问这些文件。由于这些HTML网页不是动态生成的，因此我们称Hugo为“静态网站生成器”。

静态网站生成器有许多优势，最显著的便是高性能。由于HTTP服务器**十分**擅长发送文件，因此你可以高效的利用小部分CPU和内存性能提供相同数量的页面。

## 更多关于静态网站生成器的介绍

* ["静态网站生成器简介", David Walsh][David Walsh]
* ["Hugo与Wordpress页面加载速度对比: Hugo秒杀Wordpress", GettingThingsTech][hugovwordpress]
* ["静态网站生成器", O'Reilly][O'Reilly]
* [StaticGen: 顶级的静态网站生成器 (GitHub Stars)][StaticGen]
* ["十大静态网站生成器", Netlify blog][Netlify]
* ["静态的复苏", dotCMS][dotcms]


[David Walsh]: https://davidwalsh.name/introduction-static-site-generators
[O'Reilly]: http://www.oreilly.com/web-platform/free/files/static-site-generators.pdf
[Netlify]: https://www.netlify.com/blog/2016/05/02/top-ten-static-website-generators/
[hugovwordpress]: https://gettingthingstech.com/hugo-vs.-wordpress-page-load-speed-comparison-hugo-leaves-wordpress-in-its-dust/
[StaticGen]: https://www.staticgen.com/
[dotcms]: https://dotcms.com/blog/post/the-resurgence-of-static