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

The function returns a `string`. Go's [`html/template`][] package escapes strings in most contexts, which escapes the unescaped characters in the result again. To render the result as is, pass it through the [`safe.HTML`][] function.

## Examples

```go-html-template
{{ transform.HTMLUnescape "Lilo &amp; Stitch" }} → Lilo & Stitch
{{ transform.HTMLUnescape "7 &gt; 6" }} → 7 > 6
```

Comparing the result with and without `safe.HTML`, showing the raw HTML output:

```go-html-template
{{ transform.HTMLUnescape "Lilo &amp; Stitch" }} → Lilo &amp; Stitch
{{ transform.HTMLUnescape "Lilo &amp; Stitch" | safeHTML }} → Lilo & Stitch
```

[HTML entity]: https://developer.mozilla.org/en-US/docs/Glossary/Entity
[`html/template`]: https://pkg.go.dev/html/template
[`safe.HTML`]: /functions/safe/html/
