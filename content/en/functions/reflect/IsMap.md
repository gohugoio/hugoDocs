---
title: reflect.IsMap
description: Reports whether the given value is a map.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [reflect.IsMap INPUT]
---

## Usage

The `reflect.IsMap` function reports whether the given value is a [map](g).

## Examples

```go-html-template
{{ reflect.IsMap (dict "key" "value") }} → true
{{ reflect.IsMap (slice 1 2 3) }} → false
{{ reflect.IsMap "yo" }} → false
```

Checking the project's custom parameters:

```go-html-template
{{ reflect.IsMap site.Params }} → true
```
