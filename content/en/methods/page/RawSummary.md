---
title: RawSummary
description: Returns the summary of the given page as defined in front matter, without rendering Markdown.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.RawSummary]
---

## Usage

The `RawSummary` method on a `Page` object returns the summary of the given page as defined in front matter, without rendering Markdown.

{{< new-in 0.170.0 />}}

You can define a [summary][] manually, in front matter, or automatically. The `RawSummary` method returns only a front matter summary. If you define the summary manually or automatically, the method returns an empty string. To render the summary regardless of how you define it, use the [`Summary`][] method on a `Page` object.

## Examples

These examples use this front matter:

{{< code-toggle file=content/example.md fm=true >}}
title = 'Example'
summary = 'A **bold** word.'
{{< /code-toggle >}}

```go-html-template
{{ .RawSummary }} → A **bold** word.
```

Rendering Markdown with the [`transform.Markdownify`][] function, showing the raw HTML output:

```go-html-template
{{ .RawSummary | markdownify }} → A <strong>bold</strong> word.
```

Falling back to the page description when the front matter summary is not defined:

```go-html-template
{{ with .RawSummary }}
  {{ . | markdownify }}
{{ else }}
  {{ .Description }}
{{ end }}
```

[`Summary`]: /methods/page/summary/
[`transform.Markdownify`]: /functions/transform/markdownify/
[summary]: /content-management/summaries/
