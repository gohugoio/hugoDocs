---
title: encoding.HexDecode
description: Returns the hexadecimal decoding of the given content.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [encoding.HexDecode INPUT]
---

## Usage

The `encoding.HexDecode` function returns the hexadecimal decoding of the given content. The function throws an error if the input is not a valid hexadecimal string. Use the [`encoding.HexEncode`][] function to reverse the operation.

## Examples

```go-html-template
{{ "48656c6c6f20776f726c64" | encoding.HexDecode }} → Hello world
```

[`encoding.HexEncode`]: /functions/encoding/hexencode/
