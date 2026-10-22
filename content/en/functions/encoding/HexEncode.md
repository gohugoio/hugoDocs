---
title: encoding.HexEncode
description: Returns the hexadecimal encoding of the given content.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [encoding.HexEncode INPUT]
---

## Usage

The `encoding.HexEncode` function returns the hexadecimal encoding of the given content. The function converts the input to a string before encoding it. Use the [`encoding.HexDecode`][] function to reverse the operation.

## Examples

```go-html-template
{{ "Hello world" | encoding.HexEncode }} → 48656c6c6f20776f726c64
```

[`encoding.HexDecode`]: /functions/encoding/hexdecode/
