---
title: strings.Truncate
description: Returns the given string, truncating it to a maximum length without cutting words or leaving unclosed HTML tags.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [truncate]
    returnType: template.HTML
    signatures: ['strings.Truncate SIZE [ELLIPSIS] STRING']
---

## Usage

The `strings.Truncate` function returns the given string, truncating it to a maximum length without cutting words or leaving unclosed HTML tags. If `STRING` is longer than `SIZE` characters, the function appends `ELLIPSIS` to the result. If you omit `ELLIPSIS`, the function appends a space followed by a horizontal ellipsis.

When truncating a value marked as safe HTML, such as one returned by the [`safe.HTML`][] function, `strings.Truncate` closes any tag left open by the truncation instead of cutting in the middle of it.

> [!NOTE]
> If you have a raw string containing HTML tags that you want treated as HTML, convert it with the [`safe.HTML`][] function first. Otherwise, `strings.Truncate` escapes the tags.

## Examples

```go-html-template
{{ "Hugo is a static site generator" | strings.Truncate 20 }} → Hugo is a static …
{{ "Hugo is a static site generator" | strings.Truncate 10 "..." }} → Hugo is a...
```

Truncating a value marked as safe HTML:

```go-html-template
{{ "<em>Keep my HTML</em>" | safeHTML | strings.Truncate 10 }} → <em>Keep my …</em>
```

[`safe.HTML`]: /functions/safe/html/
