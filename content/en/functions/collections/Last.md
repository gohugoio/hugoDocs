---
title: collections.Last
description: Returns the last N elements of the given slice or string.
keywords: []
params:
  functions_and_methods:
    aliases: [last]
    returnType: 'any'
    signatures: [collections.Last N SLICE|STRING]
---

## Usage

The `collections.Last` function returns the last `N` elements of the given slice or string. If `N` is greater than the length of the slice or string, the function returns the entire slice or string. If `N` is zero, the function returns an empty slice or string.

When you pass a string, the function returns the last `N` bytes, not the last `N` characters. A character may consist of more than one byte, so the returned string may begin with an incomplete character.

## Examples

```go-html-template
{{ slice "a" "b" "c" | collections.Last 1 }} → [c]
{{ slice "a" "b" "c" | collections.Last 2 }} → [b c]
```

With a string:

```go-html-template
{{ "abc" | collections.Last 1 }} → c
{{ "abc" | collections.Last 2 }} → bc
```

With a string that contains multibyte characters:

```go-html-template
{{ "Schön" | collections.Last 1 }} → n
{{ "Schön" | collections.Last 2 }} → \xb6n
{{ "Schön" | collections.Last 3 }} → ön
```

With a page collection:

```go-html-template
{{ range collections.Last 5 .Pages }}
  {{ .Render "summary" }}
{{ end }}
```

Filtering a page collection with the [`collections.Where`][] function before returning the last five pages:

```go-html-template
{{ range where .Pages "Section" "articles" | collections.Last 5 }}
  {{ .Render "summary" }}
{{ end }}
```

[`collections.Where`]: /functions/collections/where/
