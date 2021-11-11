---
title: 静态站点生成器的优势
linktitle: 静态站点生成器
description: 改进的性能、安全性和易用性只是静态站点生成器如此吸引人的几个原因。
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-11-09
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

‎网站生成器的目的是将内容渲染到 HTML 文件中。大多数是"动态站点发生器"。这意味着 HTTP 服务器即向浏览器发送文件以进行查看的程序运行生成器，以便每次最终用户请求页面时创建新的 HTML 文件。‎

‎随着时间的推移，动态站点生成器被编程为缓存其 HTML 文件，以防止在向最终用户交付页面时出现不必要的延迟。缓存页面是网页的静态版本。‎

‎Hugo 更进一步，所有 HTML 文件都呈现在您的计算机上。您可以在将文件复制到托管 HTTP 服务器的计算机之前，先查看本地文件。由于HTML文件不是动态生成的，我们说雨果是一个 ‎*‎静态站点生成器‎*‎。‎

‎这有很多好处。最引人注目的是性能。HTTP 服务器‎*‎非常‎*‎善于发送文件 -事实上，您可以有效地为相同数量的页面提供服务，其中只有一小部分是动态站点所需的内存和 CPU。‎

## 更多关于静态网站生成器信息

* ["An Introduction to Static Site Generators", David Walsh][]
* ["Hugo vs. WordPress page load speed comparison: Hugo leaves WordPress in its dust", GettingThingsTech][hugovwordpress]
* ["Static Site Generators", O'Reilly][]
* [StaticGen: Top Open-Source Static Site Generators (GitHub Stars)][]
* ["Top 10 Static Website Generators", Netlify blog][]
* ["The Resurgence of Static", dotCMS][dotcms]

["An Introduction to Static Site Generators", David Walsh]: https://davidwalsh.name/introduction-static-site-generators
["Static Site Generators", O'Reilly]: https://github.com/gohugoio/hugoDocs/files/1242701/static-site-generators.pdf
["Top 10 Static Website Generators", Netlify blog]: https://www.netlify.com/blog/2016/05/02/top-ten-static-website-generators/
[hugovwordpress]: https://gettingthingstech.com/hugo-vs.-wordpress-page-load-speed-comparison-hugo-leaves-wordpress-in-its-dust/
[StaticGen: Top Open-Source Static Site Generators (GitHub Stars)]: https://www.staticgen.com/
[dotcms]: https://dotcms.com/blog/post/the-resurgence-of-static
