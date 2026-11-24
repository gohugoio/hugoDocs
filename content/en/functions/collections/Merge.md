---
title: collections.Merge
description: Returns a map by combining two or more given maps.
keywords: []
params:
  functions_and_methods:
    aliases: [merge]
    returnType: map[string]any
    signatures: [collections.Merge MAP MAP...]
---

## Usage

The `collections.Merge` function returns a map by combining two or more given maps. The function merges the maps from left to right. If a key already exists, the function updates its value. If a key does not exist, the function inserts the key and its value.

The function merges nested maps at every level. It does not merge slices. A slice in a later map replaces a slice in an earlier map. To combine slices, use the [`collections.Append`][] function.

The function matches keys without regard to case.

## Examples

These examples use these map definitions:

```go-html-template
{{ $m1 := dict "x" "foo" }}
{{ $m2 := dict "x" "bar" "y" "wibble" }}
{{ $m3 := dict "x" "baz" "y" "wobble" "z" (dict "a" "huey") }}
```

Merging `$m1`, `$m2`, and `$m3`, in that order:

```go-html-template
{{ $merged := collections.Merge $m1 $m2 $m3 }}

{{ $merged.x }}   → baz
{{ $merged.y }}   → wobble
{{ $merged.z.a }} → huey
```

Merging `$m3`, `$m2`, and `$m1`, in that order:

```go-html-template
{{ $merged := collections.Merge $m3 $m2 $m1 }}

{{ $merged.x }}   → foo
{{ $merged.y }}   → wibble
{{ $merged.z.a }} → huey
```

Merging `$m2`, `$m3`, and `$m1`, in that order:

```go-html-template
{{ $merged := collections.Merge $m2 $m3 $m1 }}

{{ $merged.x }}   → foo
{{ $merged.y }}   → wobble
{{ $merged.z.a }} → huey
```

Merging `$m1`, `$m3`, and `$m2`, in that order:

```go-html-template
{{ $merged := collections.Merge $m1 $m3 $m2 }}

{{ $merged.x }}   → bar
{{ $merged.y }}   → wibble
{{ $merged.z.a }} → huey
```

Merging nested maps and slices:

```go-html-template
{{ $m1 := dict "a" (dict "b" 1 "c" 1) "s" (slice 1 2) }}
{{ $m2 := dict "a" (dict "b" 2) "s" (slice 3) }}
{{ collections.Merge $m1 $m2 }} → map[a:map[b:2 c:1] s:[3]]
```

[`collections.Append`]: /functions/collections/append/
