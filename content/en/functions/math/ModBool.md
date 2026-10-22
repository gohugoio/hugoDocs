---
title: math.ModBool
description: Reports whether the modulus of two integers equals 0.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [modBool]
    returnType: bool
    signatures: [math.ModBool VALUE1 VALUE2]
---

## Usage

The `math.ModBool` function reports whether the modulus of two integers equals `0`. Use this function to determine whether `VALUE1` is evenly divisible by `VALUE2`. The function converts both values to integers before dividing, removing any fractional part, and throws an error if `VALUE2` is `0`.

## Examples

```go-html-template
{{ math.ModBool 15 3 }} → true
{{ math.ModBool 15 4 }} → false
```
