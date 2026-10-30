---
title: Content
description: Returns the rendered content of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.Content]
    returnType: template.HTML
    signatures: [PAGE.Markup.Render.Content]
---

## Usage

The `Content` method on a `Content` object renders Markdown and shortcodes to HTML.

## Examples

```go-html-template
{{ .Markup.Render.Content }}
```
