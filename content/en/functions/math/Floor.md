---
title: math.Floor
description: Returns the greatest integer value less than or equal to the given number.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Floor VALUE]
---

## Usage

The `math.Floor` function returns the greatest integer value less than or equal to the given number.

## Examples

```go-html-template
{{ math.Floor 1.9 }} → 1
```

With a negative number:

```go-html-template
{{ math.Floor -1.9 }} → -2
```
