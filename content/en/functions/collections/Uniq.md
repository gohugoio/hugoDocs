---
title: collections.Uniq
description: Returns a slice by removing duplicate elements from the given slice.
keywords: []
params:
  functions_and_methods:
    aliases: [uniq]
    returnType: '[]any'
    signatures: [collections.Uniq SLICE]
---

## Usage

The `collections.Uniq` function returns a slice by removing duplicate elements from the given slice. The function keeps the first occurrence of each element, and does not sort the returned slice.

{{% include "/_common/time-comparison-note.md" %}}

## Examples

```go-html-template
{{ slice 1 3 2 1 | collections.Uniq }} → [1 3 2]
{{ slice "b" "a" "b" "c" "a" | collections.Uniq }} → [b a c]
```

Comparing the same moment in different time zones:

```go-html-template
{{ $utc := time.AsTime "2023-07-19T17:42:36Z" }}
{{ $tokyo := $utc | time.In "Asia/Tokyo" }}
{{ slice $utc $tokyo | collections.Uniq | len }} → 1
```
