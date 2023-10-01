---
title: fmt.Warnf
linkTitle: warnf
description: Log a WARNING from a template.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: [warnf]
  returnType: string
  signatures: ['fmt.Warnf FORMAT [INPUT]']
relatedFunctions:
  - fmt.Errorf
  - fmt.Erroridf
  - fmt.Warnf
aliases: [/functions/warnf]
---

The documentation for [Go's fmt package] describes the structure and content of the format string.

Like the  [`printf`] function, the `warnf` function evaluates the format string. It then prints the result to the WARNING log. Hugo prints each unique message once to avoid flooding the log with duplicate warnings.

```go-html-template
{{ warnf "Copyright notice missing from site configuration" }}
```

[`printf`]: /functions/fmt/printf
[Go's fmt package]: https://pkg.go.dev/fmt
