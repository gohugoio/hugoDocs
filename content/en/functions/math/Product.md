---
title: math.Product
description: Returns the product of all numbers. Accepts scalars, slices, or both.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Product VALUE...]
---

## Usage

The `math.Product` function returns the product of all numbers. Each argument can be a number or a [slice](g) of numbers.

## Examples

```go-html-template
{{ math.Product 2 3 }} → 6
```

With a slice:

```go-html-template
{{ math.Product (slice 1 2 3 4) }} → 24
```

With numbers and slices:

```go-html-template
{{ math.Product 1 (slice 2 3) 4 }} → 24
```
