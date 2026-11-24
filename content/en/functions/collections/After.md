---
title: collections.After
description: Returns a slice containing the elements after the first N elements of the given slice.
keywords: []
params:
  functions_and_methods:
    aliases: [after]
    returnType: '[]any'
    signatures: [collections.After N SLICE]
---

## Usage

The `collections.After` function returns a slice containing the elements after the first `N` elements of the given slice. If `N` is greater than or equal to the length of the slice, the function returns an empty slice.

Use this function with the [`collections.First`][] function to return a range of elements from the middle of a slice.

## Examples

```go-html-template
{{ $s := slice "a" "b" "c" "d" }}
{{ collections.After 2 $s }} → [c d]
{{ collections.After 0 $s }} → [a b c d]
{{ collections.After 4 $s }} → []
```

Returning a range of elements from the middle of a slice:

```go-html-template
{{ $s := slice "a" "b" "c" "d" }}
{{ collections.After 1 $s | first 2 }} → [b c]
```

Rendering the most recently published page in one list, and the next three pages in another list:

```go-html-template
{{ $pages := .Pages.ByPublishDate.Reverse }}

<h2>Featured</h2>
<ul>
  {{ range first 1 $pages }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>

<h2>Recent</h2>
<ul>
  {{ range collections.After 1 $pages | first 3 }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

[`collections.First`]: /functions/collections/first/
