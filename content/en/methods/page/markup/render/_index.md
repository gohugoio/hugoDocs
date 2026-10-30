---
title: Render
description: Renders the content of the given page and returns a Content object.
categories: []
keywords: []
params:
  functions_and_methods:
    signatures: [PAGE.Markup.Render]
---

## Usage

The `Render` method on a `Markup` object renders the content of the given page and returns a `Content` object. Use the methods on the `Content` object to get the rendered content and information about it.

Hugo renders the content within the scope passed to the [`Markup`][] method on a `Page` object, and caches the result.

## Examples

```go-html-template
{{ with .Markup.Render }}
  {{ .Content }}
  <p>{{ .WordCount }} words, {{ .ReadingTime }} minute read</p>
{{ end }}
```

Rendering the content within a named scope:

```go-html-template
{{ with .Markup "home" }}
  {{ .Render.Content }}
{{ end }}
```

[`Markup`]: /methods/page/markup/
