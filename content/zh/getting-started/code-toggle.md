---
title: 代码切换
description: 代码切换的试用和展示
date: 2018-03-16
lastmod: 2021-11-10
categories: [getting started,fundamentals]
keywords: [configuration,toml,yaml,json]
weight: 60
sections_weight: 60
draft: false
toc: true
---

## 代码切换器

这是配置切换短代码的示例。
它的目的是让用户通过点击相应的选项卡来选择一种配置语言。 这样做后，页面上的每个代码切换器都将切换到目标语言。 此外，目标语言将保存在用户的 `localStorage` 中，因此当他们转到不同的页面时，Code Toggler 会显示他们上次“切换”的配置语言。

{{% note %}}
`code-toggler` 简码不是内部 Hugo 简码。 此页面的目的是测试我们在整个站点中使用的自定义功能。 参见：<https://github.com/gohugoio/gohugoioTheme/blob/master/layouts/shortcodes/code-toggle.html>
{{% /note %}}

## 下面这个就是代码切换器

{{< code-toggle file="config">}}

baseURL: "https://yoursite.example.com/"
title: "My Hugo Site"
footnoteReturnLinkContents: "↩"
permalinks:
  posts: /:year/:month/:title/
params:
  Subtitle: "Hugo is Absurdly Fast!"
  AuthorName: "Jon Doe"
  GitHubUser: "spf13"
  ListOfFoo:
    - "foo1"
    - "foo2"
  SidebarRecentLimit: 5
{{< /code-toggle >}}

## 另一个可变配置

{{< code-toggle file="theme">}}

name = "Hugo Theme"
license = "MIT"
licenselink = "https://github.com/budparr/gohugo.io/blob/master/LICENSE.md"
description = ""
homepage = "https://github.com/budparr/gohugo.io"
tags = ["website"]
features = ["", ""]
min_version = 0.18

[author]
  name = "Bud Parr"
  homepage = "https://github.com/budparr"

{{< /code-toggle >}}

## 两个常规代码块

{{< code file="bf-config.toml" >}}
[blackfriday]
  angledQuotes = true
  fractions = false
  plainIDAnchors = true
  extensions = ["hardLineBreak"]
{{< /code >}}

{{< code file="bf-config.yml" >}}
blackfriday:
  angledQuotes: true
  fractions: false
  plainIDAnchors: true
  extensions:
    - hardLineBreak
{{< /code >}}
