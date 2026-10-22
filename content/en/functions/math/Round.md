---
title: math.Round
description: Returns the nearest integer, rounding half away from zero.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Round VALUE]
---

## Usage

The `math.Round` function returns the nearest integer, rounding half away from zero.

## Examples

```go-html-template
{{ math.Round 1.4 }} → 1
{{ math.Round 1.5 }} → 2
{{ math.Round 2.5 }} → 3
```

With a negative number:

```go-html-template
{{ math.Round -1.5 }} → -2
```
