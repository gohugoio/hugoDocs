---
title: Rotate
description: Returns a collection of pages that vary along the specified dimension while sharing the current page's values for the other dimensions, including the current page, sorted by the dimension's default sort order.
keywords: []
params:
  functions_and_methods:
    returnType: page.Pages
    signatures: [PAGE.Rotate DIMENSION]
---

{{< new-in 0.153.0 />}}

## Usage

The `Rotate` method on a `Page` object returns a collection of pages that vary along the specified [dimension](g) of the [multidimensional content model][], while holding the other dimensions constant. The result includes the current page and is sorted according to the rules of the specified dimension. For example, rotating along [language](g) returns all language variants that share the current page's [version](g) and [role](g). The collection includes only the [sites](g) that the page is published to.

Hugo sorts the collection using these rules:

Dimension|Primary sort|Secondary sort
:--|:--|:--
Language|Weight ascending|Lexicographical ascending
Version|Weight ascending|Semantic version descending
Role|Weight ascending|Lexicographical ascending

## Arguments

`DIMENSION`
: (`string`) The dimension to rotate along, one of `language`, `version`, or `role`.

## Examples

```go-html-template
{{/* Returns languages sorted by weight ascending, then lexicographically ascending */}}
{{ range .Rotate "language" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

Rotating along the version dimension:

```go-html-template
{{/* Returns versions sorted by weight ascending, then semantic version descending */}}
{{ range .Rotate "version" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

Rotating along the role dimension:

```go-html-template
{{/* Returns roles sorted by weight ascending, then lexicographically ascending */}}
{{ range .Rotate "role" }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```

[multidimensional content model]: /content-management/content-dimensions/
