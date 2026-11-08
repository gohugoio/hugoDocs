---
title: fmt.Printf
description: Returns a string formatted according to the given format string.
keywords: []
params:
  functions_and_methods:
    aliases: [printf]
    returnType: string
    signatures: ['fmt.Printf FORMAT [INPUT]']
---

## Usage

The `fmt.Printf` function returns a string formatted according to the given format string. The function replaces each verb in `FORMAT`, such as `%s` or `%d`, with the corresponding value from `INPUT`.

{{% include "/_common/format-string.md" %}}

## Examples

```go-html-template
{{ $var := "world" }}
{{ fmt.Printf "Hello %s." $var }} → Hello world.
```

Formatting a floating-point number:

```go-html-template
{{ $pi := 3.14159265 }}
{{ fmt.Printf "Pi is approximately %.2f." $pi }} → Pi is approximately 3.14.
```

Creating an HTML attribute with the [`safe.HTMLAttr`][] function:

```go-html-template
{{ $desc := "Eat at Joe's" }}
<meta name="description" {{ fmt.Printf "content=%q" $desc | safeHTMLAttr }}>
```

The rendered output:

```html
<meta name="description" content="Eat at Joe's">
```

[`safe.HTMLAttr`]: /functions/safe/htmlattr/
