---
title: cast.ToString
description: Returns the given value converted to a string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [string]
    returnType: string
    signatures: [cast.ToString INPUT]
---

## Usage

The `cast.ToString` function returns the given value converted to a string. The function converts a number in binary, octal, or hexadecimal notation to its decimal (base 10) string representation, and returns a string unchanged.

## Examples

```go-html-template
{{ cast.ToString 11 }} → 11 (string)
{{ cast.ToString "11" }} → 11 (string)

{{ cast.ToString 11.1 }} → 11.1 (string)
{{ cast.ToString "11.1" }} → 11.1 (string)

{{ cast.ToString 11.9 }} → 11.9 (string)
{{ cast.ToString "11.9" }} → 11.9 (string)
```

With a binary (base 2) input:

```go-html-template
{{ cast.ToString 0b11 }} → 3 (string)
{{ cast.ToString "0b11" }} → 0b11 (string)
```

With an octal (base 8) input:

```go-html-template
{{ cast.ToString 011 }} → 9 (string)
{{ cast.ToString "011" }} → 011 (string)

{{ cast.ToString 0o11 }} → 9 (string)
{{ cast.ToString "0o11" }} → 0o11 (string)
```

With a hexadecimal (base 16) input:

```go-html-template
{{ cast.ToString 0x11 }} → 17 (string)
{{ cast.ToString "0x11" }} → 0x11 (string)
```
