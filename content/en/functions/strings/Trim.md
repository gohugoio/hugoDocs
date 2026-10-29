---
title: strings.Trim
description: Returns the given string, removing leading and trailing characters specified in the cutset.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [trim]
    returnType: string
    signatures: [strings.Trim STRING CUTSET]
---

## Usage

The `strings.Trim` function returns the given string, removing leading and trailing characters specified in the cutset.

## Examples

```go-html-template
{{ strings.Trim "++foo--" "+-" }} → foo
```
