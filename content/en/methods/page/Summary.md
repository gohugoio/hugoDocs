---
title: Summary
description: Returns the summary of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: template.HTML
    signatures: [PAGE.Summary]
---

## Usage

The `Summary` method on a `Page` object is an alias for [`Page.Markup.Render.Summary`][]. It returns the rendered summary, equivalent to `Page.Markup.Render.Summary.Text`.

## Examples

```go-html-template
{{ .Summary }}
```

[`Page.Markup.Render.Summary`]: /methods/page/markup/render/summary/
