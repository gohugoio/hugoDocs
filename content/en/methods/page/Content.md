---
title: Content
description: Returns the rendered content of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: template.HTML
    signatures: [PAGE.Content]
---

The `Content` method on a `Page` object renders Markdown and shortcodes to HTML.

```go-html-template
{{ .Content }}
```

To render the content within a named scope, call the `Content` method on the `Content` object returned by `.Markup.Render`. See the [`Markup`][] method on a `Page` object.

[`Markup`]: /methods/page/markup/
