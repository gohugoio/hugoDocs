---
title: 配置标记
description: 如何处理 Markdown 和其他标记相关的配置。
date: 2019-11-15
lastmod: 2021-11-10
categories: [getting started,fundamentals]
keywords: [configuration,highlighting]
weight: 65
sections_weight: 65
slug: configuration-markup
toc: true
---

## 配置标记

{{< new-in "0.60.0" >}}

有关 Hugo 中默认 Markdown 处理程序的相关设置，请参阅 [Goldmark](#goldmark)。

以下是 Hugo 中所有与标记相关的配置及其默认设置：

{{< code-toggle config="markup" />}}

**有关详细信息，请参阅下面的每个部分。**

### Goldmark

[Goldmark](https://github.com/yuin/goldmark/) 来自 Hugo 0.60 的 Markdown 默认库。 它很快，它符合 [CommonMark](https://spec.commonmark.org/0.29/) 并且非常灵活。 请注意，Goldmark 与 Blackfriday 的功能集不同； 你会得到很多，但也会失去一些，但我们将努力弥合即将到来的 Hugo 版本中的任何差距。

这是默认配置：

{{< code-toggle config="markup.goldmark" />}}

有关扩展的详细信息，请参阅 Goldmark 文档的 [这一节](https://github.com/yuin/goldmark/#built-in-extensions)

一些设置阐述：

unsafe
: 默认情况下，Goldmark 不渲染原始 HTML 和潜在危险的链接。 如果您有很多内联 HTML 和/或 JavaScript，您可能需要打开它。

typographer
: 此扩展程序用 [smartypants](https://daringfireball.net/projects/smartypants/) 等排版实体替换标点符号。

attribute
: 通过在单个大括号内添加属性列表（`{.myclass class="class1 class2" }`）并将其放置_在它装饰的 Markdown 元素之后_、标题和新的同一行上，启用对标题和块的自定义属性支持 块的正下方行。

{{< new-in "0.81.0" >}} 在 Hugo 0.81.0 中，我们添加了对将属性（例如 CSS 类）添加到 Markdown 块的支持，例如 表格、列表、段落等。

带有 CSS 类的块引用：

```md
> foo
> bar
{.myclass}
```

当前有一些限制：对于表，您目前只能将其应用于完整表，对于列表，仅适用于 `ul`/`ol` 节点，例如：

```md
* Fruit
  * Apple
  * Orange
  * Banana
  {.fruits}
* Dairy
  * Milk
  * Cheese
  {.dairies}
{.list}
```

请注意，[代码围栏](/content-management/syntax-highlighting/#highlighting-in-code-fences) 中的属性必须在开始标记之后，以及任何其他突出显示处理指令，例如：

````
```go {.myclass linenos=table,hl_lines=[8,"15-17"],linenostart=199}
// ... code
```
````

autoHeadingIDType ("github") {{< new-in "0.62.2" >}}
: 用于创建自动 ID（锚点名称）的策略。 可用的类型有 `github`、`github-ascii` 和 `blackfriday`。 `github` 生成与 GitHub 兼容的 ID，`github-ascii` 将在重音规范化后删除任何非 Ascii 字符，而 `blackfriday` 将使 ID 与 [Blackfriday](#blackfriday) 一样工作，Hugo 之前的默认 Markdown 引擎 0.60。 请注意，如果 Goldmark 是您的默认 Markdown 引擎，这也是 [anchorize](/functions/anchorize/) 模板函数中使用的策略。

### Blackfriday

[Blackfriday](https://github.com/russross/blackfriday) 是 Hugo 的默认 Markdown 渲染引擎，现在替换为 Goldmark。 但您仍然可以使用它：只需在顶级 `markup` 配置中将 `defaultMarkdownHandler` 设置为 `blackfriday`。

这是默认配置：

{{< code-toggle config="markup.blackFriday" />}}

### Highlight

这是默认的“highlight”配置。 请注意，其中一些设置可以针对每个代码块进行设置，请参阅 [语法高亮](/content-management/syntax-highlighting/)。

{{< code-toggle config="markup.highlight" />}}

对于`style`，请参见这些画廊：

* [短片段](https://xyproto.github.io/splash/docs/all.html)
* [长片段](https://xyproto.github.io/splash/docs/longer/all.html)

对于 CSS，请参阅 [生成语法高亮 CSS](/content-management/syntax-highlighting/#generate-syntax-highlighter-css)。

### 目录「TOC」

{{< code-toggle config="markup.tableOfContents" />}}

这些设置仅适用于 Goldmark 渲染器：

开始级别
: 标题级别，值从 1 (`h1`) 开始，开始渲染目录。

终级
: 标题级别，包括，停止渲染目录。

订购
: 是否生成有序列表而不是无序列表。

## Markdown Render Hooks

{{< new-in "0.62.0" >}}

请注意，这仅受 [Goldmark](#goldmark) 渲染器支持。

渲染钩子允许自定义模板覆盖降价渲染功能。 您可以通过在 `layouts/_default/_markup` 中创建具有基本名称 `render-{feature}` 的模板来实现此目的。

您还可以在 `layouts/[type/section]/_markup` 中创建类型/部分特定的钩子，例如：`layouts/blog/_markup`。{{< new-in "0.71.0" >}}

目前支持的功能有：

* `image`
* `link`
* `heading` {{< new-in "0.71.0" >}}

如果需要，您可以定义 [Output-Format-](/templates/output-formats) 和 [language-](/content-management/multilingual/) 特定模板。 您的 `layouts` 文件夹可能如下所示：

```bash
layouts
└── _default
    └── _markup
        ├── render-image.html
        ├── render-image.rss.xml
        └── render-link.html
```

以上的一些用例：

* 使用`.GetPage` 解析链接引用。 这将使链接具有可移植性，因为您可以将 `./my-post.md`（以及可以在 GitHub 上运行的类似结构）转换为 `/blog/2019/01/01/my-post/` 等。
* 添加`target=_blank` 到外部链接。
* 解析和[处理](/content-management/image-processing/) 图像。
* 添加[标题链接](https://remysharp.com/2014/08/08/automatic-permalinks-for-blog-posts)。

### 渲染钩子模板

`render-link` 和 `render-image` 模板将接收以下上下文：

Page
：正在渲染的 [Page](/variables/page/)。

Destination
: URL.

Title
: 标题属性。

Text
：渲染的 (HTML) 链接文本。

PlainText
: 上面的普通变体。

`render-heading` 模板将接收以下上下文：

Level
: 标题级别 (1--6)

Anchor
: 页面内标题唯一的自动生成的 html id

Attributes (map) {{< new-in "0.82.0" >}}
：属性映射（例如`id`、`class`）

#### 带有标题 Markdown 示例的链接

```md
[Text](https://www.gohugo.io "Title")
```

以下是 render-link.html 模板外观的代码示例：

{{< code file="layouts/_default/_markup/render-link.html" >}}
<a href="{{ .Destination | safeURL }}"{{ with .Title}} title="{{ . }}"{{ end }}{{ if strings.HasPrefix .Destination "http" }} target="_blank" rel="noopener"{{ end }}>{{ .Text | safeHTML }}</a>
{{< /code >}}

#### Markdown 图像示例

```md
![Text](https://d33wubrfki0l68.cloudfront.net/c38c7334cc3f23585738e40334284fddcaf03d5e/2e17c/images/hugo-logo-wide.svg "Title")
```

以下是 render-image.html 模板外观的代码示例：

{{< code file="layouts/_default/_markup/render-image.html" >}}
<p class="md__image">
  <img src="{{ .Destination | safeURL }}" alt="{{ .Text }}" {{ with .Title}} title="{{ . }}"{{ end }} />
</p>
{{< /code >}}

#### 标题链接示例

鉴于此模板文件

{{< code file="layouts/_default/_markup/render-heading.html" >}}
<h{{ .Level }} id="{{ .Anchor | safeURL }}">{{ .Text | safeHTML }} <a href="#{{ .Anchor | safeURL }}">¶</a></h{{ .Level }}>
{{< /code >}}

还有这个 markdown

```md
### Section A
```

渲染的 html 将是

```html
<h3 id="section-a">Section A <a href="#section-a">¶</a></h3>
```
