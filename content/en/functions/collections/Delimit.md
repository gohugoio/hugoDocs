---
title: collections.Delimit
description: Returns a string by joining the values of the given slice or map with a delimiter.
keywords: []
params:
  functions_and_methods:
    aliases: [delimit]
    returnType: string
    signatures: ['collections.Delimit SLICE|MAP DELIMITER [LAST]']
---

## Usage

The `collections.Delimit` function returns a string by joining the values of the given slice or map with a delimiter. If you provide the optional `LAST` argument, the function uses it instead of `DELIMITER` between the last two values.

When you pass a map, the function sorts the map by key, then joins the values.

## Examples

```go-html-template
{{ $s := slice "b" "a" "c" }}
{{ collections.Delimit $s ", " }} → b, a, c
{{ collections.Delimit $s ", " " and " }} → b, a and c
```

With a map:

```go-html-template
{{ $m := dict "b" 2 "a" 1 "c" 3 }}
{{ collections.Delimit $m ", " }} → 1, 2, 3
{{ collections.Delimit $m ", " " and " }} → 1, 2 and 3
```
