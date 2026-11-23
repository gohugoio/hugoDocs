---
title: reflect.IsSlice
description: Reports whether the given value is a slice.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [reflect.IsSlice INPUT]
---

## Usage

The `reflect.IsSlice` function reports whether the given value is a [slice](g). The function also returns `true` for a [page collection](g), such as the value returned by the [`RegularPages`][] method on a `Site` object.

## Examples

```go-html-template
{{ reflect.IsSlice (slice 1 2 3) }} → true
{{ reflect.IsSlice (dict "key" "value") }} → false
{{ reflect.IsSlice "yo" }} → false
```

Checking values returned by other functions and methods:

```go-html-template
{{ reflect.IsSlice (split "a,b,c" ",") }} → true
{{ reflect.IsSlice site.RegularPages }} → true
```

[`RegularPages`]: /methods/site/regularpages/
