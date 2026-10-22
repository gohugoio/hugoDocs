---
title: math.Atan2
description: Returns the arctangent, in radians, of the given number pair, determining the correct quadrant from their signs.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Atan2 VALUE VALUE]
---

## Usage

The `math.Atan2` function returns the arctangent, in radians, of the first number divided by the second number. The function uses the signs of both numbers to determine the quadrant of the returned value.

## Examples

```go-html-template
{{ math.Atan2 1 2 }} → 0.4636476090008061
```

With negative numbers:

```go-html-template
{{ math.Atan2 -1 -2 }} → -2.677945044588987
```
