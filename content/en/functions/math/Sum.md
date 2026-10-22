---
title: math.Sum
description: Returns the sum of all numbers. Accepts scalars, slices, or both.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Sum VALUE...]
---

## Usage

The `math.Sum` function returns the sum of all numbers. Each argument can be a number or a [slice](g) of numbers.

## Examples

```go-html-template
{{ math.Sum 1 2 }} → 3
```

With a slice:

```go-html-template
{{ math.Sum (slice 1 2 3 4) }} → 10
```

With numbers and slices:

```go-html-template
{{ math.Sum 1 (slice 2 3) 4 }} → 10
```
