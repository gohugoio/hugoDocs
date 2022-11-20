---
title: replaceRE
description: Returns a string, replacing all occurrences of a regular expression with a replacement pattern.
categories: [functions]
menu:
  docs:
    parent: functions
keywords: [replace regex]
signature:
  - "replaceRE PATTERN REPLACEMENT INPUT [LIMIT]"
  - "strings.ReplaceRE PATTERN REPLACEMENT INPUT [LIMIT]"
relatedfuncs: [replace,findRE]
aliases: []
---
By default, the `replaceRE` function replaces all matches. You can limit the number of matches with an optional LIMIT parameter.

When specifying the regular expression, use a raw [string literal] (backticks) instead of an interpreted string literal (double quotes) to simplify the syntax. With an interpreted string literal you must escape backslashes.

The syntax of the regular expression is the same general syntax used by Perl, Python, and other languages. More precisely, it is the syntax accepted by [RE2] except for `\C`.

This example replaces two or more consecutive hyphens with a single hyphen:

```go-html-template
{{ $s := "a-b--c---d" }}
{{ replaceRE `(-{2,})` "-" $s }} → a-b-c-d
```

To limit the number of replacements to one:

```go-html-template
{{ $s := "a-b--c---d" }}
{{ replaceRE `(-{2,})` "-" $s 1 }} → a-b-c---d
```

You can use `$1`, `$2`, etc. within the replacement string to insert the groups captured within the regular expression:

```go-html-template
{{ $s := "http://gohugo.io/docs" }}
{{ replaceRE "^https?://([^/]+).*" "$1" $s }} → gohugo.io
```

{{% note %}}
You can write and test your regular expression using [regex101.com](https://regex101.com/). Be sure to select the Go flavor before you begin.
{{% /note %}}

[RE2]: https://github.com/google/re2/wiki/Syntax
[string literal]: https://go.dev/ref/spec#String_literals
