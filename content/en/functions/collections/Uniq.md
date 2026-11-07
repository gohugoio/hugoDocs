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

```go-html-template
{{ slice 1 3 2 1 | uniq }} → [1 3 2]
```

The function compares [`time.Time`][] values by the moment they represent, regardless of time zone:

```go-html-template
{{ $utc := time.AsTime "2023-07-19T17:42:36Z" }}
{{ $tokyo := $utc | time.In "Asia/Tokyo" }}
{{ slice $utc $tokyo | uniq | len }} → 1
```

[`time.Time`]: /quick-reference/data-types/#dates-and-times
