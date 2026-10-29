---
title: strings.TrimSuffix
description: Returns the given string, removing the suffix from the end of the string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [strings.TrimSuffix SUFFIX STRING]
---

## Usage

The `strings.TrimSuffix` function returns the given string, removing the suffix from the end of the string. If `STRING` does not end with `SUFFIX`, the function returns `STRING` unchanged.

## Examples

```go-html-template
{{ strings.TrimSuffix "a" "aabbaa" }} → aabba
{{ strings.TrimSuffix "aa" "aabbaa" }} → aabb
{{ strings.TrimSuffix "aaa" "aabbaa" }} → aabbaa
```
