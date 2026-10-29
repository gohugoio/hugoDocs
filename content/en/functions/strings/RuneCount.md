---
title: strings.RuneCount
description: Returns the number of runes in the given string, including whitespace and HTML tags.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: int
    signatures: [strings.RuneCount STRING]
---

## Usage

The `strings.RuneCount` function returns the number of runes in the given string, including whitespace and HTML tags. In contrast, the [`strings.CountRunes`][] function excludes whitespace and HTML tags.

## Examples

```go-html-template
{{ "Hugo is a static site generator." | strings.RuneCount }} → 32
```

Counting runes in a string that contains HTML tags:

```go-html-template
{{ "<p>Hugo is a <em>static</em> site generator.</p>" | strings.RuneCount }} → 48
```

Counting runes in a string that contains Chinese characters:

```go-html-template
{{ "Hugo 是一个静态网站生成器" | strings.RuneCount }} → 15
```

[`strings.CountRunes`]: /functions/strings/countrunes/
