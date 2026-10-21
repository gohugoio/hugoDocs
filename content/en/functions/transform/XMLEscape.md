---
title: transform.XMLEscape
description: Returns the given string, removing disallowed characters then escaping the result to its XML equivalent.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: []
    returnType: string
    signatures: [transform.XMLEscape INPUT]
---

## Usage

The `transform.XMLEscape` function removes [disallowed characters][] as defined in the XML specification, then escapes the result by replacing these characters with [HTML entities][]:

- `"` → `&#34;`
- `'` → `&#39;`
- `&` → `&amp;`
- `<` → `&lt;`
- `>` → `&gt;`
- `\t` → `&#x9;`
- `\n` → `&#xA;`
- `\r` → `&#xD;`

The function returns a `string`. Go's [`html/template`][] package escapes strings in most contexts, which escapes the entities in the result again. To render the result as is, pass it through the [`safe.HTML`][] function.

## Examples

```go-html-template
{{ transform.XMLEscape "<p>abc</p>" }} → &lt;p&gt;abc&lt;/p&gt;
```

Comparing the result with and without `safe.HTML`, showing the raw HTML output:

```go-html-template
{{ transform.XMLEscape "<p>abc</p>" }} → &amp;lt;p&amp;gt;abc&amp;lt;/p&amp;gt;
{{ transform.XMLEscape "<p>abc</p>" | safeHTML }} → &lt;p&gt;abc&lt;/p&gt;
```

In an RSS template:

```xml {file="layouts/rss.xml"}
<description>{{ .Summary | transform.XMLEscape | safeHTML }}</description>
```

[HTML entities]: https://developer.mozilla.org/en-US/docs/Glossary/Entity
[`html/template`]: https://pkg.go.dev/html/template
[`safe.HTML`]: /functions/safe/html/
[disallowed characters]: https://www.w3.org/TR/xml/#charsets
