---
title: 代码切换
description: 代码切换试用和展示。
date: 2018-03-16
categories: [入门,基础]
keywords: [配置,toml,yaml,json]
weight: 60
sections_weight: 60
draft: false
toc: true
---

## 配置切换器！

这是配置切换短代码的一个示例。
它的目的是让用户通过点击相应的标签来选择配置语言。一旦这样做，页面上的每一个代码切换器都将被切换到目标语言。同时，目标语言将被保存在用户的 `localStorage` 中，所以当他们进入不同的页面时，代码切换器会显示他们最后 “切换” 的配置语言。

{{% note %}}
代码切换器 `code-toggler` 短代码不是 Hugo 的内部短代码。这个页面的目的是为了测试我们在整个网站中使用的一个自定义功能。请看：https://github.com/gohugoio/gohugoioTheme/blob/master/layouts/shortcodes/code-toggle.html
{{% /note %}}

## 这是一个配置切换器

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

## 另一个配置切换器！

{{< code-toggle file="theme">}}

# Hugo 主题的 theme.toml 模板

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

## 两个普通代码块

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
