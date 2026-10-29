---
title: Plain
description: Returns the rendered content of the given page, removing all HTML tags.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Plain]
---

The `Plain` method on a `Page` object renders Markdown and [shortcodes](g) to HTML, then strips the HTML [tags][]. It does not strip HTML [entities][].

To prevent Go's [`html/template`][] package from escaping HTML entities, pass the result through the [`htmlUnescape`][] function.

```go-html-template
{{ .Plain | htmlUnescape }}
```

To render the content within a named scope, call the `Plain` method on the `Content` object returned by `.Markup.Render`. See the [`Markup`][] method on a `Page` object.

[`Markup`]: /methods/page/markup/
[`html/template`]: https://pkg.go.dev/html/template
[`htmlUnescape`]: /functions/transform/htmlunescape/
[entities]: https://developer.mozilla.org/en-US/docs/Glossary/Entity
[tags]: https://developer.mozilla.org/en-US/docs/Glossary/Tag
