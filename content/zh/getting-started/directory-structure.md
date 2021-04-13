---
title: 目录结构
linktitle: 目录结构
description: Hugo 的 CLI 构建了一个项目目录结构，然后把这个单一的目录作为输入来创建一个完整的网站。
date: 2017-01-02
publishdate: 2017-02-01
lastmod: 2021-04-13
categories: [入门,基础]
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

## 新网站框架

{{< youtube sB0HLHjgQ7E >}}

从命令行运行 `hugo new site` 生成器，Hugo 将创建一个包含以下内容的目录结构：

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


## 目录结构说明

以下是每个目录的简要概述，并附有 Hugo 文档中各部分的链接。

[`archetypes`](/content-management/archetypes/)
: 你可以使用 `hugo new` 命令在 Hugo 中创建新的内容文件。
默认情况下，Hugo 创建新的内容文件至少要有 `date`、`title`（从文件名推断）和 `draft = true`。这对于使用多种内容类型的网站来说，可以节省时间并促进一致性。你也可以创建你自己的[archetypes][]与自定义预配置的 front matter 字段。

[`assets`][]
: 存储所有需要由 [Hugo 管道]({{< ref "/hugo-pipes" >}})处理的文件。只有使用了 `.Permalink` 或 `.RelPermalink` 的文件才会被发布到 `public` 目录下。注意：assets 目录不是默认创建的。

[`config`](/getting-started/configuration/)
: Hugo 提供了大量的[配置指令](https://gohugo.io/getting-started/configuration/#all-variables-yaml)。
[配置目录](/getting-started/configuration/#configuration-directory)是这些指令以 JSON、YAML 或 TOML 文件形式存储的地方。每个根设置对象都可以作为自己的文件，并按环境进行结构化。
设置最少、对环境不敏感的项目可以在其根目录使用单个 `config.toml` 文件。

很多网站可能只需要很少的配置，但 Hugo 内置了大量的[配置指令][]，可以更细化的指导你如何让 Hugo 建立你的网站。注意：默认情况下 config 目录不会被创建。

[`content`][]
: 你网站的所有内容都将存在这个目录里面。Hugo 中的每个顶级文件夹都被视为一个[content section][]。例如，如果你的网站有三个主要栏目：`blog`、`articles` 和 `tutorials`，你将有三个目录，分别是 `content/blog`、`content/articles` 和 `content/tutorials`。Hugo 使用 sections 来分配默认的[content types][]。

[`data`](/templates/data-templates/)
: 该目录用于存储可被用于的配置文件。
在生成您的网站时，由 Hugo 使用。你可以将这些文件写成YAML、JSON或TOML格式。除了你添加到这个文件夹的文件，你还可以创建[data templates][]，从动态内容中提取。

[`layouts`][]
: 以`.html`文件的形式存储模板，指定您的内容的视图将如何呈现在静态网站中。模板包括 [list pages][lists]，您的[homepage][]，[taxonomy templates][]，[partials][]，[single page templates][singles]等。

[`static`][]
: 存储所有静态内容：图片、CSS、JavaScript等。当 Hugo 构建您的网站时，静态目录中的所有资产都会被原样复制过来。使用 `static` 文件夹的一个很好的例子是[在Google Search Console上验证网站所有权][searchconsole]，你想让 Hugo 复制一个完整的 HTML 文件而不修改其内容。

{{% note %}}
从 **Hugo 0.31** 开始，你可以拥有多个静态目录。
{{% /note %}}

resources
: 缓存一些文件以加快生成速度。也可以被模板作者用来发布构建好的SASS文件，所以你不必安装预处理器。注意：resource 目录默认不会被创建。


[archetypes]: /content-management/archetypes/
[configuration directives]: /getting-started/configuration/#all-variables-yaml
[`content`]: /content-management/organization/
[content section]: /content-management/sections/
[content types]: /content-management/types/
[data templates]: /templates/data-templates/
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
[`assets`]: {{< ref "/hugo-pipes/introduction#asset-directory" >}}
