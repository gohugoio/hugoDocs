---
title: transform.HTMLUnescape
description: Returns the given string, replacing each HTML entity with its corresponding character.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [htmlUnescape]
    returnType: string
    signatures: [transform.HTMLUnescape INPUT]
---

## Usage

The `transform.HTMLUnescape` function returns the given string, replacing each [HTML entity][] with its corresponding character.

## Examples

```go-html-template
{{ transform.HTMLUnescape "Lilo &amp; Stitch" }} → Lilo & Stitch
{{ transform.HTMLUnescape "7 &gt; 6" }} → 7 > 6
```

[HTML entity]: https://developer.mozilla.org/en-US/docs/Glossary/Entity
