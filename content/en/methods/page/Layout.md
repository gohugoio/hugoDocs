---
title: Layout
description: Returns the layout for the given page as defined in front matter.
categories: []
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Layout]
---

The `Layout` method on a `Page` object returns the layout of the given page as defined by the [`layout`][] field in front matter. If the `layout` field is not defined, the method returns an empty string.

For example, given this front matter:

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
layout = 'contact'
{{< /code-toggle >}}

Calling the method returns:

```go-html-template
{{ .Layout }} → contact
```

This method is rarely used within a template. See [details][] for information on how the `layout` field affects template selection.

[`layout`]: /content-management/front-matter/#layout
[details]: /templates/lookup-order/#using-layout
