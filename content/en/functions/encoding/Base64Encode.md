---
title: encoding.Base64Encode
description: Returns the base64 encoding of the given content.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [base64Encode]
    returnType: string
    signatures: [encoding.Base64Encode INPUT]
---

## Usage

The `encoding.Base64Encode` function returns the base64 encoding of the given content. The function converts the input to a string before encoding it. Use the [`encoding.Base64Decode`][] function to reverse the operation.

## Examples

```go-html-template
{{ "Hugo" | encoding.Base64Encode }} → SHVnbw==
{{ 42 | encoding.Base64Encode }} → NDI=
```

[`encoding.Base64Decode`]: /functions/encoding/base64decode/
