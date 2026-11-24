---
title: Passthrough render hooks
linkTitle: Passthrough
description: Create passthrough render hook templates to override the rendering of text snippets captured by the Goldmark Passthrough extension.
keywords: []
---

## Usage

A passthrough render hook is a [Markdown render hook][] that overrides the rendering of passthrough elements. Use it to convert the raw content of each element to HTML, such as rendering mathematical expressions written in the LaTeX markup language.

Hugo uses [Goldmark][] to render Markdown to HTML. The Goldmark [Passthrough][] extension captures and preserves raw Markdown within delimited snippets of text, including the delimiters themselves. These are known as _passthrough elements_. Without a passthrough render hook, Hugo renders passthrough elements unchanged.

Depending on your choice of delimiters, Hugo classifies a passthrough element as either _block_ or _inline_. For example:

```md {file="content/example.md"}
This is a

\[block\]

passthrough element with opening and closing block delimiters.

This is an \(inline\) passthrough element with opening and closing inline delimiters.
```

To enable the Passthrough extension, update your project configuration and define the opening and closing delimiters for each passthrough element type, either `block` or `inline`. For example:

{{< code-toggle file=hugo >}}
[markup.goldmark.extensions.passthrough]
enable = true
[markup.goldmark.extensions.passthrough.delimiters]
block = [['\[', '\]'], ['$$', '$$']]
inline = [['\(', '\)']]
{{< /code-toggle >}}

In the example above there are two sets of `block` delimiters. You can use either one in your Markdown.

The Passthrough extension is often used with the MathJax or KaTeX display engine to render [mathematical expressions][] written in the LaTeX markup language.

## Context

Passthrough render hook templates receive the following [context](g):

`Attributes`
: (`map`) The [Markdown attributes][], available if you configure your project as follows:

  {{< code-toggle file=hugo >}}
  [markup.goldmark.parser.attribute]
  block = true
  {{< /code-toggle >}}

  Hugo populates the `Attributes` map for _block_ passthrough elements. Markdown attributes are not applicable to _inline_ elements.

`Inner`
: (`string`) The inner content of the passthrough element, excluding the delimiters.

`Ordinal`
: (`int`) The zero-based ordinal of the passthrough element on the page.

`Page`
: (`page`) A reference to the current page.

`PageInner`
: (`page`) A reference to the [nested page][] when rendering content inserted by the [`RenderShortcodes`][] method. Otherwise, a reference to the current page.

`Position`
: ([`text.Position`][]) The position of the passthrough element within the page content. Calculating the position can be expensive, so call this method only when you log an error or warning.

`Type`
: (`string`) The passthrough element type, either `block` or `inline`.

## Template selection

Hugo selects a passthrough render hook template from a `_markup` directory using the [template lookup order][]. Name the template `render-passthrough.html`, and optionally include page kind, custom layout, output format, and language identifiers in the file name, such as `render-passthrough.rss.xml`. Place the `_markup` directory at any level of the `layouts` directory to limit the template to pages in a given section.

To use a different template for a given passthrough element [`Type`](#type), append the type to the base name. Hugo uses `render-passthrough.html` for all other types:

```tree
layouts/
└── _markup/
    ├── render-passthrough-block.html
    └── render-passthrough.html
```

## Examples

To render mathematical markup to HTML when you build your project, instead of rendering it in the browser with MathJax or KaTeX, call the [`transform.ToMath`][] function:

```go-html-template {file="layouts/_markup/render-passthrough.html" copy=true}
{{- $opts := dict "output" "htmlAndMathml" "displayMode" (eq .Type "block") }}
{{- with try (transform.ToMath .Inner $opts) }}
  {{- with .Err }}
    {{- errorf "Unable to render mathematical markup to HTML using the transform.ToMath function. The KaTeX display engine threw the following error: %s: see %s." . $.Position }}
  {{- else }}
    {{- .Value }}
    {{- $.Page.Store.Set "hasMath" true }}
  {{- end }}
{{- end -}}
```

Then, in your _base_ template, conditionally include the KaTeX CSS within the `head` element. The [noop](g) statement forces Hugo to render the content before the template checks the value of `hasMath` with the `Store.Get` method:

```go-html-template {file="layouts/baseof.html" copy=true}
<head>
  {{ $noop := .WordCount }}
  {{ if .Page.Store.Get "hasMath" }}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.18.4/dist/katex.min.css" integrity="sha384-u1zONI5gPXUx0UKI62c75/zww972y0v2rSK5ZYlVdS6xEuWDeZWUI66v6t1gvlXJ" crossorigin="anonymous">
  {{ end }}
</head>
```

[Goldmark]: https://github.com/yuin/goldmark
[Markdown attributes]: /content-management/markdown-attributes/
[Markdown render hook]: /render-hooks/introduction/
[Passthrough]: /configuration/markup/#passthrough
[`RenderShortcodes`]: /methods/page/rendershortcodes/
[`text.Position`]: /quick-reference/data-types/#source-position
[`transform.ToMath`]: /functions/transform/tomath/
[mathematical expressions]: /content-management/mathematics/
[nested page]: /render-hooks/introduction/#nested-pages
[template lookup order]: /templates/lookup-order/
