---
title: Len
description: Returns the length, in bytes, of the rendered content of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: int
    signatures: [PAGE.Len]
---

```go-html-template
{{ .Len }} → 42
```

To render the content within a named scope, call the `Len` method on the `Content` object returned by `.Markup.Render`. See the [`Markup`][] method on a `Page` object.

[`Markup`]: /methods/page/markup/
