---
title: collections.Shuffle
description: Returns a slice by randomizing the element order of the given slice.
keywords: [random]
params:
  functions_and_methods:
    aliases: [shuffle]
    returnType: '[]any'
    signatures: [collections.Shuffle SLICE]
---

## Usage

The `collections.Shuffle` function returns a slice by randomizing the element order of the given slice. The result changes from one build to the next.

To select random pages from a page collection, the [`collections.D`][] function is faster, and lets you control the result with a seed value.

## Examples

```go-html-template
{{ collections.Shuffle (slice "a" "b" "c") }} → [b a c]
```

Rendering a list of five random pages:

```go-html-template
<ul>
  {{ range site.RegularPages | collections.Shuffle | first 5 }}
    <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
  {{ end }}
</ul>
```

[`collections.D`]: /functions/collections/d/
