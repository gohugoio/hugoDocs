---
title: Layout
description: Returns the layout of the given page as defined in front matter.
keywords: []
params:
  functions_and_methods:
    returnType: string
    signatures: [PAGE.Layout]
---

## Usage

The `Layout` method on a `Page` object returns the layout of the given page as defined by the [`layout`][] field in front matter. If the `layout` field is not defined, the method returns an empty string.

Set the `layout` field in front matter to [target a specific template][]. This method is rarely used within a template.

## Examples

Given this front matter:

{{< code-toggle file=content/contact.md fm=true >}}
title = 'Contact'
layout = 'contact'
{{< /code-toggle >}}

```go-html-template
{{ .Layout }} → contact
```

[`layout`]: /content-management/front-matter/#layout
[target a specific template]: /templates/lookup-order/#target-a-template
