---
title: transform.HTMLEscape
description: Returns the given string, escaping special characters by replacing them with HTML entities.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [htmlEscape]
    returnType: string
    signatures: [transform.HTMLEscape INPUT]
---

## Usage

The `transform.HTMLEscape` function returns the given string, escaping special characters by replacing them with [HTML entities][]. It escapes these five characters:

- `&` → `&amp;`
- `<` → `&lt;`
- `>` → `&gt;`
- `'` → `&#39;`
- `"` → `&#34;`

The function returns a `string`. Go's [`html/template`][] package escapes strings in most contexts, which escapes the HTML entities in the result again. To render the result as is, pass it through the [`safe.HTML`][] function.

## Examples

```go-html-template
{{ transform.HTMLEscape "Lilo & Stitch" }} → Lilo &amp; Stitch
{{ transform.HTMLEscape "7 > 6" }} → 7 &gt; 6
```

Comparing the result with and without `safe.HTML`, showing the raw HTML output:

```go-html-template
{{ transform.HTMLEscape "Lilo & Stitch" }} → Lilo &amp;amp; Stitch
{{ transform.HTMLEscape "Lilo & Stitch" | safeHTML }} → Lilo &amp; Stitch
```

[HTML entities]: https://developer.mozilla.org/en-US/docs/Glossary/Entity
[`html/template`]: https://pkg.go.dev/html/template
[`safe.HTML`]: /functions/safe/html/
