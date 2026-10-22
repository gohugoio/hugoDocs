---
title: math.Ceil
description: Returns the least integer value greater than or equal to the given number.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Ceil VALUE]
---

## Usage

The `math.Ceil` function returns the least integer value greater than or equal to the given number.

## Examples

```go-html-template
{{ math.Ceil 2.1 }} → 3
```

With a negative number:

```go-html-template
{{ math.Ceil -2.1 }} → -2
```
