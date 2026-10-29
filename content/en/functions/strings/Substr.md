---
title: strings.Substr
description: Returns a substring of the given string, beginning with the start position and ending after the given length.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [substr]
    returnType: string
    signatures: ['strings.Substr STRING [START] [LENGTH]']
---

## Usage

The `strings.Substr` function returns a substring of the given string, beginning with the start position and ending after the given length.

## Arguments

`STRING`
: (`string`) The string from which to extract the substring.

`START`
: (`int`) The zero-based start position, where `0` represents the first character of the string. Specify a negative value to count from the end of the string.

`LENGTH`
: (`int`) The number of characters to include. Specify a negative value to omit that number of characters from the end of the string. If omitted, the substring includes all characters from `START` to the end of the string.

## Examples

```go-html-template
{{ strings.Substr "abcdef" 0 }} → abcdef
{{ strings.Substr "abcdef" 1 }} → bcdef

{{ strings.Substr "abcdef" 0 1 }} → a
{{ strings.Substr "abcdef" 1 1 }} → b

{{ strings.Substr "abcdef" 0 -1 }} → abcde
{{ strings.Substr "abcdef" 1 -1 }} → bcde
```

Counting from the end of the string:

```go-html-template
{{ strings.Substr "abcdef" -1 }} → f
{{ strings.Substr "abcdef" -2 }} → ef

{{ strings.Substr "abcdef" -1 1 }} → f
{{ strings.Substr "abcdef" -2 1 }} → e

{{ strings.Substr "abcdef" -3 -1 }} → de
{{ strings.Substr "abcdef" -3 -2 }} → d
```
