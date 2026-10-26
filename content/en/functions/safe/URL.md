---
title: safe.URL
description: Returns the given string declared as a safe URL or URL substring.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [safeURL]
    returnType: template.URL
    signatures: [safe.URL INPUT]
---

## Usage

The `safe.URL` function returns the given string declared as a safe URL or URL substring. Hugo considers URLs with schemes other than `http`, `https`, and `mailto` unsafe. Without a safe declaration, Hugo replaces an unsafe URL with `#ZgotmplZ`. With a safe declaration, Hugo still encodes characters such as spaces in the URL. See the [Go documentation][] for details.

Only use this function with content from a trusted source, because Hugo does not check the content for unsafe values. See [safe types][] for an explanation of how Hugo escapes values, and how each safe data type affects escaping.

## Examples

```go-html-template
{{ $href := "irc://irc.freenode.net/#golang" }}
<a href="{{ $href }}">IRC</a>
<a href="{{ $href | safe.URL }}">IRC</a>
```

The rendered output:

```html
<a href="#ZgotmplZ">IRC</a>
<a href="irc://irc.freenode.net/#golang">IRC</a>
```

[Go documentation]: https://pkg.go.dev/html/template#URL
[safe types]: /quick-reference/data-types/#safe-types
