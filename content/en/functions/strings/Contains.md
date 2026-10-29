---
title: strings.Contains
description: Reports whether the given string contains the given substring.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: bool
    signatures: [strings.Contains STRING SUBSTRING]
---

## Usage

The `strings.Contains` function reports whether the given string contains the given substring. The check is case-sensitive.

## Examples

```go-html-template
{{ strings.Contains "Hugo" "go" }} → true
{{ strings.Contains "Hugo" "Go" }} → false
```
