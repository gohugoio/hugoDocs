---
title: cast.ToInt
description: Returns the given value converted to a decimal integer (base 10).
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [int]
    returnType: int
    signatures: [cast.ToInt INPUT]
---

## Usage

The `cast.ToInt` function returns the given value converted to a decimal integer (base 10). When converting a floating-point number, the function removes the fractional part instead of rounding.

You can pass a number, or a string representation of a number, in binary, octal, or hexadecimal notation.

If the input is `nil` or an empty string, the function returns `0`.

> [!NOTE]
> Values with a leading zero are octal (base 8). When converting a string representation of a decimal (base 10) number, remove leading zeros as shown in the [examples](#examples).

## Examples

```go-html-template
{{ cast.ToInt 11 }} → 11 (int)
{{ cast.ToInt "11" }} → 11 (int)

{{ cast.ToInt 11.1 }} → 11 (int)
{{ cast.ToInt "11.1" }} → 11 (int)

{{ cast.ToInt 11.9 }} → 11 (int)
{{ cast.ToInt "11.9" }} → 11 (int)
```

With a binary (base 2) input:

```go-html-template
{{ cast.ToInt 0b11 }} → 3 (int)
{{ cast.ToInt "0b11" }} → 3 (int)
```

With an octal (base 8) input:

```go-html-template
{{ cast.ToInt 011 }} → 9 (int)
{{ cast.ToInt "011" }} → 9 (int)

{{ cast.ToInt 0o11 }} → 9 (int)
{{ cast.ToInt "0o11" }} → 9 (int)
```

With a hexadecimal (base 16) input:

```go-html-template
{{ cast.ToInt 0x11 }} → 17 (int)
{{ cast.ToInt "0x11" }} → 17 (int)
```

Removing leading zeros from a string representation of a decimal number:

```go-html-template
{{ strings.TrimLeft "0" "0011" | cast.ToInt }} → 11 (int)
```

With a `nil` or empty string input:

```go-html-template
{{ cast.ToInt nil }} → 0 (int)
{{ cast.ToInt "" }} → 0 (int)
```
