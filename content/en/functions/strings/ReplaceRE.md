---
title: strings.ReplaceRE
description: Returns the given string, replacing all occurrences of a regular expression with a replacement pattern.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [replaceRE]
    returnType: string
    signatures: ['strings.ReplaceRE PATTERN REPLACEMENT STRING [LIMIT]']
---

## Usage

The `strings.ReplaceRE` function returns the given string, replacing all occurrences of a regular expression with a replacement pattern. To limit the number of replacements, pass the optional `LIMIT` argument. Within `REPLACEMENT`, use `$1`, `$2`, and so on to insert the content of each capturing group within the regular expression.

{{% include "/_common/regular-expressions.md" %}}

## Examples

```go-html-template
{{ $s := "a-b--c---d" }}
{{ strings.ReplaceRE `(-{2,})` "-" $s }} → a-b-c-d
```

Limiting the number of replacements:

```go-html-template
{{ $s := "a-b--c---d" }}
{{ strings.ReplaceRE `(-{2,})` "-" $s 1 }} → a-b-c---d
```

Inserting the content of a capturing group:

```go-html-template
{{ $s := "http://gohugo.io/docs" }}
{{ strings.ReplaceRE "^https?://([^/]+).*" "$1" $s }} → gohugo.io
```
