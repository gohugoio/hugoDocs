---
title: collections.In
description: Reports whether a value exists within the given slice or string.
keywords: []
params:
  functions_and_methods:
    aliases: [in]
    returnType: bool
    signatures: [collections.In SLICE|STRING VALUE]
---

```go-html-template
{{ $s := slice "a" "b" "c" }}
{{ in $s "b" }} → true
```

```go-html-template
{{ $s := "abc" }}
{{ in $s "b" }} → true
```

The function compares [`time.Time`][] values by the moment they represent, regardless of time zone:

```go-html-template
{{ $utc := time.AsTime "2023-07-19T17:42:36Z" }}
{{ $tokyo := $utc | time.In "Asia/Tokyo" }}
{{ in (slice $utc) $tokyo }} → true
```

[`time.Time`]: /quick-reference/data-types/#dates-and-times
