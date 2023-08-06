---
title: strings.ContainsNonSpace
description: Reports whether a string contains any non-space characters as defined by Unicode’s White Space property.
categories: [functions]
menu:
  docs:
    parent: functions
keywords: [whitespace space]
signature: ["strings.ContainsNonSpace STRING"]
relatedfuncs: ["strings.Contains","strings.ContainsAny"]
---

```go-html-template
{{ strings.ContainsNonSpace "\n" }}     → false
{{ strings.ContainsNonSpace " " }}      → false
{{ strings.ContainsNonSpace "\n abc" }} → true
```

Common white space characters include:

```text
'\t', '\n', '\v', '\f', '\r', ' '
```

See the [Unicode Character Database] for a complete list.

[Unicode Character Database]: https://www.unicode.org/Public/UCD/latest/ucd/PropList.txt
