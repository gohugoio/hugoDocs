---
title: transform.Markdownify
description: Returns the given Markdown rendered to HTML.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [markdownify]
    returnType: template.HTML
    signatures: [transform.Markdownify INPUT]
---

## Usage

The `transform.Markdownify` function returns the given Markdown rendered to HTML.

If the resulting HTML is a single paragraph, Hugo removes the wrapping `p` tags to produce inline HTML. To keep the wrapping `p` tags for a single paragraph, use the [`RenderString`][] method on the `Page` object, setting the `display` option to `block`.

> [!NOTE]
> Although the `transform.Markdownify` function honors [Markdown render hooks][] when rendering Markdown to HTML, use the `RenderString` method instead if a render hook accesses `.Page` context. See issue [#9692][] for details.

## Examples

```go-html-template
{{ transform.Markdownify "An *emphasized* word" }} → An <em>emphasized</em> word
```

Rendering a page title as inline HTML:

```go-html-template
<h2>{{ .Title | transform.Markdownify }}</h2>
```

[#9692]: https://github.com/gohugoio/hugo/issues/9692
[Markdown render hooks]: /render-hooks/
[`RenderString`]: /methods/page/renderstring/
