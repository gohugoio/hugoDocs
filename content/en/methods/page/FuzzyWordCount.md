---
title: FuzzyWordCount
description: Returns the number of words in the content of the given page, rounded up to the nearest multiple of 100.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: int
    signatures: [PAGE.FuzzyWordCount]
---

## Usage

The `FuzzyWordCount` method on a `Page` object is an alias for [`Page.Markup.Render.FuzzyWordCount`][].

## Examples

```go-html-template
{{ .FuzzyWordCount }}
```

[`Page.Markup.Render.FuzzyWordCount`]: /methods/page/markup/render/fuzzywordcount/
