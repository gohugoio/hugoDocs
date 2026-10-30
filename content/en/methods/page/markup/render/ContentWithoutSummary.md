---
title: ContentWithoutSummary
description: Returns the rendered content of the given page, excluding the content summary.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.ContentWithoutSummary]
    returnType: template.HTML
    signatures: [PAGE.Markup.Render.ContentWithoutSummary]
---

## Usage

Applicable when using manual or automatic [content summaries][], the `ContentWithoutSummary` method on a `Content` object renders Markdown and shortcodes to HTML, excluding the content summary from the result.

The `ContentWithoutSummary` method returns the same as the [`Content`][] method if you define the content summary in front matter.

## Examples

```go-html-template
{{ .Markup.Render.ContentWithoutSummary }}
```

[`Content`]: /methods/page/markup/render/content/
[content summaries]: /content-management/summaries/#manual-summary
