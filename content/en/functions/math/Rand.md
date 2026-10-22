---
title: math.Rand
description: Returns a pseudo-random number in the half-open interval [0.0, 1.0).
categories: []
keywords: [random]
params:
  functions_and_methods:
    aliases: []
    returnType: float64
    signatures: [math.Rand]
---

## Usage

The `math.Rand` function returns a pseudo-random number in the half-open [interval](g) `[0.0, 1.0)`. Combine it with other functions to generate random integers or floats within a given interval, as shown in the [examples](#examples).

## Examples

```go-html-template
{{ math.Rand }} → 0.6312770459590062
```

A random integer in the closed interval `[0, 5]`:

```go-html-template
{{ math.Rand | mul 6 | math.Floor }}
```

A random integer in the closed interval `[1, 6]`:

```go-html-template
{{ math.Rand | mul 6 | math.Ceil }}
```

A random float, with one digit after the decimal point, in the closed interval `[0, 4.9]`:

```go-html-template
{{ div (math.Rand | mul 50 | math.Floor) 10 }}
```

A random float, with one digit after the decimal point, in the closed interval `[0.1, 5.0]`:

```go-html-template
{{ div (math.Rand | mul 50 | math.Ceil) 10 }}
```
