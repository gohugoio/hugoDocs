---
title: collections.SymDiff
description: Returns a slice containing the symmetric difference of two given slices.
keywords: []
params:
  functions_and_methods:
    aliases: [symdiff]
    returnType: '[]any'
    signatures: [collections.SymDiff SLICE1 SLICE2]
---

## Usage

The `collections.SymDiff` function returns a slice containing the [symmetric difference][] of two given slices. The symmetric difference contains the elements that appear in either slice, but not in both. The function does not sort the returned slice.

## Examples

```go-html-template
{{ collections.SymDiff (slice 1 2 3) (slice 3 4) }} → [4 1 2]
```

Using a [chained pipeline](g):

```go-html-template
{{ slice 1 2 3 | collections.SymDiff (slice 3 4) }} → [1 2 4]
```

[symmetric difference]: https://en.wikipedia.org/wiki/Symmetric_difference
