---
title: collections.Union
description: Returns a slice containing the unique elements from two given slices.
keywords: []
params:
  functions_and_methods:
    aliases: [union]
    returnType: '[]any'
    signatures: [collections.Union SLICE1 SLICE2]
---

## Usage

The `collections.Union` function returns a slice containing the unique elements from two given slices. The returned slice contains the elements of the first slice, followed by the elements of the second slice that do not appear in the first slice. If either argument is `nil`, the function returns the unique elements of the other argument.

Use this function with the [`collections.Where`][] function to combine filters with a logical `OR`. To combine filters with a logical `AND`, use the [`collections.Intersect`][] function.

## Examples

```go-html-template
{{ collections.Union (slice 1 2 3) (slice 3 4 5) }} → [1 2 3 4 5]
{{ collections.Union (slice 1 2 3) nil }}           → [1 2 3]
{{ collections.Union nil (slice 1 2 3) }}           → [1 2 3]
{{ collections.Union nil nil }}                     → []
```

Returning regular pages that have a content type other than `page` or `about`, or that are pinned, and that have an `images` parameter:

```go-html-template
{{ $pages := where site.RegularPages "Type" "not in" (slice "page" "about") }}
{{ $pages = $pages | collections.Union (where site.RegularPages "Params.pinned" true) }}
{{ $pages = $pages | intersect (where site.RegularPages "Params.images" "!=" nil) }}
```

[`collections.Intersect`]: /functions/collections/intersect/
[`collections.Where`]: /functions/collections/where/
