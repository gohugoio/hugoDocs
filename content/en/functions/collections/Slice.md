---
title: collections.Slice
description: Returns a slice created from the given values.
keywords: []
params:
  functions_and_methods:
    aliases: [slice]
    returnType: '[]any'
    signatures: ['collections.Slice [VALUE...]']
---

## Usage

The `collections.Slice` function returns a [slice](g) created from the given values. The values may be of any data type, and you can mix data types within the same slice. Call the function without arguments to create an empty slice.

## Examples

```go-html-template
{{ $s := collections.Slice "a" "b" "c" }}
{{ $s }} → [a b c]
```

Mixing data types:

```go-html-template
{{ $s := collections.Slice "a" 1 true (collections.Slice 2 3) }}
{{ $s }} → [a 1 true [2 3]]
```

Creating an empty slice:

```go-html-template
{{ $s := collections.Slice }}
{{ $s }} → []
```
