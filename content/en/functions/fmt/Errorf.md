---
title: fmt.Errorf
description: Logs an ERROR from a template.
keywords: []
params:
  functions_and_methods:
    aliases: [errorf]
    returnType: string
    signatures: ['fmt.Errorf FORMAT [INPUT]']
---

## Usage

The `fmt.Errorf` function logs an ERROR from a template. The function formats `INPUT` according to `FORMAT`, writes the result to the ERROR log, and fails the build. The function returns an empty string.

{{% include "/_common/format-string.md" %}}

To allow suppression of specific errors, use the [`fmt.Erroridf`][] function instead.

## Examples

```go-html-template
{{ fmt.Errorf "The %q shortcode requires a src argument. See %s" .Name .Position }}
```

[`fmt.Erroridf`]: /functions/fmt/erroridf/
