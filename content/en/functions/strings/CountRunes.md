---
title: strings.CountRunes
description: Returns the number of runes in the given string, excluding whitespace and HTML tags.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [countrunes]
    returnType: int
    signatures: [strings.CountRunes STRING]
---

## Usage

The `strings.CountRunes` function returns the number of runes in the given string, excluding whitespace and HTML tags. In contrast, the [`strings.RuneCount`][] function counts every rune in a string.

## Examples

```go-html-template
{{ "Hugo is a static site generator." | strings.CountRunes }} → 27
```

Counting runes in a string that contains HTML tags:

```go-html-template
{{ "<p>Hugo is a <em>static</em> site generator.</p>" | strings.CountRunes }} → 27
```

Counting runes in a string that contains Chinese characters:

```go-html-template
{{ "Hugo 是一个静态网站生成器" | strings.CountRunes }} → 14
```

[`strings.RuneCount`]: /functions/strings/runecount/
