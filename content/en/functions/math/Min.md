---
title: math.Min
description: Returns the smallest of all numbers. Accepts scalars, slices, or both.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Min VALUE...]
---

## Usage

The `math.Min` function returns the smallest of all numbers. Each argument can be a number or a [slice](g) of numbers.

## Examples

```go-html-template
{{ math.Min 3 1 5 }} → 1
```

With numbers and slices:

```go-html-template
{{ math.Min 1 (slice 2 3) 4 }} → 1
```
