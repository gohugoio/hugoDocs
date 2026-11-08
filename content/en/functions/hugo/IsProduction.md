---
title: hugo.IsProduction
description: Reports whether the current running environment is "production".
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [hugo.IsProduction]
---

## Usage

The `hugo.IsProduction` function reports whether the current running [environment](g) is `production`, the default when you run the `hugo build` command. Use the [`hugo.Environment`][] function to return the name of the current running environment.

## Examples

```go-html-template
{{ hugo.IsProduction }} → true/false
```

[`hugo.Environment`]: /functions/hugo/environment/
