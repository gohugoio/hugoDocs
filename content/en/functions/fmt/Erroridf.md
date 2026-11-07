---
title: fmt.Erroridf
description: Logs a suppressible ERROR from a template.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [erroridf]
    returnType: string
    signatures: ['fmt.Erroridf ID FORMAT [INPUT]']
---

## Usage

The `fmt.Erroridf` function logs a suppressible ERROR from a template. The function formats `INPUT` according to `FORMAT`, writes the result to the ERROR log, and fails the build. The function returns an empty string.

{{% include "/_common/format-string.md" %}}

Unlike the [`fmt.Errorf`][] function, you can suppress errors logged by the `fmt.Erroridf` function. To suppress an error, add its `ID` to the [`ignoreLogs`][] array in your project configuration. Hugo does not log a suppressed error, and the build does not fail.

## Examples

```go-html-template
{{ fmt.Erroridf "error-42" "You should consider fixing this." }}
```

The resulting console output:

```text
ERROR You should consider fixing this.
You can suppress this error by adding the following to your project configuration:
ignoreLogs = ['error-42']
```

Suppressing the error in your project configuration:

{{< code-toggle file=hugo >}}
ignoreLogs = ["error-42"]
{{< /code-toggle >}}

[`fmt.Errorf`]: /functions/fmt/errorf/
[`ignoreLogs`]: /configuration/all/#ignorelogs
