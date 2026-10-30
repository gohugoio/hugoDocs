---
title: Truncated
description: Reports whether the content length exceeds the summary length.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.Truncated]
    returnType: bool
    signatures: [PAGE.Markup.Render.Summary.Truncated]
---

## Usage

The `Truncated` method on a `Summary` object reports whether the content length exceeds the summary length.

You can define a [summary][] manually, in front matter, or automatically. A manual summary takes precedence over a front matter summary, and a front matter summary takes precedence over an automatic summary.

{{% include "/_common/summary-truncated-note.md" %}}

## Examples

```go-html-template
{{ .Markup.Render.Summary.Truncated }} → true
```

Rendering a "read more" link:

```go-html-template
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ $summary := .Markup.Render.Summary }}
  {{ $summary }}
  {{ if $summary.Truncated }}
    <a href="{{ .RelPermalink }}">Read more...</a>
  {{ end }}
{{ end }}
```

[summary]: /content-management/summaries/
