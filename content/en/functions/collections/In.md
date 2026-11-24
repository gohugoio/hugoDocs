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

## Usage

The `collections.In` function reports whether a value exists within the given slice or string. When you pass a slice, the function reports whether any element is equal to `VALUE`. When you pass a string, the function reports whether `VALUE` is a substring.

Numbers are compared by value, regardless of type. A number is not equal to a string that contains the same digits.

{{% include "/_common/time-comparison-note.md" %}}

## Examples

```go-html-template
{{ $s := slice "a" "b" "c" }}
{{ collections.In $s "b" }} → true
{{ collections.In $s "d" }} → false
```

With a string:

```go-html-template
{{ collections.In "abc" "b" }} → true
{{ collections.In "abc" "bc" }} → true
```

Comparing numbers:

```go-html-template
{{ $s := slice 1 2 3 }}
{{ collections.In $s 1.0 }} → true
{{ collections.In $s "1" }} → false
```

Comparing the same moment in different time zones:

```go-html-template
{{ $utc := time.AsTime "2023-07-19T17:42:36Z" }}
{{ $tokyo := $utc | time.In "Asia/Tokyo" }}
{{ collections.In (slice $utc) $tokyo }} → true
```
