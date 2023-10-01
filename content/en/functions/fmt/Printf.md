---
title: fmt.Printf
linkTitle: printf
description: Formats a string using the standard `fmt.Sprintf` function.
categories: [functions]
keywords: []
menu:
  docs:
    parent: functions
function:
  aliases: [printf]
  returnType: string
  signatures: ['fmt.Printf FORMAT [INPUT]']
relatedFunctions:
  - fmt.Print
  - fmt.Printf
  - fmt.Println
aliases: [/functions/printf]
---

The documentation for [Go's fmt package] describes the structure and content of the format string.

[Go's fmt package]: https://pkg.go.dev/fmt

```go-html-template
{{ $var := "world" }}
{{ printf "Hello %s." $var }} → Hello world.
```

```go-html-template
{{ $pi := 3.14159265 }}
{{ printf "Pi is approximately %.2f." $pi }} → 3.14
```

Use the `printf` function with the `safeHTMLAttr` function:

```go-html-template
{{ $desc := "Eat at Joe's" }}
<meta name="description" {{ printf "content=%q" $desc | safeHTMLAttr }}>
```

Hugo renders this to:

```html
<meta name="description" content="Eat at Joe's">
```
