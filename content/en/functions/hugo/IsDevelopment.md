---
title: hugo.IsDevelopment
description: Reports whether the current running environment is "development".
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [hugo.IsDevelopment]
---

## Usage

The `hugo.IsDevelopment` function reports whether the current running [environment](g) is `development`, the default when you run the `hugo server` command. Use the [`hugo.Environment`][] function to return the name of the current running environment.

## Examples

```go-html-template
{{ hugo.IsDevelopment }} → true/false
```

[`hugo.Environment`]: /functions/hugo/environment/
