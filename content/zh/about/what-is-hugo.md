---
title: What is Hugo
linktitle: What is Hugo
description: Hugo is a fast and modern static site generator written in Go, and designed to make website creation fun again.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
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

Hugo是一个通用的网站框架。从技术上讲，Hugo是一个[静态站点生成器][]。与根据每个访问者请求动态构建页面的系统不同，Hugo 会在您创建或更新内容时构建页面。由于网站的浏览频率远远高于编辑频率，因此Hugo旨在为网站的最终用户提供最佳的观看体验，并为网站作者提供理想的写作体验。

使用Hugo构建的网站非常快速和安全。Hugo 网站可以托管在任何地方，包括 [Netlify][]、[Heroku][]、[GoDaddy][]、[DreamHost][]、[GitHub Pages][]、[GitLab Pages][]、[Surge][]、[Aerobatic][]、[Firebase][]、[Google Cloud Storage][]、[Amazon S3][]、[Rackspace][]、[Azure][]和 [CloudFront][]，并且与 CDN 配合良好。Hugo 网站无需数据库或依赖昂贵的运行时（如 Ruby、Python 或 PHP）。

我们认为Hugo是理想的网站创建工具，具有几乎即时的构建时间，能够在进行更改时进行重建。

## Hugo到底有多快？
{{< youtube "CdiDYZ51a2o" >}}

## Hugo是做什么的？

从技术上讲，Hugo 采用文件和模板的源目录，并使用这些目录作为输入来创建一个完整的网站。

## 谁该用Hugo？

Hugo适合那些更喜欢在文本编辑器中而非浏览器中写作的人。

Hugo适合喜欢使用编辑器搭建网站的人，无需关心所设置的复杂的运行时环境，依赖和数据库。

Hugo适用于构建博客，公司网站，投资组合网站，文档，单个登录页面或具有数千个页面的网站的人。

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
