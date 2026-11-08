---
title: fmt.Print
description: Returns the default string representation of the given arguments.
keywords: []
params:
  functions_and_methods:
    aliases: [print]
    returnType: string
    signatures: [fmt.Print INPUT]
---

## Usage

The `fmt.Print` function returns the default string representation of the given arguments. The function adds a space between two adjacent arguments when neither is a string.

## Examples

```go-html-template
{{ fmt.Print "foo" }} → foo
{{ fmt.Print "foo" "bar" }} → foobar
{{ fmt.Print 1 2 }} → 1 2
{{ fmt.Print (slice 1 2 3) }} → [1 2 3]
```
