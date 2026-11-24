---
title: collections.Complement
description: Returns a slice by identifying elements in the last given slice that do not appear in any of the preceding slices.
keywords: []
params:
  functions_and_methods:
    aliases: [complement]
    returnType: '[]any'
    signatures: [collections.Complement SLICE SLICE...]
---

## Usage

The `collections.Complement` function returns a slice by identifying elements in the last given slice that do not appear in any of the preceding slices. The function requires at least two slices. It keeps duplicate elements in the last slice, and keeps the elements in their original order.

To exclude pages of one or more types from a page collection, you can also use the [`collections.Where`][] function with the `not in` operator.

## Examples

This example returns the elements of `$s3` that do not appear in `$s1` or `$s2`:

```go-html-template
{{ $s1 := slice 3 }}
{{ $s2 := slice 4 5 }}
{{ $s3 := slice 1 2 3 4 5 }}

{{ collections.Complement $s1 $s2 $s3 }} → [1 2]
```

Using a [chained pipeline](g):

```go-html-template
{{ $s3 | collections.Complement $s1 $s2 }} → [1 2]
```

Rendering links to all regular pages except those with a content type of `blog` or `faqs`:

```go-html-template
{{ $blog := where site.RegularPages "Type" "blog" }}
{{ $faqs := where site.RegularPages "Type" "faqs" }}
{{ range site.RegularPages | collections.Complement $blog $faqs }}
  <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
{{ end }}
```

Removing [stop words][] from a sentence:

```go-html-template
{{ $text := "The quick brown fox jumps over the lazy dog" }}
{{ $stopWords := slice "a" "an" "in" "over" "the" "under" }}
{{ $filtered := split $text " " | collections.Complement $stopWords }}

{{ delimit $filtered " " }} → The quick brown fox jumps lazy dog
```

[`collections.Where`]: /functions/collections/where/
[stop words]: https://en.wikipedia.org/wiki/Stop_word
