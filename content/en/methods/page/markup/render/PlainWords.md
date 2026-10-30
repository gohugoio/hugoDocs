---
title: PlainWords
description: Returns a slice of words created by calling the Plain method and splitting the result.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.PlainWords]
    returnType: '[]string'
    signatures: [PAGE.Markup.Render.PlainWords]
---

## Usage

The `PlainWords` method on a `Content` object calls the [`Plain`][] method, then uses Go's [`strings.Fields`][] function to split the result into words.

The `strings.Fields` function splits the string around each instance of one or more consecutive whitespace characters, as defined by [`unicode.IsSpace`][]. As a result, elements within the slice may contain leading or trailing punctuation.

## Examples

```go-html-template
{{ .Markup.Render.PlainWords }}
```

Determining the approximate number of unique words:

```go-html-template
{{ .Markup.Render.PlainWords | uniq | len }} → 42
```

[`Plain`]: /methods/page/markup/render/plain/
[`strings.Fields`]: https://pkg.go.dev/strings#Fields
[`unicode.IsSpace`]: https://pkg.go.dev/unicode#IsSpace
