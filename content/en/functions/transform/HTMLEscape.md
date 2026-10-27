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

When you print the result in an HTML template, Hugo escapes the entities again. To prevent this, pass the result through the [`safe.HTML`][] function. See [safe types][] for details.

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
[`safe.HTML`]: /functions/safe/html/
[safe types]: /quick-reference/data-types/#safe-types
