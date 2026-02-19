---
title: Rotate
description: Returns a collection of pages that vary along the specified dimension while sharing the current page's values for the other dimensions, including the current page, sorted by the dimension's weight.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: page.Pages
    signatures: [PAGE.Rotate DIMENSION]
---

{{< new-in 0.153.0 />}}

The `Rotate` method on a `Page` object returns a collection of pages that vary along the specified [dimension](g), while holding the other dimensions constant. The result includes the current page and is sorted by the dimension's weight. For example, rotating along `language` returns all language variants that share the current page's version and role.

The `DIMENSION` argument must be one of `language`, `version`, or `role`.

To render a list of all translations of the current page, including the current page:

```go-html-template
{{ with .Rotate "language" }}
  {{ range . }}
    <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ end }}
{{ end }}
```

To render a list of all versions of the current page, including the current page:

```go-html-template
{{ with .Rotate "version" }}
  {{ range . }}
    <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ end }}
{{ end }}
```

To render a list of all [roles](g) of the current page, including the current page:

```go-html-template
{{ with .Rotate "role" }}
  {{ range . }}
    <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ end }}
{{ end }}
```
