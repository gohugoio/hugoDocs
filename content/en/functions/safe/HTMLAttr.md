---
title: safe.HTMLAttr
description: Returns the given key-value pair declared as a safe HTML attribute.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [safeHTMLAttr]
    returnType: template.HTMLAttr
    signatures: [safe.HTMLAttr INPUT]
---

## Usage

The `safe.HTMLAttr` function returns the given key-value pair declared as a safe HTML attribute. Pass the attribute name, an equals sign, and the quoted attribute value as a single string, such as `datetime="2024-05-26T07:19:55+02:00"`. See the [Go documentation][] for details.

Only use this function with content from a trusted source, because Hugo does not check the content for unsafe values. See [safe types][] for an explanation of how Hugo escapes values, and how each safe data type affects escaping.

## Examples

```go-html-template
{{ $date := "2024-05-26T07:19:55+02:00" }}
<time datetime="{{ $date }}">26 May 2024</time>
<time {{ printf "datetime=%q" $date | safe.HTMLAttr }}>26 May 2024</time>
```

The rendered output:

```html
<time datetime="2024-05-26T07:19:55&#43;02:00">26 May 2024</time>
<time datetime="2024-05-26T07:19:55+02:00">26 May 2024</time>
```

[Go documentation]: https://pkg.go.dev/html/template#HTMLAttr
[safe types]: /quick-reference/data-types/#safe-types
