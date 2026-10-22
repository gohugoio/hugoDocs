---
title: debug.VisualizeSpaces
description: Returns the given string with spaces and other whitespace characters replaced by visible placeholders.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [debug.VisualizeSpaces STRING]
---

## Usage

The `debug.VisualizeSpaces` function returns the given string with spaces and other whitespace characters replaced by visible placeholders. Use this function to find unexpected whitespace in a string.

The function replaces these characters:

Character|Placeholder
:--|:--
Space|`[SPACE]`
Tab|`[TAB]`
Newline|`[NEWLINE]`
Carriage return|`[CR]`
Vertical tab|`[VTAB]`
Null|`[NUL]`
Unicode replacement character (U+FFFD)|`[U+FFFD]`

The `[NEWLINE]` placeholder is followed by the original newline, so each line of the input remains on its own line in the output.

## Examples

```go-html-template
{{ debug.VisualizeSpaces "foo  bar" }} → foo[SPACE][SPACE]bar
{{ debug.VisualizeSpaces "foo\tbar" }} → foo[TAB]bar
```
