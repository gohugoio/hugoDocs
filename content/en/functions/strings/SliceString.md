---
title: strings.SliceString
description: Returns a substring of the given string, beginning with the start position and ending before the end position.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [slicestr]
    returnType: string
    signatures: ['strings.SliceString STRING [START] [END]']
---

## Usage

The `strings.SliceString` function returns a substring of the given string, beginning with the start position and ending before the end position. The `START` and `END` positions are zero-based, where `0` represents the first character of the string. If you omit `START`, the substring begins at position `0`. If you omit `END`, the substring ends after the last character.

The `START` and `END` arguments represent the endpoints of a half-open [interval](g), a concept that may be difficult to grasp when first encountered. You may find that the [`strings.Substr`][] function is easier to understand.

## Examples

```go-html-template
{{ strings.SliceString "BatMan" }} → BatMan
{{ strings.SliceString "BatMan" 3 }} → Man
{{ strings.SliceString "BatMan" 0 3 }} → Bat
```

[`strings.Substr`]: /functions/strings/substr/
