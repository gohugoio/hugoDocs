---
title: transform.HTMLToMarkdown
description: Returns the given HTML converted to Markdown.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [transform.HTMLToMarkdown INPUT]
---

{{< new-in 0.151.0 />}}

## Usage

The `transform.HTMLToMarkdown` function returns the given HTML converted to Markdown, using the [`html-to-markdown`][] Go package.

> [!NOTE]
> This function is experimental and its API may change in the future.

The function uses these `html-to-markdown` plugins to perform the conversion:

Plugin|Description
:--|:--
Base|Implements basic shared functionality
CommonMark|Implements Markdown according to the [CommonMark][] specification
Table|Implements tables according to the [GitHub Flavored Markdown][] specification

## Examples

```go-html-template
{{ transform.HTMLToMarkdown "<p>An <em>emphasized</em> word</p>" }} → An *emphasized* word
```

Converting the content of the current page:

```go-html-template
{{ .Content | transform.HTMLToMarkdown | safeHTML }}
```

[CommonMark]: https://spec.commonmark.org/current/
[GitHub Flavored Markdown]: https://github.github.com/gfm/
[`html-to-markdown`]: https://github.com/JohannesKaufmann/html-to-markdown?tab=readme-ov-file#readme
