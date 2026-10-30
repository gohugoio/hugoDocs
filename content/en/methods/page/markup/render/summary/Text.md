---
title: Text
description: Returns the rendered summary.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: template.HTML
    signatures: [PAGE.Markup.Render.Summary.Text]
---

## Usage

The `Text` method on a `Summary` object returns the rendered summary. When you print a `Summary` object, Hugo prints the value returned by the `Text` method.

## Examples

```go-html-template
{{ .Markup.Render.Summary.Text }}
```

Printing the `Summary` object, which returns the same value:

```go-html-template
{{ .Markup.Render.Summary }}
```
