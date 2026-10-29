---
title: strings.Repeat
description: Returns the given string repeated the given number of times.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [strings.Repeat COUNT STRING]
---

## Usage

The `strings.Repeat` function returns `STRING` repeated `COUNT` times. If `COUNT` is negative, the function throws an error.

## Examples

```go-html-template
{{ strings.Repeat 3 "yo" }} → yoyoyo
```
