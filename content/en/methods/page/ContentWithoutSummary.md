---
title: ContentWithoutSummary
description: Returns the rendered content of the given page, excluding the content summary.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: template.HTML
    signatures: [PAGE.ContentWithoutSummary]
---

Applicable when using manual or automatic [content summaries][], the `ContentWithoutSummary` method on a `Page` object renders Markdown and shortcodes to HTML, excluding the content summary from the result.

```go-html-template
{{ .ContentWithoutSummary }}
```

The `ContentWithoutSummary` method returns the same as `Content` if you define the content summary in front matter.

To render the content in a named scope, call [`Markup.Render.ContentWithoutSummary`][] on a `Page` object.

[`Markup.Render.ContentWithoutSummary`]: /methods/page/markup/#contentwithoutsummary
[content summaries]: /content-management/summaries/#manual-summary
