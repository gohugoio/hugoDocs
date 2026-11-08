---
title: fmt.Println
description: Returns the default string representation of the given arguments, followed by a line break.
keywords: []
params:
  functions_and_methods:
    aliases: [println]
    returnType: string
    signatures: [fmt.Println INPUT]
---

## Usage

The `fmt.Println` function returns the default string representation of the given arguments, followed by a line break. The function always adds a space between adjacent arguments.

## Examples

```go-html-template
{{ fmt.Println "foo" }} → foo\n
{{ fmt.Println "foo" "bar" }} → foo bar\n
{{ fmt.Println 1 2 }} → 1 2\n
```
