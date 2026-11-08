---
title: hash.XxHash
description: Returns the 64-bit xxHash non-cryptographic hash of the given string.
keywords: []
params:
  functions_and_methods:
    aliases: [xxhash]
    returnType: string
    signatures: [hash.XxHash STRING]
---

## Usage

The `hash.XxHash` function returns the 64-bit xxHash non-cryptographic hash of the given string, as a hexadecimal string.

[xxHash][] is a fast non-cryptographic hash algorithm. Hugo uses the [`cespare/xxhash`][] package to compute the hash.

## Examples

```go-html-template
{{ hash.XxHash "Hello world" }} → c500b0c912b376d8
```

[`cespare/xxhash`]: https://github.com/cespare/xxhash
[xxHash]: https://xxhash.com/
