---
title: Plain
description: Returns the rendered content of the given page, removing all HTML tags.
categories: []
keywords: []
params:
  functions_and_methods:
    aliases: [PAGE.Plain]
    returnType: string
    signatures: [PAGE.Markup.Render.Plain]
---

## Usage

The `Plain` method on a `Content` object renders Markdown and [shortcodes](g) to HTML, then strips the HTML [tags][]. It does not strip HTML [entities][].

To prevent Go's [`html/template`][] package from escaping HTML entities, pass the result through the [`htmlUnescape`][] function.

## Examples

```go-html-template
{{ .Markup.Render.Plain | htmlUnescape }}
```

[`html/template`]: https://pkg.go.dev/html/template
[`htmlUnescape`]: /functions/transform/htmlunescape/
[entities]: https://developer.mozilla.org/en-US/docs/Glossary/Entity
[tags]: https://developer.mozilla.org/en-US/docs/Glossary/Tag
