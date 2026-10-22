---
title: math.MaxInt64
description: Returns the maximum value for a signed 64-bit integer.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: int64
    signatures: [math.MaxInt64]
---

{{< new-in 0.147.3 />}}

## Usage

The `math.MaxInt64` function returns the maximum value for a signed 64-bit integer. Use this function with the [`range`][] statement to create a loop that continues until a [`break`][] condition is met.

## Examples

```go-html-template
{{ math.MaxInt64 }} → 9223372036854775807
```

Looping until a break condition is met:

```go-html-template
{{ range math.MaxInt64 }}
  {{ if eq . 42 }}
    {{ break }}
  {{ end }}
{{ end }}
```

[`break`]: /functions/go-template/break/
[`range`]: /functions/go-template/range/
