---
title: Hugo 是什么
linktitle: Hugo 是什么
description: Hugo 是一个使用 Go 编写的快速和现代的静态网站生成器，并旨在使网站创建变得有趣。
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-11-09
layout: single
menu:
  docs:
    parent: "about"
    weight: 10
weight: 10
sections_weight: 10
draft: false
aliases: [/overview/introduction/,/about/why-i-built-hugo/]
toc: true
---

Hugo是一个通用的网站框架。从技术上讲，Hugo是一个[静态站点生成器][].。与根据每个访问者请求动态构建页面的系统不同，Hugo在创建或更新内容时构建页面。由于网站的浏览次数远远超过编辑次数，Hugo旨在为网站的最终用户提供最佳的浏览体验，并为网站作者提供理想的写作体验。

使用 Hugo 建立的网站非常快速和安全。Hugo 站点可以托管在任何地方，包括 [Netlify][], [Heroku][], [GoDaddy][], [DreamHost][], [GitHub Pages][], [GitLab Pages][], [Surge][], [Aerobatic][], [Firebase][], [Google Cloud Storage][], [Amazon S3][], [Rackspace][], [Azure][], 和 [CloudFront][] 并与 CDN 一起使用。Hugo 站点运行时不需要数据库，也不依赖 Ruby、Python 或 PHP 等昂贵的运行时。

我们认为 Hugo 是理想的网站创建工具，几乎即时构建时间，能够在任何更改时重建。

## Hugo 有多快？

{{< youtube "CdiDYZ51a2o" >}}

## Hugo 是干什么的？

在技术术语中，Hugo 获取文件和模板的源目录，并使用这些作为输入来创建一个完整的网站。

## 谁应该使用 Hugo

Hugo适合喜欢用文本编辑器而不是浏览器编写内容的人。

Hugo适合那些想要手工编写自己的网站代码，而不用担心设置复杂的运行时、依赖关系和数据库的人。

Hugo适用于那些创建博客、公司网站、作品集网站、文档、单个登录页面或拥有数千页的网站的人。

[@spf13]: https://twitter.com/spf13
[Aerobatic]: https://www.aerobatic.com/
[Amazon S3]: https://aws.amazon.com/s3/
[Azure]: https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website
[CloudFront]: https://aws.amazon.com/cloudfront/ "Amazon CloudFront"
[DreamHost]: https://www.dreamhost.com/
[Firebase]: https://firebase.google.com/docs/hosting/ "Firebase static hosting"
[GitHub Pages]: https://pages.github.com/
[GitLab Pages]: https://about.gitlab.com/features/pages/
[Go language]: https://golang.org/
[GoDaddy]: https://www.godaddy.com/ "GoDaddy.com Hosting"
[Google Cloud Storage]: https://cloud.google.com/storage/
[Heroku]: https://www.heroku.com/
[Jekyll]: https://jekyllrb.com/
[Middleman]: https://middlemanapp.com/
[Nanoc]: https://nanoc.ws/
[Netlify]: https://netlify.com
[Rackspace]: https://www.rackspace.com/cloud/files
[Surge]: https://surge.sh
[contributing to it]: https://github.com/gohugoio/hugo
[rackspace]: https://www.rackspace.com/openstack/public/files
[静态站点生成器]: /about/benefits/
