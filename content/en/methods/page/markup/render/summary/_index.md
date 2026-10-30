---
title: Summary
description: Returns the summary of the given page.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.Summary]
    signatures: [PAGE.Markup.Render.Summary]
---

<!-- Do not remove the manual summary divider below. -->
<!-- If you do, you will break its first literal usage on this page. -->

<!--more-->

## Usage

The `Summary` method on a `Content` object returns a `Summary` object. Use the methods on the `Summary` object to get the rendered summary, its type, and whether it is truncated. When you print a `Summary` object, Hugo prints the rendered summary.

The `Summary` method on a `Page` object returns the rendered summary, not a `Summary` object. It is equivalent to `Page.Markup.Render.Summary.Text`.

You can define a [summary][] manually, in front matter, or automatically. A manual summary takes precedence over a front matter summary, and a front matter summary takes precedence over an automatic summary.

To get the front matter summary without rendering Markdown, use the [`RawSummary`][] method on a `Page` object.

Depending on content length and how you define the summary, the summary may be equivalent to the content itself. To determine whether the content length exceeds the summary length, use the [`Truncated`][] method on the `Summary` object.

{{% include "/_common/summary-truncated-note.md" %}}

## Examples

```go-html-template
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
  {{ .Markup.Render.Summary }}
{{ end }}
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

[`RawSummary`]: /methods/page/rawsummary/
[`Truncated`]: /methods/page/markup/render/summary/truncated/
[summary]: /content-management/summaries/
