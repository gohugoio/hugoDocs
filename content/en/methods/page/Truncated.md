---
title: Truncated
description: Reports whether the content length exceeds the summary length.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: bool
    signatures: [PAGE.Truncated]
---

You can define a [summary][] manually, in front matter, or automatically. A manual summary takes precedence over a front matter summary, and a front matter summary takes precedence over an automatic summary.

The `Truncated` method returns `true` if the content length exceeds the summary length. This is useful for conditionally rendering a "read more" link:

```go-html-template
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ .Summary }}
  {{ if .Truncated }}
    <a href="{{ .RelPermalink }}">Read more...</a>
  {{ end }}
{{ end }}
```

{{% include "/_common/summary-truncated-note.md" %}}

To render the content within a named scope, call the `Truncated` method on the `Summary` object returned by `.Markup.Render.Summary`. See the [`Markup`][] method on a `Page` object.

[`Markup`]: /methods/page/markup/
[summary]: /content-management/summaries/
