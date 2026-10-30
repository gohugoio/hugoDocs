---
title: RenderString
description: Returns the given markup rendered to HTML.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: template.HTML
    signatures: ['PAGE.RenderString [OPTIONS] MARKUP']
---

## Usage

The `RenderString` method on a `Page` object is an alias for [`Page.Markup.RenderString`][].

## Examples

```go-html-template
{{ "An *emphasized* word" | .RenderString }}
```

[`Page.Markup.RenderString`]: /methods/page/markup/renderstring/
