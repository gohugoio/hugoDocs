---
title: collections.Querify
description: Returns a URL query string from the given map, slice, or sequence of key-value pairs.
keywords: []
params:
  functions_and_methods:
    aliases: [querify]
    returnType: string
    signatures:
      - collections.Querify MAP
      - collections.Querify SLICE
      - 'collections.Querify KEY VALUE [KEY VALUE...]'
---

## Usage

The `collections.Querify` function returns a URL query string from the given map, slice, or sequence of key-value pairs. The function sorts the pairs by key, and encodes the keys and values for use in a URL.

Specify the key-value pairs as a map, a slice with an even number of elements, or an even number of scalar values. Each key must be a string. Otherwise, the function returns an error.

## Examples

These are equivalent:

```go-html-template
{{ collections.Querify (dict "a" 1 "b" 2) }} → a=1&b=2
{{ collections.Querify (slice "a" 1 "b" 2) }} → a=1&b=2
{{ collections.Querify "a" 1 "b" 2 }} → a=1&b=2
```

Encoding special characters:

```go-html-template
{{ collections.Querify "q" "hugo & go" }} → q=hugo+%26+go
```

Appending a query string to a URL, showing the raw HTML output:

```go-html-template
{{ $qs := collections.Querify (dict "a" 1 "b" 2) }}
{{ $href := printf "https://example.org?%s" $qs }}
<a href="{{ $href }}">Link</a> → <a href="https://example.org?a=1&amp;b=2">Link</a>
```

Creating a query string from a map in front matter:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
[params.query]
a = 1
b = 2
{{< /code-toggle >}}

```go-html-template
{{ collections.Querify .Params.query }} → a=1&b=2
```
