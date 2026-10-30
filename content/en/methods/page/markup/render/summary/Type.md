---
title: Type
description: Returns the type of the summary, one of auto, manual, or frontmatter.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Markup.Render.Summary.Type]
---

## Usage

The `Type` method on a `Summary` object returns the type of the summary, which depends on how you define it. You can define a [summary][] manually, in front matter, or automatically. A manual summary takes precedence over a front matter summary, and a front matter summary takes precedence over an automatic summary.

The method returns one of these values:

`auto`
: Hugo created the summary automatically.

`frontmatter`
: You defined the summary in front matter.

`manual`
: You defined the summary with a summary divider.

## Examples

```go-html-template
{{ .Markup.Render.Summary.Type }} → manual
```

[summary]: /content-management/summaries/
