---
title: strings.TrimPrefix
description: Returns the given string, removing the prefix from the beginning of the string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [strings.TrimPrefix PREFIX STRING]
---

## Usage

The `strings.TrimPrefix` function returns the given string, removing the prefix from the beginning of the string. If `STRING` does not begin with `PREFIX`, the function returns `STRING` unchanged.

## Examples

```go-html-template
{{ strings.TrimPrefix "a" "aabbaa" }} → abbaa
{{ strings.TrimPrefix "aa" "aabbaa" }} → bbaa
{{ strings.TrimPrefix "aaa" "aabbaa" }} → aabbaa
```
