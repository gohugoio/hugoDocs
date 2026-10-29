---
title: strings.Split
description: Returns a slice of strings by splitting the given string by a delimiter.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [split]
    returnType: '[]string'
    signatures: [strings.Split STRING DELIM]
---

## Usage

The `strings.Split` function returns a slice of strings by splitting the given string by a delimiter. If `DELIM` is an empty string, the function splits `STRING` after each character.

The `strings.Split` function does the opposite of the [`collections.Delimit`][] function. While `strings.Split` creates a slice from a string, `collections.Delimit` creates a string from a slice.

## Examples

```go-html-template
{{ strings.Split "tag1,tag2,tag3" "," }} → [tag1 tag2 tag3]
{{ strings.Split "abc" "" }} → [a b c]
```

[`collections.Delimit`]: /functions/collections/delimit/
