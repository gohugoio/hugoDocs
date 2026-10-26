---
title: safe.HTML
description: Returns the given string declared as safe HTML.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [safeHTML]
    returnType: template.HTML
    signatures: [safe.HTML INPUT]
---

## Usage

The `safe.HTML` function returns the given string declared as safe HTML. Use it with a known safe HTML document fragment. Do not use it with HTML from a third party, or with HTML that has unclosed tags or comments. See the [Go documentation][] for details.

Only use this function with content from a trusted source, because Hugo does not check the content for unsafe values. See [safe types][] for an explanation of how Hugo escapes values, and how each safe data type affects escaping.

## Examples

```go-html-template
{{ safe.HTML "<em>emphasized</em>" }} → <em>emphasized</em>
```

Comparing the result with and without `safe.HTML`, showing the raw HTML output:

```go-html-template
{{ "<em>emphasized</em>" }} → &lt;em&gt;emphasized&lt;/em&gt;
{{ "<em>emphasized</em>" | safe.HTML }} → <em>emphasized</em>
```

[Go documentation]: https://pkg.go.dev/html/template#HTML
[safe types]: /quick-reference/data-types/#safe-types
