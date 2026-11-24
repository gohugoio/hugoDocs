---
title: collections.Reverse
description: Returns a slice by reversing the order of elements in the given slice.
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: '[]any'
    signatures: [collections.Reverse SLICE]
---

## Usage

The `collections.Reverse` function returns a slice by reversing the order of elements in the given slice.

To reverse the order of a page collection, you can also use the [`Reverse`][] method on a `Pages` object.

## Examples

```go-html-template
{{ slice 2 1 3 | collections.Reverse }} → [3 1 2]
```

[`Reverse`]: /methods/pages/reverse/
