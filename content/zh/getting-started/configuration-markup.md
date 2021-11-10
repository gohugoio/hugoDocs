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

## Configure Markup

{{< new-in "0.60.0" >}}

有关 Hugo 中默认 Markdown 处理程序的相关设置，请参阅 [Goldmark](#goldmark)。

以下是 Hugo 中所有与标记相关的配置及其默认设置：

{{< code-toggle config="markup" />}}

**有关详细信息，请参阅下面的每个部分。**

### Goldmark

[Goldmark](https://github.com/yuin/goldmark/) 来自 Hugo 0.60 的 Markdown 默认库。 它很快，它符合 [CommonMark](https://spec.commonmark.org/0.29/) 并且非常灵活。 请注意，Goldmark 与 Blackfriday 的功能集不同； 你会得到很多，但也会失去一些，但我们将努力弥合即将到来的 Hugo 版本中的任何差距。

这是默认配置：

{{< code-toggle config="markup.goldmark" />}}

For details on the extensions, refer to [this section](https://github.com/yuin/goldmark/#built-in-extensions) of the Goldmark documentation

Some settings explained:

unsafe
: By default, Goldmark does not render raw HTMLs and potentially dangerous links. If you have lots of inline HTML and/or JavaScript, you may need to turn this on.

typographer
: This extension substitutes punctuations with typographic entities like [smartypants](https://daringfireball.net/projects/smartypants/).

attribute
: Enable custom attribute support for titles and blocks by adding attribute lists inside single curly brackets (`{.myclass class="class1 class2" }`) and placing it _after the Markdown element it decorates_, on the same line for titles and on a new line directly below for blocks.

{{< new-in "0.81.0" >}} In Hugo 0.81.0 we added support for adding attributes (e.g. CSS classes) to Markdown blocks, e.g. tables, lists, paragraphs etc.

A blockquote with a CSS class:

```md
> foo
> bar
{.myclass}
```

There are some current limitations: For tables you can currently only apply it to the full table, and for lists the `ul`/`ol`-nodes only, e.g.:

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

Note that attributes in [code fences](/content-management/syntax-highlighting/#highlighting-in-code-fences) must come after the opening tag, with any other highlighting processing instruction, e.g.:

````
```go {.myclass linenos=table,hl_lines=[8,"15-17"],linenostart=199}
// ... code
```
````

autoHeadingIDType ("github") {{< new-in "0.62.2" >}}
: The strategy used for creating auto IDs (anchor names). Available types are `github`, `github-ascii` and `blackfriday`. `github` produces GitHub-compatible IDs, `github-ascii` will drop any non-Ascii characters after accent normalization, and `blackfriday` will make the IDs work as with [Blackfriday](#blackfriday), the default Markdown engine before Hugo 0.60. Note that if Goldmark is your default Markdown engine, this is also the strategy used in the [anchorize](/functions/anchorize/) template func.

### Blackfriday


[Blackfriday](https://github.com/russross/blackfriday) was Hugo's default Markdown rendering engine, now replaced with Goldmark. But you can still use it: Just set `defaultMarkdownHandler` to `blackfriday` in your top level `markup` config.

This is the default config:

{{< code-toggle config="markup.blackFriday" />}}

### Highlight

This is the default `highlight` configuration. Note that some of these settings can be set per code block, see [Syntax Highlighting](/content-management/syntax-highlighting/).

{{< code-toggle config="markup.highlight" />}}

For `style`, see these galleries:

* [Short snippets](https://xyproto.github.io/splash/docs/all.html)
* [Long snippets](https://xyproto.github.io/splash/docs/longer/all.html)

For CSS, see [Generate Syntax Highlighter CSS](/content-management/syntax-highlighting/#generate-syntax-highlighter-css).

### Table Of Contents

{{< code-toggle config="markup.tableOfContents" />}}

These settings only works for the Goldmark renderer:

startLevel
: The heading level, values starting at 1 (`h1`), to start render the table of contents.

endLevel
: The heading level, inclusive, to stop render the table of contents.

ordered
: Whether or not to generate an ordered list instead of an unordered list.


## Markdown Render Hooks

{{< new-in "0.62.0" >}}

Note that this is only supported with the [Goldmark](#goldmark) renderer.

Render Hooks allow custom templates to override markdown rendering functionality. You can do this by creating templates with base names `render-{feature}` in `layouts/_default/_markup`.

You can also create type/section specific hooks in `layouts/[type/section]/_markup`, e.g.: `layouts/blog/_markup`.{{< new-in "0.71.0" >}}

The features currently supported are:

* `image`
* `link`
* `heading` {{< new-in "0.71.0" >}}

You can define [Output-Format-](/templates/output-formats) and [language-](/content-management/multilingual/)specific templates if needed. Your `layouts` folder may look like this:

```bash
layouts
└── _default
    └── _markup
        ├── render-image.html
        ├── render-image.rss.xml
        └── render-link.html
```

Some use cases for the above:

* Resolve link references using `.GetPage`. This would make links portable as you could translate `./my-post.md` (and similar constructs that would work on GitHub) into `/blog/2019/01/01/my-post/` etc.
* Add `target=_blank` to external links.
* Resolve and [process](/content-management/image-processing/) images.
* Add [header links](https://remysharp.com/2014/08/08/automatic-permalinks-for-blog-posts).

### Render Hook Templates

The `render-link` and `render-image` templates will receive this context:

Page
: The [Page](/variables/page/) being rendered.

Destination
: The URL.

Title
: The title attribute.

Text
: The rendered (HTML) link text.

PlainText
: The plain variant of the above.

The `render-heading` template will receive this context:

Page
: The [Page](/variables/page/) being rendered.

Level
: The header level (1--6)

Anchor
: An auto-generated html id unique to the header within the page

Text
: The rendered (HTML) text.

PlainText
: The plain variant of the above.

Attributes (map) {{< new-in "0.82.0" >}}
: A map of attributes (e.g. `id`, `class`)

#### Link with title Markdown example:

```md
[Text](https://www.gohugo.io "Title")
```

Here is a code example for how the render-link.html template could look:

{{< code file="layouts/_default/_markup/render-link.html" >}}
<a href="{{ .Destination | safeURL }}"{{ with .Title}} title="{{ . }}"{{ end }}{{ if strings.HasPrefix .Destination "http" }} target="_blank" rel="noopener"{{ end }}>{{ .Text | safeHTML }}</a>
{{< /code >}}

#### Image Markdown example:

```md
![Text](https://d33wubrfki0l68.cloudfront.net/c38c7334cc3f23585738e40334284fddcaf03d5e/2e17c/images/hugo-logo-wide.svg "Title")
```

Here is a code example for how the render-image.html template could look:

{{< code file="layouts/_default/_markup/render-image.html" >}}
<p class="md__image">
  <img src="{{ .Destination | safeURL }}" alt="{{ .Text }}" {{ with .Title}} title="{{ . }}"{{ end }} />
</p>
{{< /code >}}

#### Heading link example

Given this template file

{{< code file="layouts/_default/_markup/render-heading.html" >}}
<h{{ .Level }} id="{{ .Anchor | safeURL }}">{{ .Text | safeHTML }} <a href="#{{ .Anchor | safeURL }}">¶</a></h{{ .Level }}>
{{< /code >}}

And this markdown

```md
### Section A
```

The rendered html will be

```html
<h3 id="section-a">Section A <a href="#section-a">¶</a></h3>
```
