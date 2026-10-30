---
title: RenderShortcodes
description: Returns the content of the given page with all shortcodes rendered, preserving the surrounding markup.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: template.HTML
    signatures: [PAGE.RenderShortcodes]
---

## Usage

The `RenderShortcodes` method on a `Page` object is an alias for [`Page.Markup.RenderShortcodes`][].

## Examples

```go-html-template
{{ .RenderShortcodes }}
```

[`Page.Markup.RenderShortcodes`]: /methods/page/markup/rendershortcodes/
