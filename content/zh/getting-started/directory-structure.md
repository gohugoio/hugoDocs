---
title: 目录结构
linktitle: 目录结构
description: Hugo 的 CLI「命令行」 构建了一个项目目录结构，然后使用这个目录作为输入来创建一个完整的网站。
date: 2017-01-02
publishdate: 2017-02-01
lastmod: 2021-11-10
categories: [getting started,fundamentals]
keywords: [source, organization, directories]
menu:
  docs:
    parent: "getting-started"
    weight: 50
weight: 50
sections_weight: 50
draft: false
aliases: [/overview/source-directory/]
toc: true
---

## New Site Scaffolding

{{< youtube sB0HLHjgQ7E >}}

从命令行运行 `hugo new site` 生成器将创建一个包含以下元素的目录结构:

```
.
├── archetypes
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes
```


## 目录结构阐述

下面是每个目录的高级概述，其中包含指向 Hugo 文档中每个章节的链接。

[`archetypes`](/content-management/archetypes/)
: 您可以使用 `hugo new` 命令在 Hugo 中创建新的内容文件。
默认情况下，Hugo 将创建至少包含 `date`、`title`（从文件名判断）和 `draft = true` 的新内容文件。 这可以节省时间并提高使用多种内容类型的网站的一致性。 您也可以使用自定义的预配置前台字段创建自己的 [原型][]。

[`assets`][]
: 存放 [Hugo Pipes](/hugo-pipes/) 需要处理的所有文件。 只有使用了 `.Permalink` 或 `.RelPermalink` 的文件才会发布到 `public` 目录。 注意：默认情况下不创建资产目录。

[`config`](/getting-started/configuration/)
: Hugo 附带了大量 [配置指令](https://gohugo.io/getting-started/configuration/#all-variables-yaml)。
[配置目录](/getting-started/configuration/#configuration-directory) 是将这些指令存储为 JSON、YAML 或 TOML 文件的位置。 每个根设置对象都可以作为自己的文件并由环境构成。
具有最少设置且不需要环境感知的项目可以在其根目录使用单个 `config.toml` 文件。

许多站点可能几乎不需要配置，但 Hugo 附带了大量 [配置指令][] 以提供有关您希望 Hugo 如何构建网站的更详细的指导。 注意：默认情况下不创建 config 目录。

[`content`][]
: 您网站的所有内容都将位于此目录中。 Hugo 中的每个顶级文件夹都被视为一个 [内容部分][]。 例如，如果您的站点有三个主要部分---`blog`、`articles` 和`tutorials`---你将在`content/blog`、`content/articles` 和`content/tutorials` 下拥有三个目录。 Hugo 使用部分来分配默认的 [内容类型][]。

[**`data`**][]
:这个目录用来存放配置文件，可以
Hugo 在生成您的网站时使用。 您可以使用 YAML、JSON 或 TOML 格式编写这些文件。 除了添加到此文件夹的文件之外，您还可以创建从动态内容中提取的 [数据模板][]。

[`layouts`][]
: 以 `.html` 文件的形式存储模板，这些文件指定如何将您的内容视图呈现到静态网站中。 模板包括 [list pages][lists]、您的 [homepage][]、[taxonomy templates][]、[partials][]、[single page templates][singles] 等等。

[`static`][]
: 存储所有静态内容：图像、CSS、JavaScript 等。当 Hugo 构建您的站点时，静态目录中的所有资产都按原样复制。 使用 `static` 文件夹的一个很好的例子是[在 Google Search Console 上验证网站所有权][searchconsole]，您希望 Hugo 复制完整的 HTML 文件而不修改其内容。

{{% note %}}
从 **Hugo 0.31** 开始，您可以拥有多个静态目录。
{{% /note %}}

资源
: 缓存一些文件以加快生成速度。 模板作者也可以使用它来分发构建的 SASS 文件，因此您不必安装预处理器。 注意：默认情况下不创建资源目录。


[原型]: /content-management/archetypes/
[配置指令]: /getting-started/configuration/#all-variables-yaml
[`content`]: /content-management/organization/
[内容部分]: /content-management/sections/
[content types]: /content-management/types/
[数据模板]: /templates/data-templates/
[homepage]: /templates/homepage/
[`layouts`]: /templates/
[`static`]: /content-management/static-files/
[lists]: /templates/list/
[pagevars]: /variables/page/
[partials]: /templates/partials/
[searchconsole]: https://support.google.com/analytics/answer/1142414?hl=en
[singles]: /templates/single-page-templates/
[starters]: /tools/starter-kits/
[taxonomies]: /content-management/taxonomies/
[taxonomy templates]: /templates/taxonomy-templates/
[types]: /content-management/types/
[`assets`]: /hugo-pipes/introduction#asset-directory"
[**`data`**]: /templates/data-templates/
