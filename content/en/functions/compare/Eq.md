---
title: compare.Eq
description: Reports whether the first argument is equal to any of the subsequent arguments.
keywords: []
params:
  functions_and_methods:
    aliases: [eq]
    returnType: bool
    signatures: ['compare.Eq ARG1 ARG2 [ARG...]']
---

## Usage

The `compare.Eq` function reports whether the first argument is equal to any of the subsequent arguments. Numbers are compared by value, regardless of type. You can also use this function to compare strings, boolean values, dates, and other comparable data types.

{{% include "/_common/time-comparison-note.md" %}}

## Examples

```go-html-template
{{ compare.Eq 1 1 }} → true
{{ compare.Eq 1 2 }} → false

{{ compare.Eq 1 1 1 }} → true
{{ compare.Eq 1 1 2 }} → true
{{ compare.Eq 1 2 1 }} → true
{{ compare.Eq 1 2 2 }} → false
```

Comparing numbers of different types:

```go-html-template
{{ compare.Eq 1 1.0 }} → true
```

Comparing other data types:

```go-html-template
{{ compare.Eq "ab" "a" }} → false
{{ compare.Eq now (time "1964-12-30") }} → false
{{ compare.Eq true false }} → false
```

Comparing the same moment in different time zones:

```go-html-template
{{ $utc := time.AsTime "2023-07-19T17:42:36Z" }}
{{ $tokyo := $utc | time.In "Asia/Tokyo" }}
{{ compare.Eq $utc $tokyo }} → true
```
