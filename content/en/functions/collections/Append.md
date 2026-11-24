---
title: collections.Append
description: Returns a slice by adding one or more elements, or the elements of another slice, to the end of the given slice.
keywords: []
params:
  functions_and_methods:
    aliases: [append]
    returnType: '[]any'
    signatures:
      - collections.Append ELEMENT [ELEMENT...] SLICE
      - collections.Append ELEMENTS SLICE
---

## Usage

The `collections.Append` function returns a slice by adding one or more elements, or the elements of another slice, to the end of the given slice. The given slice, `SLICE`, is always the last argument. This allows you to use the function in a [chained pipeline](g).

If the only argument before `SLICE` is a slice, `ELEMENTS`, the function adds each element of `ELEMENTS` to the end of `SLICE`. Appending an empty slice returns `SLICE` unchanged. The function adds a slice as a single element in these cases:

- `SLICE` is a slice of slices.
- You pass more than one argument before `SLICE`.

You can append elements of any data type, including pages.

## Examples

```go-html-template
{{ $s := slice "a" "b" }}
{{ $s }} → [a b]

{{ $s = $s | collections.Append "c" }}
{{ $s }} → [a b c]
```

Appending two elements:

```go-html-template
{{ $s := slice "a" "b" }}
{{ $s = $s | collections.Append "c" "d" }}
{{ $s }} → [a b c d]
```

Appending the elements of another slice, which produces the same result as the previous example:

```go-html-template
{{ $s := slice "a" "b" }}
{{ $s = $s | collections.Append (slice "c" "d") }}
{{ $s }} → [a b c d]
```

Starting with an empty slice:

```go-html-template
{{ $s := slice }}
{{ $s }} → []

{{ $s = $s | collections.Append "a" }}
{{ $s }} → [a]

{{ $s = $s | collections.Append "b" "c" }}
{{ $s }} → [a b c]

{{ $s = $s | collections.Append (slice "d" "e") }}
{{ $s }} → [a b c d e]
```

Appending an empty slice:

```go-html-template
{{ $s := slice "a" "b" }}
{{ $s = $s | collections.Append slice }}
{{ $s }} → [a b]
```

Appending a slice to a slice of slices:

```go-html-template
{{ $s := slice (slice "a" "b") }}
{{ $s }} → [[a b]]

{{ $s = $s | collections.Append (slice "c" "d") }}
{{ $s }} → [[a b] [c d]]
```

Creating a slice of slices, starting with an empty slice:

```go-html-template
{{ $s := slice }}
{{ $s = $s | collections.Append (slice (slice "a" "b")) }}
{{ $s }} → [[a b]]

{{ $s = $s | collections.Append (slice "c" "d") }}
{{ $s }} → [[a b] [c d]]
```

Rendering links to the two most recent press releases, followed by links to the four most recent articles:

```go-html-template
{{ $p := where site.RegularPages "Type" "press-releases" | first 2 }}
{{ $p = $p | collections.Append (where site.RegularPages "Type" "articles" | first 4) }}

{{ with $p }}
  <ul>
    {{ range . }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```
