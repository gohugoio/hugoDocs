---
title: collections.First
description: Returns the first N elements of the given slice or string.
keywords: []
params:
  functions_and_methods:
    aliases: [first]
    returnType: any
    signatures: [collections.First N SLICE|STRING]
---

## Usage

The `collections.First` function returns the first `N` elements of the given slice or string. If `N` is greater than the length of the slice or string, the function returns the entire slice or string. If `N` is zero, the function returns an empty slice or string.

When you pass a string, the function returns the first `N` bytes, not the first `N` characters. A character may consist of more than one byte, so the returned string may end with an incomplete character.

## Examples

```go-html-template
{{ slice "a" "b" "c" | collections.First 1 }} → [a]
{{ slice "a" "b" "c" | collections.First 2 }} → [a b]
```

With a string:

```go-html-template
{{ "abc" | collections.First 1 }} → a
{{ "abc" | collections.First 2 }} → ab
```

With a string that contains multibyte characters:

```go-html-template
{{ "Schön" | collections.First 3 }} → Sch
{{ "Schön" | collections.First 4 }} → Sch\xc3
{{ "Schön" | collections.First 5 }} → Schö
```

With a page collection:

```go-html-template
{{ range collections.First 5 .Pages }}
  {{ .Render "summary" }}
{{ end }}
```

Filtering a page collection with the [`collections.Where`][] function before returning the first five pages:

```go-html-template
{{ range where .Pages "Section" "articles" | collections.First 5 }}
  {{ .Render "summary" }}
{{ end }}
```

[`collections.Where`]: /functions/collections/where/
