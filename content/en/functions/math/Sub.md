---
title: math.Sub
description: Returns the result of subtracting one or more numbers from the first number.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [sub]
    returnType: any
    signatures: [math.Sub VALUE VALUE...]
---

## Usage

The `math.Sub` function returns the result of subtracting one or more numbers from the first number. If one of the numbers is a [`float`](g), the result is a `float`.

## Examples

```go-html-template
{{ math.Sub 12 3 2 }} → 7
{{ math.Sub 12 3.5 }} → 8.5
```
