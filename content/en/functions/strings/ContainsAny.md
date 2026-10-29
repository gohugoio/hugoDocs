---
title: strings.ContainsAny
description: Reports whether the given string contains any character within the given set.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [strings.ContainsAny STRING SET]
---

## Usage

The `strings.ContainsAny` function reports whether the given string contains any character within the given set. The check is case-sensitive.

## Examples

```go-html-template
{{ strings.ContainsAny "Hugo" "gm" }} → true
{{ strings.ContainsAny "Hugo" "Gm" }} → false
```
