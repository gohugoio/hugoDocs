---
title: strings.FindRESubmatch
description: Returns a slice of all successive matches of the regular expression and its subexpressions.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [findRESubmatch]
    returnType: '[][]string'
    signatures: ['strings.FindRESubmatch PATTERN STRING [LIMIT]']
---

## Usage

The `strings.FindRESubmatch` function returns a slice of all successive matches of the regular expression. Each element is a slice of strings holding the text of the leftmost match of the regular expression and the matches, if any, of its subexpressions.

If a subexpression matches an empty string, or does not participate in the match, its element is an empty string.

By default, the function finds all matches. To limit the number of matches, pass the optional `LIMIT` argument. A return value of `nil` indicates no match.

{{% include "/_common/regular-expressions.md" %}}

## Examples

```go-html-template
{{ strings.FindRESubmatch `a(x+)b` "-axb-axxb-" }} → [[axb x] [axxb xx]]
{{ strings.FindRESubmatch `a(x+)b` "-axb-axxb-" 1 }} → [[axb x]]
{{ strings.FindRESubmatch `a(x+)b` "-ab-" }} → []
```

Markdown containing two links:

```md {file="content/example.md"}
- [Example](https://example.org)
- [Hugo](https://gohugo.io)
```

Capturing the text and destination of each link in the rendered content:

```go-html-template
{{ $regex := `<a\s+href="(.+?)">(.+?)</a>` }}
{{ range strings.FindRESubmatch $regex .Content }}
  {{ index . 2 }}: {{ index . 1 }}
{{ end }}
```

The rendered output:

```text
Example: https://example.org
Hugo: https://gohugo.io
```
