---
title: transform.CanHighlight
description: Reports whether the given language is supported for syntax highlighting.
categories: []
keywords: [highlight]
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [transform.CanHighlight LANGUAGE]
---

## Usage

The `transform.CanHighlight` function reports whether the given language is supported for syntax highlighting. The `LANGUAGE` argument is case-insensitive. See the list of [supported languages][].

If the syntax highlighter does not support a language, it renders the code without highlighting. Use this function before calling the [`transform.Highlight`][] or [`transform.HighlightCodeBlock`][] function to decide how to handle an unsupported language, such as by substituting a different language.

## Examples

```go-html-template
{{ transform.CanHighlight "go" }} → true
{{ transform.CanHighlight "klingon" }} → false
```

[`transform.Highlight`]: /functions/transform/highlight/
[`transform.HighlightCodeBlock`]: /functions/transform/highlightcodeblock/
[supported languages]: /content-management/syntax-highlighting/#languages
