---
title: safe.CSS
description: Returns the given string declared as safe CSS.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [safeCSS]
    returnType: template.CSS
    signatures: [safe.CSS INPUT]
---

## Usage

The `safe.CSS` function returns the given string declared as safe CSS. Use it with known safe content that matches one of these:

1. The CSS3 stylesheet production, such as `p { color: purple }`.
1. The CSS3 rule production, such as `a[href=~"https:"].foo#bar`.
1. CSS3 declaration productions, such as `color: red; margin: 2px`.
1. The CSS3 value production, such as `rgba(0, 0, 255, 127)`.

Without a safe declaration, Hugo replaces content that it cannot verify as safe in a CSS context with `ZgotmplZ`. In a `style` attribute, Hugo still escapes characters such as quotation marks and ampersands for the attribute. See the [Go documentation][] for details.

Only use this function with content from a trusted source, because Hugo does not check the content for unsafe values. See [safe types][] for an explanation of how Hugo escapes values, and how each safe data type affects escaping.

## Examples

```go-html-template
{{ $style := "color: red;" }}
<p style="{{ $style }}">foo</p>
<p style="{{ $style | safe.CSS }}">foo</p>
```

The rendered output:

```html
<p style="ZgotmplZ">foo</p>
<p style="color: red;">foo</p>
```

[Go documentation]: https://pkg.go.dev/html/template#CSS
[safe types]: /quick-reference/data-types/#safe-types
