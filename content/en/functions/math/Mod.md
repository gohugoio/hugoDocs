---
title: math.Mod
description: Returns the modulus of two integers.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [mod]
    returnType: int64
    signatures: [math.Mod VALUE1 VALUE2]
---

## Usage

The `math.Mod` function returns the modulus of two integers, which is the remainder after dividing `VALUE1` by `VALUE2`. The result has the same sign as `VALUE1`. The function converts both values to integers before dividing, removing any fractional part, and throws an error if `VALUE2` is `0`.

## Examples

```go-html-template
{{ math.Mod 15 3 }} → 0
{{ math.Mod 15 4 }} → 3
```

With a negative number:

```go-html-template
{{ math.Mod -15 4 }} → -3
```
