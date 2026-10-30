---
title: Plain
description: Returns the rendered content of the given page, removing all HTML tags.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Plain]
---

## Usage

The `Plain` method on a `Page` object is an alias for [`Page.Markup.Render.Plain`][].

## Examples

```go-html-template
{{ .Plain }}
```

[`Page.Markup.Render.Plain`]: /methods/page/markup/render/plain/
