---
title: crypto.SHA1
description: Returns the SHA1 checksum of the given input, encoded to a hexadecimal string.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [sha1]
    returnType: string
    signatures: [crypto.SHA1 INPUT]
---

## Usage

The `crypto.SHA1` function returns the SHA1 checksum of the given input, encoded to a hexadecimal string.

## Examples

```go-html-template
{{ crypto.SHA1 "Hello world" }} → 7b502c3a1f48c8609ae212cdfb639dee39673f5e
```
