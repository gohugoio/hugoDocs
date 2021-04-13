---
title: Hugo 是什么？
linktitle: Hugo 是什么
description: Hugo 是一款用 Go 编写的快速、现代的静态网站生成器，旨在让网站构建再次充满乐趣。
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-04-13
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

Hugo 是一个通用的网站框架。严格来说，Hugo 是一个[静态网站生成器][static site generator]。与系统根据每个访问者的请求动态地建立一个页面不同，雨果是在您创建或更新内容时建立页面。由于网站的浏览频率远远高于编辑频率，因此 Hugo 的设计旨在为您网站的终端用户提供最佳的浏览体验，为网站作者提供理想的写作体验。

用 Hugo 建立的网站非常快速且安全。Hugo 网站可以托管在任何地方，包括[Netlify][]、[Heroku][]、[GoDaddy][]、[DreamHost][]、[GitHub Pages][]、[GitLab Pages][]、[Surge][]。[Aerobatic][]、[Firebase][]、[Google Cloud Storage][]、[Amazon S3][]、[Rackspace][]、[Azure][] 和 [CloudFront][]，并能很好地与 CDN 合作。Hugo 网站的运行不需要数据库，也不需要依赖 Ruby、Python 或 PHP 等昂贵的运行时。

我们认为 Hugo 是一个理想的网站创建工具，几乎是即时建站，只要有变化就能重建。

## Hugo 有多快？

{{< youtube "CdiDYZ51a2o" >}}

## Hugo 是做什么的？

在技术层面上，Hugo 将源码目录中的文件和模板作为输入，并使用这些文件和模板来创建一个完整的网站。

## 谁应该使用 Hugo？

Hugo 是为那些喜欢用文本编辑器而不是浏览器写作的人准备的。

Hugo 是为那些想亲手为自己的网站编写代码，而不用担心设置复杂的运行机制、依赖关系和数据库的人准备的。

Hugo 适用于建立一个博客、公司网站、投资组合网站、文档、单个登陆页或拥有数千页的网站的用户。

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
[static site generator]: /about/benefits/
