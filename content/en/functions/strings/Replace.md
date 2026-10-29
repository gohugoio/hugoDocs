---
title: strings.Replace
description: Returns the given string, replacing all occurrences of OLD with NEW.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [replace]
    returnType: string
    signatures: ['strings.Replace STRING OLD NEW [LIMIT]']
---

## Usage

The `strings.Replace` function returns the given string, replacing all occurrences of `OLD` with `NEW`. To limit the number of replacements, pass the optional `LIMIT` argument.

## Examples

```go-html-template
{{ $s := "Batman and Robin" }}
{{ strings.Replace $s "Robin" "Catwoman" }} → Batman and Catwoman
```

Limiting the number of replacements:

```go-html-template
{{ strings.Replace "aabbaabb" "a" "z" 2 }} → zzbbaabb
```
