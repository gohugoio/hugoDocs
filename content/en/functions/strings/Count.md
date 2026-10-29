---
title: strings.Count
description: Returns the number of non-overlapping instances of the given substring within the given string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: int
    signatures: [strings.Count SUBSTR STRING]
---

## Usage

The `strings.Count` function returns the number of non-overlapping instances of `SUBSTR` within `STRING`. If `SUBSTR` is an empty string, the function returns 1 plus the number of Unicode [code points](g) in `STRING`.

## Examples

```go-html-template
{{ "aaabaab" | strings.Count "a" }} → 5
{{ "aaabaab" | strings.Count "aa" }} → 2
{{ "aaabaab" | strings.Count "aaa" }} → 1
{{ "aaabaab" | strings.Count "" }} → 8
```
