---
title: strings.Chomp
description: Returns the given string, removing all trailing newline characters and carriage returns.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [chomp]
    returnType: any
    signatures: [strings.Chomp STRING]
---

## Usage

The `strings.Chomp` function returns the given string, removing all trailing newline characters and carriage returns. If `STRING` is of type `template.HTML`, the function returns `template.HTML`, otherwise it returns a `string`.

## Examples

```go-html-template
{{ strings.Chomp "foo\n" }} → foo
{{ strings.Chomp "foo\n\n" }} → foo

{{ strings.Chomp "foo\r\n" }} → foo
{{ strings.Chomp "foo\r\n\r\n" }} → foo
```
