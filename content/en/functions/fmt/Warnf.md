---
title: fmt.Warnf
description: Logs a WARNING from a template.
keywords: []
params:
  functions_and_methods:
    aliases: [warnf]
    returnType: string
    signatures: ['fmt.Warnf FORMAT [INPUT]']
---

## Usage

The `fmt.Warnf` function logs a WARNING from a template. The function formats `INPUT` according to `FORMAT` and writes the result to the WARNING log. The function returns an empty string.

{{% include "/_common/format-string.md" %}}

To avoid flooding the log with duplicate warnings, Hugo logs each unique message once. When you use the `fmt.Warnf` function for debugging, make each message unique with the [`math.Counter`][] function to log every message.

To allow suppression of specific warnings, use the [`fmt.Warnidf`][] function instead.

## Examples

```go-html-template
{{ fmt.Warnf "The %q shortcode was unable to find %s. See %s" .Name $file .Position }}
```

Making each message unique for debugging:

```go-html-template
{{ range site.RegularPages }}
  {{ .Section | fmt.Warnf "%#[2]v [%[1]d]" math.Counter }}
{{ end }}
```

[`fmt.Warnidf`]: /functions/fmt/warnidf/
[`math.Counter`]: /functions/math/counter/
