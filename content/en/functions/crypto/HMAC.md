---
title: crypto.HMAC
description: Returns a cryptographic hash that uses a key to sign a message.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [hmac]
    returnType: string
    signatures: ['crypto.HMAC HASH_TYPE KEY MESSAGE [ENCODING]']
---

## Usage

The `crypto.HMAC` function returns a cryptographic hash that uses a key to sign a message. By default, the function returns the hash as a hexadecimal string. Set `ENCODING` to `binary` to return the raw bytes instead, which you can pass to another encoding function such as [`encoding.Base64Encode`][].

## Arguments

`HASH_TYPE`
: (`string`) The hash algorithm, one of `md5`, `sha1`, `sha256`, or `sha512`.

`KEY`
: (`string`) The secret key.

`MESSAGE`
: (`string`) The message to sign.

`ENCODING`
: (`string`) The encoding of the returned value, either `hex` or `binary`. Default is `hex`.

## Examples

```go-html-template
{{ crypto.HMAC "sha256" "Secret key" "Secret message" }} → 5cceb491f45f8b154e20f3b0a30ed3a6ff3027d373f85c78ffe8983180b03c84
{{ crypto.HMAC "sha256" "Secret key" "Secret message" "hex" }} → 5cceb491f45f8b154e20f3b0a30ed3a6ff3027d373f85c78ffe8983180b03c84
```

Encoding the binary result to base64:

```go-html-template
{{ crypto.HMAC "sha256" "Secret key" "Secret message" "binary" | base64Encode }} → XM60kfRfixVOIPOwow7Tpv8wJ9Nz+Fx4/+iYMYCwPIQ=
```

[`encoding.Base64Encode`]: /functions/encoding/base64encode/
