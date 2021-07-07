---
title: 静态网站生成器的好处
linktitle: 静态网站生成器的好处
description: 提高性能、安全性和易用性只是静态网站生成器如此吸引人的几个原因。
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-04-13
keywords: [静态网站生成器,静态,性能,安全]
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

网站生成器的作用是将内容渲染成 HTML 文件。大多数生成器是 "动态网站生成器"。这意味着 HTTP 服务器——即向浏览器发送文件以供浏览的程序——在每次终端用户请求一个页面时，都会运行生成器来创建一个新的 HTML 文件。

随着时间的推移，动态网站生成器被编程为缓存他们的 HTML 文件，以防止在向最终用户提供页面时出现不必要的延迟。缓存页面是网页的静态版本。

Hugo 将缓存更进一步，所有的 HTML 文件都会在您的电脑上呈现。您可以在本地查看这些文件，然后再将它们复制到托管 HTTP 服务器的计算机上。由于 HTML 文件不是动态生成的，所以我们说 Hugo 是一个*静态网站生成器*。

这有很多好处，最明显的是性能，HTTP 服务器在发送文件方面非常出色。事实上，你可以用动态网站所需的一小部分内存和 CPU 来有效地提供同样数量的页面。

## 更多关于静态网站生成器的信息

* ["An Introduction to Static Site Generators", David Walsh][]
* ["Hugo vs. WordPress page load speed comparison: Hugo leaves WordPress in its dust", GettingThingsTech][hugovwordpress]
* ["Static Site Generators", O'Reilly][]
* [StaticGen: Top Open-Source Static Site Generators (GitHub Stars)][]
* ["Top 10 Static Website Generators", Netlify blog][]
* ["The Resurgence of Static", dotCMS][dotcms]


["An Introduction to Static Site Generators", David Walsh]: https://davidwalsh.name/introduction-static-site-generators
["Static Site Generators", O'Reilly]: https://www.oreilly.com/web-platform/free/files/static-site-generators.pdf
["Top 10 Static Website Generators", Netlify blog]: https://www.netlify.com/blog/2016/05/02/top-ten-static-website-generators/
[hugovwordpress]: https://gettingthingstech.com/hugo-vs.-wordpress-page-load-speed-comparison-hugo-leaves-wordpress-in-its-dust/
[StaticGen: Top Open-Source Static Site Generators (GitHub Stars)]: https://www.staticgen.com/
[dotcms]: https://dotcms.com/blog/post/the-resurgence-of-static
