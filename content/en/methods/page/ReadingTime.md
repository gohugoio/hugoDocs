---
title: ReadingTime
description: Returns the estimated reading time, in minutes, for the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: int
    signatures: [PAGE.ReadingTime]
---

## Usage

The `ReadingTime` method on a `Page` object is an alias for [`Page.Markup.Render.ReadingTime`][].

## Examples

```go-html-template
{{ .ReadingTime }}
```

[`Page.Markup.Render.ReadingTime`]: /methods/page/markup/render/readingtime/
