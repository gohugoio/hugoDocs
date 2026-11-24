---
title: collections.Group
description: Returns a page group by labeling the given page collection with the given key.
keywords: []
params:
  functions_and_methods:
    aliases: [group]
    returnType: page.PageGroup
    signatures: [collections.Group KEY PAGES]
---

## Usage

The `collections.Group` function returns a page group by labeling the given [page collection](g) with the given key. The returned page group has the same type as each element returned by the [page grouping methods][], so you can combine page groups that you create with this function into a slice and [paginate][] them.

Use these methods on the `PageGroup` object:

`Key`
: (`any`) Returns the key.

`Pages`
: (`page.Pages`) Returns the page collection.

## Examples

This example creates one page group from the first 10 regular pages and another from the last 10, then renders a heading and a list of links for each group:

```go-html-template
{{ $new := site.RegularPages | first 10 | collections.Group "New" }}
{{ $old := site.RegularPages | last 10 | collections.Group "Old" }}
{{ range slice $new $old }}
  <h2>{{ .Key }}</h2>
  <ul>
    {{ range .Pages }}
      <li><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
  </ul>
{{ end }}
```

[page grouping methods]: /quick-reference/page-collections/#group
[paginate]: /templates/pagination/
