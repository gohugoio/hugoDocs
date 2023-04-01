---
title: strings.RuneCount
description: Determines the number of runes in a string.
categories: [functions]
menu:
  docs:
    parent: functions
keywords: [counting, character count, length, rune length, rune count]
signature: ["strings.RuneCount INPUT"]
relatedfuncs: ["len", "countrunes"]
---

In contrast with `strings.CountRunes` function, which strips HTML and whitespace before counting runes, `strings.RuneCount` simply counts all the runes in a string. It relies on the Go [`utf8.RuneCountInString`] function.

```go-html-template
{{ "Hello, 世界" | strings.RuneCount }}
<!-- outputs a content length of 9 runes. -->
```

[`utf8.RuneCount`]: https://golang.org/pkg/unicode/utf8/#RuneCount
