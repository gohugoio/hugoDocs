---
title: cast.ToFloat
description: Returns the given value converted to a decimal floating-point number (base 10).
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [float]
    returnType: float64
    signatures: [cast.ToFloat INPUT]
---

## Usage

The `cast.ToFloat` function returns the given value converted to a decimal floating-point number (base 10).

You can pass a number in binary, octal, or hexadecimal notation, but not a string representation of one. The function reads a string as a decimal number, ignoring leading zeros, and throws an error if the string contains a binary, octal, or hexadecimal prefix.

If the input is `nil` or an empty string, the function returns `0`.

## Examples

```go-html-template
{{ cast.ToFloat 11 }} → 11 (float64)
{{ cast.ToFloat "11" }} → 11 (float64)

{{ cast.ToFloat 11.1 }} → 11.1 (float64)
{{ cast.ToFloat "11.1" }} → 11.1 (float64)

{{ cast.ToFloat 11.9 }} → 11.9 (float64)
{{ cast.ToFloat "11.9" }} → 11.9 (float64)
```

With a binary (base 2) input:

```go-html-template
{{ cast.ToFloat 0b11 }} → 3 (float64)
```

With an octal (base 8) input:

```go-html-template
{{ cast.ToFloat 011 }} → 9 (float64)
{{ cast.ToFloat 0o11 }} → 9 (float64)
```

With a hexadecimal (base 16) input:

```go-html-template
{{ cast.ToFloat 0x11 }} → 17 (float64)
```

With a string that has leading zeros:

```go-html-template
{{ cast.ToFloat "011" }} → 11 (float64)
```

With a `nil` or empty string input:

```go-html-template
{{ cast.ToFloat nil }} → 0 (float64)
{{ cast.ToFloat "" }} → 0 (float64)
```
