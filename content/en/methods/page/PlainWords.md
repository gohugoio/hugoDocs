---
title: PlainWords
description: Returns a slice of words created by calling the Plain method and splitting the result.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: '[]string'
    signatures: [PAGE.PlainWords]
---

## Usage

The `PlainWords` method on a `Page` object is an alias for [`Page.Markup.Render.PlainWords`][].

## Examples

```go-html-template
{{ .PlainWords }}
```

[`Page.Markup.Render.PlainWords`]: /methods/page/markup/render/plainwords/
