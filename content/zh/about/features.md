---
title: Hugo 的特性
linktitle: Hugo 的特性
description: Hugo 拥有惊人的速度、强大的内容管理和强大的模板语言，使其非常适合各种静态网站。
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2021-04-13
menu:
  docs:
    parent: "about"
    weight: 20
weight: 20
sections_weight: 20
draft: false
toc: true
---

## 常规

* [极快][Extremely fast]的构建时间(&lt; 1毫秒每页)
* 完全跨平台，在 macOS、Linux、Windows 等平台上[轻松安装][install]。
* 在开发过程中，使用 [LiveReload][] 快速渲染变化。
* [强大的主题][Powerful theming]
* [在任何地方托管您的网站][hostanywhere]

## 组织

* 直接[组织您的项目][organization for your projects]，包括网站部分
* 可定制的 [URL][URLs]
* 支持可配置的[分类法][taxonomies]，包括类别和标签
* 通过强大的[模板函数][functions]按照您的意愿[对内容进行排序][Sort content]
* 自动生成[目录][table of contents]
* [动态菜单][Dynamic menu]创建
* [漂亮的URL][Pretty URLs]支持
* [永久链接][Permalink]模式支持
* 通过[别名][aliases]重定向

## 内容

* 原生 Markdown 和 Emacs Org-Mode 支持，以及通过*外部助手*支持其他语言（见[支持的格式][supported formats]）。
* [Front matter][front matter] 中支持 TOML、YAML 和 JSON 元数据。
* 可定制的[主页][homepage]
* 支持多种[内容类型][content types]
* 自动和用户定义的[内容摘要][content summaries]
* [短代码（Shortcodes）][Shortcodes]在 Markdown 中启用丰富的内容
* ["阅读时间"][pagevars]功能
* ["字数统计"][pagevars]功能

## 附加功能

* 集成 [Disqus][] 评论支持
* 集成 [Google Analytics][] 支持
* 自动创建 [RSS][]
* 支持 [Go][] HTML 模板
* 由 [Chroma][] 驱动的[语法高亮][Syntax highlighting]


[aliases]: /content-management/urls/#aliases
[Chroma]: https://github.com/alecthomas/chroma
[content summaries]: /content-management/summaries/
[content types]: /content-management/types/
[Disqus]: https://disqus.com/
[Dynamic menu]: /templates/menus/
[Extremely fast]: https://github.com/bep/hugo-benchmark
[front matter]: /content-management/front-matter/
[functions]: /functions/
[Go]: https://golang.org/pkg/html/template/
[Google Analytics]: https://google-analytics.com/
[homepage]: /templates/homepage/
[hostanywhere]: /hosting-and-deployment/
[install]: /getting-started/installing/
[LiveReload]: /getting-started/usage/
[organization for your projects]: /getting-started/directory-structure/
[pagevars]: /variables/page/
[Permalink]: /content-management/urls/#permalinks
[Powerful theming]: /themes/
[Pretty URLs]: /content-management/urls/
[RSS]: /templates/rss/
[Shortcodes]: /content-management/shortcodes/
[sort content]: /templates/
[supported formats]: /content-management/formats/
[Syntax highlighting]: /tools/syntax-highlighting/
[table of contents]: /content-management/toc/
[taxonomies]: /content-management/taxonomies/
[URLs]: /content-management/urls/
