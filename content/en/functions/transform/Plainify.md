---
title: transform.Plainify
description: Returns the given input with all HTML tags removed.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [plainify]
    returnType: any
    signatures: [transform.Plainify INPUT]
---

## Usage

The `transform.Plainify` function returns the given input with all HTML tags removed.

{{< new-in 0.169.0 />}}

The return type depends on the type of `INPUT`. If `INPUT` is of type `template.HTML`, the function returns `template.HTML`. Otherwise, it returns a `string`.

Go's [`html/template`][] package treats `template.HTML` values as trusted and does not escape them. Pass a `template.HTML` value, such as the result of the [`safe.HTML`][] function, to keep HTML entities in the result from being escaped again.

## Examples

```go-html-template
{{ transform.Plainify "<b>BatMan</b>" }} → BatMan
```

Comparing `string` and `template.HTML` input, showing the raw HTML output:

```go-html-template
{{ "<b>Lilo &amp; Stitch</b>" | transform.Plainify }} → Lilo &amp;amp; Stitch
{{ "<b>Lilo &amp; Stitch</b>" | safeHTML | transform.Plainify }} → Lilo &amp; Stitch
```

[`html/template`]: https://pkg.go.dev/html/template
[`safe.HTML`]: /functions/safe/html/
