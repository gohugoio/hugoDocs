---
title: strings.FindRE
description: Returns a slice of strings that match the regular expression.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [findRE]
    returnType: '[]string'
    signatures: ['strings.FindRE PATTERN STRING [LIMIT]']
---

## Usage

The `strings.FindRE` function returns a slice of strings that match the regular expression. By default, the function finds all matches. To limit the number of matches, pass the optional `LIMIT` argument.

{{% include "/_common/regular-expressions.md" %}}

## Examples

```go-html-template
{{ strings.FindRE `a.` "paranormal" }} → [ar an al]
{{ strings.FindRE `a.` "paranormal" 2 }} → [ar an]
```

Finding all second-level headings (`h2` elements) within the rendered content, where the `s` flag causes `.` to match `\n` as well:

```go-html-template
{{ strings.FindRE `(?s)<h2.*?>.*?</h2>` .Content }}
```
