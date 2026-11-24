---
title: collections.Intersect
description: Returns a slice containing the common elements found in two given slices, in the same order as the first slice.
keywords: []
params:
  functions_and_methods:
    aliases: [intersect]
    returnType: '[]any'
    signatures: [collections.Intersect SLICE1 SLICE2]
---

## Usage

The `collections.Intersect` function returns a slice containing the common elements found in two given slices, in the same order as the first slice. The returned slice does not contain duplicate elements.

Use this function with the [`collections.Where`][] function to combine filters with a logical `AND`. To combine filters with a logical `OR`, use the [`collections.Union`][] function.

## Examples

```go-html-template
{{ collections.Intersect (slice 1 2 3 4) (slice 4 3 5) }} → [3 4]
```

Returning regular pages that have a content type other than `page` or `about`, or that are pinned, and that have an `images` parameter:

```go-html-template
{{ $pages := where site.RegularPages "Type" "not in" (slice "page" "about") }}
{{ $pages = $pages | union (where site.RegularPages "Params.pinned" true) }}
{{ $pages = $pages | collections.Intersect (where site.RegularPages "Params.images" "!=" nil) }}
```

[`collections.Union`]: /functions/collections/union/
[`collections.Where`]: /functions/collections/where/
