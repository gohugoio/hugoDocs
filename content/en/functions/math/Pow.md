---
title: math.Pow
description: Returns the first number raised to the power of the second number.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [pow]
    returnType: float64
    signatures: [math.Pow VALUE1 VALUE2]
---

## Usage

The `math.Pow` function returns the first number raised to the power of the second number.

## Examples

```go-html-template
{{ math.Pow 2 3 }} → 8
```

With a negative or fractional exponent:

```go-html-template
{{ math.Pow 2 -1 }} → 0.5
{{ math.Pow 4 0.5 }} → 2
```
