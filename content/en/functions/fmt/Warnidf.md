---
title: fmt.Warnidf
description: Logs a suppressible WARNING from a template.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [warnidf]
    returnType: string
    signatures: ['fmt.Warnidf ID FORMAT [INPUT]']
---

## Usage

The `fmt.Warnidf` function logs a suppressible WARNING from a template. The function formats `INPUT` according to `FORMAT` and writes the result to the WARNING log. The function returns an empty string.

{{% include "/_common/format-string.md" %}}

Unlike the [`fmt.Warnf`][] function, you can suppress warnings logged by the `fmt.Warnidf` function. To suppress a warning, add its `ID` to the [`ignoreLogs`][] array in your project configuration.

## Examples

```go-html-template
{{ fmt.Warnidf "warning-42" "You should consider fixing this." }}
```

The resulting console output:

```text
WARN  You should consider fixing this.
You can suppress this warning by adding the following to your project configuration:
ignoreLogs = ['warning-42']
```

Suppressing the warning in your project configuration:

{{< code-toggle file=hugo >}}
ignoreLogs = ["warning-42"]
{{< /code-toggle >}}

[`fmt.Warnf`]: /functions/fmt/warnf/
[`ignoreLogs`]: /configuration/all/#ignorelogs
