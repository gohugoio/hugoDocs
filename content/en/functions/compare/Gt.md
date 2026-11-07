---
title: compare.Gt
description: Reports whether the first argument is greater than all of the subsequent arguments.
keywords: []
params:
  functions_and_methods:
    aliases: [gt]
    returnType: bool
    signatures: ['compare.Gt ARG1 ARG2 [ARG...]']
---

## Usage

The `compare.Gt` function reports whether the first argument is greater than all of the subsequent arguments. Numbers are compared by value, regardless of type. You can also use this function to compare strings, boolean values, dates, and other comparable data types.

{{% include "/_common/time-comparison-note.md" %}}

## Examples

```go-html-template
{{ compare.Gt 1 1 }} → false
{{ compare.Gt 1 2 }} → false
{{ compare.Gt 2 1 }} → true

{{ compare.Gt 1 1 1 }} → false
{{ compare.Gt 1 1 2 }} → false
{{ compare.Gt 1 2 1 }} → false
{{ compare.Gt 1 2 2 }} → false

{{ compare.Gt 2 1 1 }} → true
{{ compare.Gt 2 1 2 }} → false
{{ compare.Gt 2 2 1 }} → false
```

Comparing numbers of different types:

```go-html-template
{{ compare.Gt 1 1.0 }} → false
```

Comparing other data types:

```go-html-template
{{ compare.Gt "ab" "a" }} → true
{{ compare.Gt now (time "1964-12-30") }} → true
{{ compare.Gt true false }} → true
```

Comparing moments in different time zones, where the later calendar date is the earlier moment:

```go-html-template
{{ $utc := time.AsTime "2023-07-19T17:42:36Z" }}
{{ $tokyo := time.AsTime "2023-07-20T02:15:09" "Asia/Tokyo" }}
{{ compare.Gt $utc $tokyo }} → true
```
