---
title: math.Div
description: Returns the result of dividing the first number by one or more numbers.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [div]
    returnType: any
    signatures: [math.Div VALUE VALUE...]
---

## Usage

The `math.Div` function returns the result of dividing the first number by one or more numbers. If one of the numbers is a [`float`](g), the result is a `float`. Otherwise, the function performs integer division and removes the fractional part of the result.

## Examples

```go-html-template
{{ math.Div 12 3 2 }} → 2
```

Comparing integer and floating-point division:

```go-html-template
{{ math.Div 5 2 }} → 2
{{ math.Div 5 2.0 }} → 2.5
```
