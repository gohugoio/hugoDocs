---
title: math.Mul
description: Returns the result of multiplying the first number by one or more numbers.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [mul]
    returnType: any
    signatures: [math.Mul VALUE VALUE...]
---

## Usage

The `math.Mul` function returns the result of multiplying the first number by one or more numbers. If one of the numbers is a [`float`](g), the result is a `float`.

## Examples

```go-html-template
{{ math.Mul 12 3 2 }} → 72
{{ math.Mul 1.5 2 }} → 3
```
