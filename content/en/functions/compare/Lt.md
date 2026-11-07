---
title: compare.Lt
description: Reports whether the first argument is less than all of the subsequent arguments.
keywords: []
params:
  functions_and_methods:
    aliases: [lt]
    returnType: bool
    signatures: ['compare.Lt ARG1 ARG2 [ARG...]']
---

## Usage

The `compare.Lt` function reports whether the first argument is less than all of the subsequent arguments. Numbers are compared by value, regardless of type. You can also use this function to compare strings, boolean values, dates, and other comparable data types.

{{% include "/_common/time-comparison-note.md" %}}

## Examples

```go-html-template
{{ compare.Lt 1 1 }} → false
{{ compare.Lt 1 2 }} → true
{{ compare.Lt 2 1 }} → false

{{ compare.Lt 1 1 1 }} → false
{{ compare.Lt 1 1 2 }} → false
{{ compare.Lt 1 2 1 }} → false
{{ compare.Lt 1 2 2 }} → true

{{ compare.Lt 2 1 1 }} → false
{{ compare.Lt 2 1 2 }} → false
{{ compare.Lt 2 2 1 }} → false
```

Comparing numbers of different types:

```go-html-template
{{ compare.Lt 1 1.0 }} → false
```

Comparing other data types:

```go-html-template
{{ compare.Lt "ab" "a" }} → false
{{ compare.Lt now (time "1964-12-30") }} → false
{{ compare.Lt true false }} → false
```

Comparing moments in different time zones, where the later calendar date is the earlier moment:

```go-html-template
{{ $utc := time.AsTime "2023-07-19T17:42:36Z" }}
{{ $tokyo := time.AsTime "2023-07-20T02:15:09" "Asia/Tokyo" }}
{{ compare.Lt $tokyo $utc }} → true
```
