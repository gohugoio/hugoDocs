---
title: math.Add
description: Returns the result of adding one or more numbers to the first number.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [add]
    returnType: any
    signatures: [math.Add VALUE VALUE...]
---

## Usage

The `math.Add` function returns the result of adding one or more numbers to the first number. If one of the numbers is a [`float`](g), the result is a `float`.

You can also use this function to concatenate strings.

## Examples

```go-html-template
{{ math.Add 12 3 2 }} → 17
{{ math.Add 12 3.5 }} → 15.5
```

Concatenating strings:

```go-html-template
{{ math.Add "hu" "go" }} → hugo
```
