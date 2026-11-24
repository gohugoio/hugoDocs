---
title: collections.Dictionary
description: Returns a map created from the given key-value pairs.
keywords: []
params:
  functions_and_methods:
    aliases: [dict]
    returnType: map[string]any
    signatures: ['collections.Dictionary [VALUE...]']
---

## Usage

The `collections.Dictionary` function returns a [map](g) created from the given key-value pairs. Specify the key-value pairs as individual arguments, alternating between keys and values. The function returns an error if the number of arguments is odd.

Each key must be a string or a slice of strings. Use a slice of strings to create a nested map, where each element of the slice is a key at the next level.

Call the function without arguments to create an empty map.

## Examples

```go-html-template
{{ $m := collections.Dictionary "a" 1 "b" 2 }}
{{ $m }} → map[a:1 b:2]
```

Creating a nested map:

```go-html-template
{{ $m := collections.Dictionary (slice "a" "b" "c") "value" }}
{{ $m }} → map[a:map[b:map[c:value]]]
{{ $m.a.b.c }} → value
```

Creating an empty map:

```go-html-template
{{ $m := collections.Dictionary }}
{{ $m }} → map[]
```
