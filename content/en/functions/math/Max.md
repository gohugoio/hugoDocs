---
title: math.Max
description: Returns the greatest of all numbers. Accepts scalars, slices, or both.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Max VALUE...]
---

## Usage

The `math.Max` function returns the greatest of all numbers. Each argument can be a number or a [slice](g) of numbers.

## Examples

```go-html-template
{{ math.Max 1 5 3 }} → 5
```

With numbers and slices:

```go-html-template
{{ math.Max 1 (slice 2 3) 4 }} → 4
```
