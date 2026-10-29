---
title: strings.TrimRight
description: Returns the given string, removing trailing characters specified in the cutset.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [strings.TrimRight CUTSET STRING]
---

## Usage

The `strings.TrimRight` function returns the given string, removing trailing characters specified in the cutset. The function converts the arguments to strings if possible.

## Examples

```go-html-template
{{ strings.TrimRight "a" "abba" }} → abb
```

Converting non-string arguments:

```go-html-template
{{ strings.TrimRight 54 12345 }} → 123 (string)
{{ strings.TrimRight "eu" true }} → tr
```
