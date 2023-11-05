---
title: Plain
description: Returns the rendered content of the given page, removing all HTML tags.
categories: []
keywords: []
action:
  related:
    - methods/page/Content
    - methods/page/RawContent
    - methods/page/PlainWords
    - methods/page/RenderShortcodes
  returnType: string
  signatures: [PAGE.Plain]
---

The `Plain` method on a `Page` object renders markdown and [shortcodes] to HTML, then strips the HTML [tags]. It does not strip HTML [entities]. The plain content does not include front matter.

To prevent Go's [html/template] package from escaping HTML entities, pass the result through the [`htmlUnescape`] function.

```go-html-template
{{ .Plain | htmlUnescape }}
```

[shortcodes]: /getting-started/glossary/#shortcode
[html/template]: https://pkg.go.dev/html/template
[entities]: https://developer.mozilla.org/en-US/docs/Glossary/Entity
[tags]: https://developer.mozilla.org/en-US/docs/Glossary/Tag
[`htmlUnescape`]: /functions/
